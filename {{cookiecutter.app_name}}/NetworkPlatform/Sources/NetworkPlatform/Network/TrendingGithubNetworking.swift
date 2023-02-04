//
//  TrendingGithubNetworking.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Domain
import Foundation
import Moya

struct TrendingGithubNetworking: NetworkingType {
    typealias T = TrendingGithubAPI
    let provider: OnlineProvider<T>

    static func defaultNetworking() -> Self {
        return TrendingGithubNetworking(provider:
            OnlineProvider(endpointClosure: TrendingGithubNetworking.endpointsClosure(),
                           requestClosure: TrendingGithubNetworking.endpointResolver(),
                           stubClosure: TrendingGithubNetworking.APIKeysBasedStubBehaviour,
                           online: Just(true).setFailureType(to: Never.self)
                .eraseToAnyPublisher()))
    }

    static func stubbingNetworking() -> Self {
        return TrendingGithubNetworking(provider:
            OnlineProvider(endpointClosure: endpointsClosure(),
                           requestClosure: TrendingGithubNetworking.endpointResolver(),
                           stubClosure: MoyaProvider.immediatelyStub,
                           online: Just(true).setFailureType(to: Never.self)
                               .eraseToAnyPublisher()))
    }

    func request(_ target: T) -> AnyPublisher<Moya.Response, MoyaError> {
        let actualRequest = provider.request(target)
        return actualRequest
    }

    private func trendingRequestObject<T: Codable>(_ target: TrendingGithubAPI,
                                                   type _: T.Type) async throws -> T
    {
        return try await request(target)
            .filterSuccessfulStatusCodes()
            .map(T.self)
            .mapError { error -> AppError in
                AppError(code: error.errorCode, title: nil, message: error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .async()
    }

    private func trendingRequestArray<T: Codable>(_ target: TrendingGithubAPI,
                                                  type _: T.Type) async throws -> [T]
    {
        return try await request(target)
            .filterSuccessfulStatusCodes()
            .map([T].self)
            .mapError { error -> AppError in
                AppError(code: error.errorCode, title: nil, message: error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .async()
    }
}

extension TrendingGithubNetworking {
    func trendingRepositories(language: String,
                              since: String) async throws -> [TrendingRepository]
    {
        return try await trendingRequestArray(.trendingRepositories(language: language,
                                                                    since: since),
                                              type: TrendingRepository.self)
    }

    func trendingDevelopers(language: String,
                            since: String) async throws -> [TrendingUser]
    {
        return try await trendingRequestArray(.trendingDevelopers(language: language,
                                                                  since: since),
                                              type: TrendingUser.self)
    }
}

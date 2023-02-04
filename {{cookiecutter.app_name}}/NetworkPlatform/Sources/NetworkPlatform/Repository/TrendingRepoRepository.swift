//
//  TrendingGithubUseCase.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Domain

struct TrendingRepoRepository: Domain.TrendingRepoRepository {
    private let network: TrendingGithubNetworking

    init(network: TrendingGithubNetworking) {
        self.network = network
    }

    func trendingRepositories(language: String, since: String) async throws -> [TrendingRepository] {
        return try await network.trendingRepositories(language: language, since: since)
    }
}

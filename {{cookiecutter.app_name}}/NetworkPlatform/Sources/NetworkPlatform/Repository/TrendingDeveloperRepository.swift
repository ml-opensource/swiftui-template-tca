//
//  TrendingDeveloperRepository.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Domain

struct TrendingDeveloperRepository: Domain.TrendingDeveloperRepository {
    private let network: TrendingGithubNetworking

    init(network: TrendingGithubNetworking) {
        self.network = network
    }

    func trendingDeveloper(language: String, since: String) async throws -> [TrendingUser] {
        return try await network.trendingDevelopers(language: language, since: since)
    }
}

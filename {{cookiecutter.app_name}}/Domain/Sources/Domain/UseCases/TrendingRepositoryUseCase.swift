//
//  TrendingRepositoryUseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Foundation

public typealias AnyRepositoryUseCase = AnyUsecase<(language: String, since: String), [TrendingRepository]>

public final class DefaultTrendingRepositoryUseCase: UseCase {
    private let repository: TrendingRepoRepository

    public init(repository: TrendingRepoRepository) {
        self.repository = repository
    }

    public func execute(input: (language: String, since: String)) async throws -> [TrendingRepository] {
        return try await repository.trendingRepositories(language: input.language, since: input.since)
    }
}

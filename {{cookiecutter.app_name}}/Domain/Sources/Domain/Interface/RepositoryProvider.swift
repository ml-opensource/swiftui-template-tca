//
//  RepositoryProvider.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public protocol RepositoryProvider {
    func makeTrendingRepoRepository() -> TrendingRepoRepository
    func makeTrendingDeveloperRepository() -> TrendingDeveloperRepository
}

//
//  TrendingDeveloperRepository.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Foundation

public protocol TrendingDeveloperRepository {
    func trendingDeveloper(language: String, since: String) async throws -> [TrendingUser]
}

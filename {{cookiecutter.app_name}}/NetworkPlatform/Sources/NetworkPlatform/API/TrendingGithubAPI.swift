//
//  TrendingGithubAPI.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import BuildConfiguration
import Moya

enum TrendingGithubAPI {
    case trendingRepositories(language: String, since: String)
    case trendingDevelopers(language: String, since: String)
    case languages
}

extension TrendingGithubAPI: TargetType, ProductAPIType, Stubbable {
    var baseURL: URL {
        return URL(string: BuildConfiguration.shared.baseURLString)!
    }

    var path: String {
        switch self {
        case .trendingRepositories: return "/repositories"
        case .trendingDevelopers: return "/developers"
        case .languages: return "/languages"
        }
    }

    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case let .trendingRepositories(language, since),
             let .trendingDevelopers(language, since):
            params["language"] = language
            params["since"] = since
        default: break
        }
        return params
    }

    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    var sampleData: Data {
        var fileName = ""
        switch self {
        case .trendingDevelopers:
            fileName = "UserTrendings"
        case .trendingRepositories:
            fileName = "RepositoryTrendings"
        case .languages:
            fileName = "Languages"
        }
        return stubbedResponse(fileName)
    }

    var task: Task {
        if let parameters = parameters {
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
        return .requestPlain
    }

    var addXAuth: Bool {
        switch self {
        default: return false
        }
    }
}

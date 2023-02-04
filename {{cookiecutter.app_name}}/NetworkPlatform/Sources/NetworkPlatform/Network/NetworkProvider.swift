//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

final class NetworkProvider {
    public func makeTrendingGithubNetworking() -> TrendingGithubNetworking {
        return TrendingGithubNetworking.defaultNetworking()
    }

    public func makeTrendingGithubNetworkingStubbed() -> TrendingGithubNetworking {
        return TrendingGithubNetworking.stubbingNetworking()
    }
}

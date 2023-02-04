//
//  VerbosePlugin.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Foundation
import Moya

struct VerbosePlugin: PluginType {
    let verbose: Bool

    func prepare(_ request: URLRequest, target _: TargetType) -> URLRequest {
        #if DEBUG
            if let body = request.httpBody,
               let str = String(data: body, encoding: .utf8)
            {
                if verbose {
                    print("request to send: \(str))")
                }
            }
        #endif
        return request
    }

    func didReceive(_ result: Result<Response, MoyaError>, target _: TargetType) {
        #if DEBUG
            switch result {
            case let .success(body):
                if verbose {
                    print("Response:")
                    if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers)
                    {
                        print(json)
                    } else {
                        let response = String(data: body.data, encoding: .utf8)!
                        print(response)
                    }
                }
            case .failure:
                break
            }
        #endif
    }
}

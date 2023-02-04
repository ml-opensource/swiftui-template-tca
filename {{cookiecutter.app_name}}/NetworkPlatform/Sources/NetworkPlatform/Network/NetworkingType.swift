//
//  NetworkingType.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Alamofire
import Combine
import Foundation
import Moya

protocol ProductAPIType {
    var addXAuth: Bool { get }
}

protocol NetworkingType {
    associatedtype T: TargetType, ProductAPIType
    var provider: OnlineProvider<T> { get }

    static func defaultNetworking() -> Self
    static func stubbingNetworking() -> Self
}

extension NetworkingType {
    static func endpointsClosure<T>(_: String? = nil) -> (T) -> Endpoint where T: TargetType, T: ProductAPIType
    {
        return { target in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
            print(endpoint.url)
            // Sign all non-XApp, non-XAuth token requests
            return endpoint
        }
    }

    static func APIKeysBasedStubBehaviour<T>(_: T) -> Moya.StubBehavior {
        return .never
    }

    static var plugins: [PluginType] {
        var plugins: [PluginType] = []
        plugins.append(NetworkLoggerPlugin())
        return plugins
    }

    // (Endpoint<Target>, NSURLRequest -> Void) -> Void
    static func endpointResolver() -> MoyaProvider<T>.RequestClosure {
        return { endpoint, closure in
            do {
                var request = try endpoint.urlRequest() // endpoint.urlRequest
                request.httpShouldHandleCookies = false
                closure(.success(request))
            } catch {
                // TODO: print error
//                logError(error.localizedDescription)
            }
        }
    }

//    func requestObject<Element: Codable>(_ target: T, type: Element.Type) -> AnyPublisher<Element, NetworkingError> {
//        return provider.request(target)
//            .filterSuccessfulStatusCodes()
//            .map(Element.self)
//            .mapError { NetworkingError.error($0.localizedDescription) }
//        // TODO: fetch from cache
//            .tryCatch { _ in self.coreDataManager.localRandom() }
//            .mapError { NetworkingError.error($0.localizedDescription) }
//            .eraseToAnyPublisher()
//    }

    func requestArray<Element: Codable>(_ target: T, type _: Element.Type) -> AnyPublisher<[Element], NetworkingError> {
        provider.request(target)
            .filterSuccessfulStatusCodes()
            .map([Element].self)
            .mapError { NetworkingError.error($0.localizedDescription) }
            // TODO: fetch from cache
//            .tryCatch { _ in self.coreDataManager.localRandom() }
            .mapError { NetworkingError.error($0.localizedDescription) }
            .eraseToAnyPublisher()
    }
}

// MARK: - Provider support

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject {}

    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}

private extension String {
    var URLEscapedString: String {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

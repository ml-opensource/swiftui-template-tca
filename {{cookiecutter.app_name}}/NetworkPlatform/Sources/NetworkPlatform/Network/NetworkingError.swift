//
//  NetworkingError.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
  case error(String)
  case defaultError

  var message: String {
    switch self {
    case let .error(msg):
      return msg
    case .defaultError:
      return "Please try again later."
    }
  }
}

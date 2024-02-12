//
//  UseCase.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public protocol UseCase {
  associatedtype Input
  associatedtype Output

  func execute(input: Input) async throws -> Output
}

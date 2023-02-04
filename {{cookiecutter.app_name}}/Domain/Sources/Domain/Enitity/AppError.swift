//
//  AppError.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct AppError: Error, Equatable, Sendable {
    public let code: Int?
    public let title: String?
    public let message: String?

    public init(code: Int?, title: String?, message: String?) {
        self.code = code
        self.title = title
        self.message = message
    }
}

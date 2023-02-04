//
//  UserRepo.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct UserRepo: Codable, Sendable {
    public var name: String?
    public var descriptionField: String?
    public var url: String?

    public init(name: String?, descriptionField: String?, url: String?) {
        self.name = name
        self.descriptionField = descriptionField
        self.url = url
    }

    enum CodingKeys: String, CodingKey {
        case name, url
        case descriptionField = "description"
    }
}

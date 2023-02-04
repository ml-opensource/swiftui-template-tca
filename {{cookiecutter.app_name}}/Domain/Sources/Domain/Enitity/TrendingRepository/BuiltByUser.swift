//
//  BuiltByUser.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct BuiltByUser: Codable, Sendable {
    public var username: String?
    public var href: String?
    public var avatar: String?

    public init(username: String?, href: String?, avatar: String?) {
        self.username = username
        self.href = href
        self.avatar = avatar
    }

    enum CodingKeys: String, CodingKey {
        case username, href, avatar
    }
}

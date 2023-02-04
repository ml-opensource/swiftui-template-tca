//
//  TrendingRepository.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct TrendingRepository: Codable, Equatable, Sendable {
    public var author: String?
    public var name: String?
    public var avatar: String?
    public var descriptionField: String?
    public var url: String?
    public var language: String?
    public var languageColor: String?
    public var stars: Int?
    public var forks: Int?
    public var currentPeriodStars: Int?
    public var builtBy: [BuiltByUser]?

    public var fullname: String? {
        return "\(author ?? "")/\(name ?? "")"
    }

    public var avatarUrl: String? {
        return builtBy?.first?.avatar
    }

    public init(author: String?,
                name: String?,
                avatar: String?,
                url: String?,
                descriptionField: String?,
                language: String?,
                languageColor: String?,
                stars: Int?,
                forks: Int?,
                currentPeriodStars: Int?,
                builtBy: [BuiltByUser]?)
    {
        self.author = author
        self.name = name
        self.avatar = avatar
        self.url = url
        self.descriptionField = descriptionField
        self.language = language
        self.languageColor = languageColor
        self.stars = stars
        self.forks = forks
        self.currentPeriodStars = currentPeriodStars
        self.builtBy = builtBy
    }

    enum CodingKeys: String, CodingKey {
        case author, name, avatar, url, language, languageColor, stars, forks, currentPeriodStars, builtBy
        case descriptionField = "description"
    }
}

extension TrendingRepository: Hashable {
    public static func == (lhs: TrendingRepository, rhs: TrendingRepository) -> Bool {
        return lhs.fullname == rhs.fullname
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(fullname)
    }
}

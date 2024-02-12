//
//  Product.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct Product: Codable, Equatable, Hashable {
  public let id: Int
  public let price: Double
  public let title: String
  public let image: String
  //    public let rating: Rating
  public let category: String
  public let description: String

  public init(
    id: Int,
    price: Double,
    title: String,
    image: String,
    //        rating: Rating,
    category: String,
    description: String
  ) {
    self.id = id
    self.price = price
    self.title = title
    self.image = image
    //        self.rating = rating
    self.category = category
    self.description = description
  }
}
//
//// MARK: - Rating
//public struct Rating: Codable, Equatable, Hashable {
//    public let rate: Double
//    public let count: Int
//
//    public init(rate: Double, count: Int) {
//        self.rate = rate
//        self.count = count
//    }
//}

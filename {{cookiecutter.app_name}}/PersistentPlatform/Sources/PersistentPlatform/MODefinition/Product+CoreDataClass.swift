//
//  Product+CoreDataClass.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import CoreData
import Domain
import Foundation

@objc(Product)
public class Product: NSManagedObject {}

// MARK: DomainConvertible

extension Product: DomainConvertible {
  public typealias DomainType = Domain.Product

  public func asDomain(context: NSManagedObjectContext) -> Domain.Product {
    context.performAndWait { [self] in
      Domain.Product(
        id: .init(id) ?? 0, price: price, title: title, image: image,
        category: category, description: productDescription)
    }
  }
}

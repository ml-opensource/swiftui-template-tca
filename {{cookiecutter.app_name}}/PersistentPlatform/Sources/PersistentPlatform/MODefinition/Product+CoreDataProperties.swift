//
//  Product+CoreDataProperties.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import CoreData
import Domain

extension Product {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
    return NSFetchRequest<Product>(entityName: "Product")
  }

  @NSManaged public var id: String
  @NSManaged public var price: Double
  @NSManaged public var title: String
  @NSManaged public var image: String
  @NSManaged public var category: String
  @NSManaged public var productDescription: String
}

//
//  DomainConvertible.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import CoreData
import Domain
import Foundation

public protocol DomainConvertible {
  associatedtype DomainType
  func asDomain(context: NSManagedObjectContext) -> DomainType
}

extension Array: DomainConvertible where Element: DomainConvertible {
  public func asDomain(context: NSManagedObjectContext) -> [Element.DomainType]
  {
    self.map { $0.asDomain(context: context) }
  }
}

extension Set: DomainConvertible where Element: DomainConvertible {
  public func asDomain(context: NSManagedObjectContext) -> [Element.DomainType]
  {
    self.map { $0.asDomain(context: context) }
  }
}

extension NSOrderedSet {
  func asDomain<DomainElement, EntityType: DomainConvertible>(
    context: NSManagedObjectContext, entityElementType: EntityType.Type
  ) -> [DomainElement] where EntityType.DomainType == DomainElement {
    return self.compactMap { ($0 as? EntityType)?.asDomain(context: context) }
  }
}

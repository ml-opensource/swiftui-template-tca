//
//  NSManagedObjectModel+Compatible.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import CoreData
import Foundation

extension NSManagedObjectModel {
  static func compatibleModelForStoreMetadata(_ metadata: [String: Any])
    -> NSManagedObjectModel?
  {
    NSManagedObjectModel.mergedModel(
      from: [Bundle.module], forStoreMetadata: metadata)
  }
}

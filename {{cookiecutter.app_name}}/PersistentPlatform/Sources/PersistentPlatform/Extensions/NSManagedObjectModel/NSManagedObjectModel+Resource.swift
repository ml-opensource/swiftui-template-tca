//
//  NSManagedObjectModel+Resource.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import CoreData
import Domain
import Utilities

extension NSManagedObjectModel {
  static func managedObjectModel(forResource resource: String) throws
    -> NSManagedObjectModel
  {
    let omoURL = Bundle.module.url(
      forResource: resource, withExtension: "omo",
      subdirectory: Constants.CoreData.subdirectory)
    let momURL = Bundle.module.url(
      forResource: resource, withExtension: "mom",
      subdirectory: Constants.CoreData.subdirectory)

    guard let url = omoURL ?? momURL else {
      throw AppError.databaseCorrupted("Unable to find model in bundle.")
    }
    guard let model = NSManagedObjectModel(contentsOf: url) else {
      throw AppError.databaseCorrupted("Unable to load model in bundle.")
    }
    return model
  }
}

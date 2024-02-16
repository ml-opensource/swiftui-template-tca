//
//  PreparePersistentRepository.swift
//  PersistentPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Domain
import Foundation

public struct PreparePersistentRepository: Domain.PrepareRepository {

  private let persistenceController: PersistenceController

  init(persistenceController: PersistenceController) {
    self.persistenceController = persistenceController
  }

  public func prepare() async {
    do {
      try await persistenceController.prepare()
    } catch {
      fatalError(error.localizedDescription)
    }
  }
}

extension PreparePersistentRepository {
  public static var live = PreparePersistentRepository(
    persistenceController: PersistenceController.shared)
}

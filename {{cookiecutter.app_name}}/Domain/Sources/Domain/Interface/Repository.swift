//
//  Repository.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public protocol Repository {
  associatedtype CreateInput = Never
  associatedtype CreateOutput = Never
  associatedtype ReadInput = Never
  associatedtype ReadOutput = Never
  associatedtype UpdateInput = Never
  associatedtype UpdateOutput = Never
  associatedtype DeleteInput = Never
  associatedtype DeleteOutput = Never
  associatedtype RepositoryType

  func prepare() async throws
  func create(input: CreateInput) async throws -> CreateOutput
  func read(input: ReadInput) async throws -> ReadOutput
  func update(input: UpdateInput) async throws -> UpdateOutput
  func delete(input: DeleteInput) async throws -> DeleteOutput

  static var live: RepositoryType { get }
  static var stubbed: RepositoryType { get }
}

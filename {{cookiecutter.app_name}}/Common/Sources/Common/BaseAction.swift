//
//  BaseAction.swift
//  Common
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

// keep Actions organized and their intent explicit
// https://github.com/pointfreeco/swift-composable-architecture/discussions/1440

public protocol BaseAction {
  associatedtype ViewAction
  associatedtype DelegateAction
  associatedtype InlyingAction

  static func view(_: ViewAction) -> Self
  static func delegate(_: DelegateAction) -> Self
  static func inlying(_: InlyingAction) -> Self
}

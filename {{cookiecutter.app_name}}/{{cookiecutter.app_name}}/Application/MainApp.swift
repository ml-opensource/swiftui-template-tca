//
//  MainApp.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import App
import ComposableArchitecture
import SwiftUI

#warning("Please rename to your app name")
@main
struct MainApp: App {
  var body: some Scene {
    let store = Store(
      initialState: AppFeature.State(),
      reducer: { AppFeature() }
    )

    WindowGroup {
      AppView(store: store)
    }
  }
}

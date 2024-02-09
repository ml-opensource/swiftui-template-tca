//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Commons
import ComposableArchitecture
import Resources
import SwiftUI

public struct ___VARIABLE_moduleName___View: View {
  let store: StoreOf<___VARIABLE_moduleName___Feature>

  public init(store: StoreOf<___VARIABLE_moduleName___Feature>) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Text("Hello World!!!")
        .onAppear {
          viewStore.send(.onAppear)
        }
    }
  }
}

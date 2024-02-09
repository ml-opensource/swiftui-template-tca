//
//  CounterView.swift
//  Features
//
//  Created by Rokon on 24/01/2024.
//  Copyright © 2024 MLBD. All rights reserved.
//

import Common
import ComposableArchitecture
import SwiftUI

@MainActor
public struct CounterView: View {
  let store: StoreOf<Counter>

  public init(store: StoreOf<Counter>) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewstore in
      VStack(spacing: 16) {
        HStack {
          Button {
            viewstore.send(.view(.decrementButtonTapped))
          } label: {
            Image(systemName: "minus")
          }

          Text("\(viewstore.count)")
            .monospacedDigit()

          Button {
            viewstore.send(.view(.incrementButtonTapped))
          } label: {
            Image(systemName: "plus")
          }
        }

        Button {
          viewstore.send(.view(.closeButtonTapped))
        } label: {
          Text("Dismiss")
            .foregroundStyle(.white)
            .frame(width: 120, height: 40)
            .background(.blue)
        }
      }
    }
  }
}

#Preview {
  CounterView(
    store:
      .init(
        initialState: Counter.State(),
        reducer: { Counter() }
      )
  )
}

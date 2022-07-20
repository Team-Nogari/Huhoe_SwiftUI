//
//  Huhoe_SwiftUIApp.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import SwiftUI

import ComposableArchitecture

@main
struct AppMain: App {
  var body: some Scene {
    WindowGroup {
      RootView(
        store: Store(
          initialState: RootState(),
          reducer: rootReducer,
          environment: .dev(environment: RootEnvironment())
        )
      )
    }
  }
}

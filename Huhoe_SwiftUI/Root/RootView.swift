//
//  File.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import SwiftUI

import ComposableArchitecture

struct RootView: View {
  let store: Store<RootState, RootAction>
  
  var body: some View {
    WithViewStore(self.store.stateless) { _ in
      CoinInformationListView(
        store: store.scope(
          state: \.coinInformationState,
          action: RootAction.coinInformationAction
        )
      )
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    let rootView = RootView(
      store: Store(
        initialState: RootState(),
        reducer: rootReducer,
        environment: .dev(environment: RootEnvironment())
      )
    )
    
    return rootView
  }
}

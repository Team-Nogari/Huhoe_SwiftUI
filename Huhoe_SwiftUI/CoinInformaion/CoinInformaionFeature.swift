//
//  CoinInformaionFeature.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import Combine

import ComposableArchitecture

struct CoinInformationState: Equatable {
    var informations: [CoinInformationModel] = []
}

enum CoinInformationAction {
    case onAppear
    case dataLoaded(Result<[CoinInformationModel], HTTPError>)
    case coinInformationTapped(CoinInformationModel)
}

struct CoinInformationEnvironment {
    var coinInformaionRequset: (JSONDecoder) -> Effect<[CoinInformationModel], HTTPError>
}

let coinInformationReducer = Reducer<
    CoinInformationState,
    CoinInformationAction,
    SystemEnvironment<CoinInformationEnvironment>
> { state, action, environment in
  switch action {
  case .onAppear:
      return .none
  case .dataLoaded(let result):
      return .none
  case .coinInformationTapped(let information):
      return .none
  }
}

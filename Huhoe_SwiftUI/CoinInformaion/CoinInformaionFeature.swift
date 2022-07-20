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
        return environment.coinInformaionRequset(environment.decoder())
            .receive(on: environment.mainQueue())
            .catchToEffect()
            .map( CoinInformationAction.dataLoaded )
    case .dataLoaded(let result):
        switch result {
        case .success(let informations):
            state.informations = informations
        case .failure(let error):
            print(error.localizedDescription)
            break
        }
        return .none
    case .coinInformationTapped(let information):
        print(information)
        return .none
    }
}

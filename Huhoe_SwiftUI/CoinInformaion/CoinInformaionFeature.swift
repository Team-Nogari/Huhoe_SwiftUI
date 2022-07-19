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

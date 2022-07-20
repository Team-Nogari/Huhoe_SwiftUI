//
//  RootFeature.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import ComposableArchitecture

struct RootState {
    var coinInformationState = CoinInformationState()
}

enum RootAction {
    case coinInformationAction(CoinInformationAction)
}

struct RootEnvironment { }

let rootReducer = Reducer<
    RootState,
    RootAction,
    SystemEnvironment<RootEnvironment>
>.combine(
    
    coinInformationReducer.pullback(
        state: \.coinInformationState,
        action: /RootAction.coinInformationAction,
        environment: { _ in
            .dev(
                environment: CoinInformationEnvironment(coinInformaionRequset: dummyRepositoryErrect)
            )
        }
    )
    
)

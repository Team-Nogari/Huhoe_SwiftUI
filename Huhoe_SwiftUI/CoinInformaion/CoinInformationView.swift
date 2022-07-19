//
//  ContentView.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import SwiftUI
import Combine

import ComposableArchitecture

struct CoinInformationView: View {
    let store: Store<CoinInformationState, CoinInformationAction>
    let coinInformation: CoinInformationModel
    
    var body: some View {
        VStack {
            Text("ddd")
        }
    }
}

struct CoinInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CoinInformationView(
            store: Store(
                initialState: CoinInformationState(),
                reducer: coinInformationReducer,
                environment: .dev(environment: CoinInformationEnvironment(coinInformaionRequset: dummyRepositoryErrect)
                )
            ),
            coinInformation: CoinInformationModel.dummy
        )
    }
}

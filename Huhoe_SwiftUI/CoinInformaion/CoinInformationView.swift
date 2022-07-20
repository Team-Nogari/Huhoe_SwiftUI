//
//  ContentView.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/18.
//

import SwiftUI
import Combine

import ComposableArchitecture

struct CoinInformationListView: View {
  let store: Store<CoinInformationState, CoinInformationAction>
  
  var body: some View {
    WithViewStore (self.store) { viewStore in
      ScrollView {
        LazyVStack {
          ForEach(viewStore.informations) { information in
            CoinInformationView(
              store: store,
              coinInformation: information
            )
          }
        }
      }
      .onAppear {
          viewStore.send(.onAppear)
      }
    }
  }
}

struct CoinInformationView: View {
  let store: Store<CoinInformationState, CoinInformationAction>
  let coinInformation: CoinInformationModel
  
  var body: some View {
    WithViewStore (self.store) { viewStore in
      Button(action: {
        viewStore.send(.coinInformationTapped(coinInformation))
      }) {
        VStack(spacing: 4) {
          
          // 코인 이름, 심볼
          
          HStack {
            Text(coinInformation.coinName)
              .font(Font.withKOHIBaeum(dynamicFont: .title2))
            
            Text(coinInformation.coinSymbol)
              .font(Font.withKOHIBaeum(dynamicFont: .title2))
              .foregroundColor(.gray)
          }
          .padding(.top, 8)
          
          // 구분선
          
          Rectangle()
            .fill(Color(.gray))
            .frame(height: 1)
            .padding(.horizontal, 8)
          
          // 계산된 투자 금액
          
          Text("\(coinInformation.calculatedPriceString)원")
            .font(Font.withKOHIBaeum(dynamicFont: .title2))
            .foregroundColor(.red)
            .padding(0)
          
          // 손익
          
          HStack {
            Text("\(coinInformation.profitAndLossString)원")
              .font(Font.withKOHIBaeum(dynamicFont: .subhead))
              .foregroundColor(.red)
              .multilineTextAlignment(.center)
              .frame(minWidth: 0, maxWidth: .infinity)
                          
            Text("\(coinInformation.rateString)%")
              .font(Font.withKOHIBaeum(dynamicFont: .subhead))
              .foregroundColor(.red)
              .multilineTextAlignment(.center)
              .frame(minWidth: 0, maxWidth: .infinity)
          }
          .padding(.horizontal, 8)
          
          // 코인 가격(당시, 현재)
          
          HStack(spacing: 16) {
            HStack {
              Text("당시")
                .font(Font.withKOHIBaeum(dynamicFont: .subhead))
                              
              Text("\(coinInformation.oldPriceString)원")
                .font(Font.withKOHIBaeum(dynamicFont: .subhead))
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            HStack {
              Text("현재")
                .font(Font.withKOHIBaeum(dynamicFont: .subhead))
                                
              Text("\(coinInformation.currentPriceString)원")
                .font(Font.withKOHIBaeum(dynamicFont: .subhead))
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
          }
          .padding([.leading, .trailing, .bottom], 8)
        }
        .background( // 그림자
          RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .shadow(color: .gray, radius: 2, x: 3, y: 3)
        )
      .contentShape(Rectangle())
      }
      .foregroundColor(Color.black)
    }
    .padding(.horizontal, 8)
  }
}

struct CoinInformationListView_Previews: PreviewProvider {
  static var previews: some View {
    CoinInformationListView(
      store: Store(
        initialState: CoinInformationState(),
        reducer: coinInformationReducer,
        environment: .dev(environment: CoinInformationEnvironment(coinInformaionRequset: dummyRepositoryErrect)
        )
      )
    )
    .previewDevice("iPhone 13")
  }
}

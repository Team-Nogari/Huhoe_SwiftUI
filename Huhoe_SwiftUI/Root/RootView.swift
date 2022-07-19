//
//  File.swift
//  Huhoe_SwiftUI
//
//  Created by 황제하 on 2022/07/19.
//

import SwiftUI

import ComposableArchitecture

struct RootView: View {
    var body: some View {
        CoinInformationView()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        CoinInformationView()
    }
}

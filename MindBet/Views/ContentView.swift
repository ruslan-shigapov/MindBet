//
//  ContentView.swift
//  MindBet
//
//  Created by Ruslan Shigapov on 04.12.2025.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            ForEach(Tabs.allCases) { tab in
                NavigationStack {
                    tab.view
                        .navigationTitle(tab.rawValue)
                        .scrollContentBackground(.hidden)
                        .background(.thinMaterial)
                }
                .tabItem {
                    Label(tab.rawValue, systemImage: tab.imageName)
                }
            }
        }
    }
}

//
//  Tabs.swift
//  MindBet
//
//  Created by Ruslan Shigapov on 05.12.2025.
//

import SwiftUI

enum Tabs: String, CaseIterable, Identifiable {
    
    case results = "Результаты"
    case statistics = "Статистика"
    case profile = "Профиль"
    
    var imageName: String {
        switch self {
        case .results: "flag.2.crossed"
        case .statistics: "chart.bar"
        case .profile: "person.crop.rectangle"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .results: ResultsView()
        case .statistics: StatisticsView()
        case .profile: ProfileView()
        }
    }
    
    var id: Self { self }
}

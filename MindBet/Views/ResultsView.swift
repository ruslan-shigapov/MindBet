//
//  ResultsView.swift
//  MindBet
//
//  Created by Ruslan Shigapov on 05.12.2025.
//

import SwiftUI
import SwiftData

struct ResultsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            EditButton()
        }
        ToolbarItem {
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
        }
    }
    
    var body: some View {
        Group {
            if items.isEmpty {
                ContentUnavailableView(
                    "Нет купонов",
                    systemImage: "ticket",
                    description: Text(
                        "Чтобы добавить новый, коснись кнопки с плюсом."))
            } else {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        } label: {
                            Text(
                                item.timestamp,
                                format: Date.FormatStyle(
                                    date: .numeric,
                                    time: .standard))
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
        .toolbar { toolbarContent }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self)
}

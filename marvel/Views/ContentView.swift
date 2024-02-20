//
//  ContentView.swift
//  marvel
//
//  Created by Luis Alvarez on 18/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    let marvelAPIService = MarvelAPIService()
    let marvelDataFetcher: MarvelDataFetcher
    init() {
        self.marvelDataFetcher = MarvelDataFetcher(marvelAPIService: marvelAPIService)
    }
    var body: some View {
        VStack(spacing: 0) { 
            CharactersView(viewModel: CharactersViewModel(marvelDataFetcher: marvelDataFetcher))
        }
        //        NavigationSplitView {
        //            List {
        //                ForEach(items) { item in
        //                    NavigationLink {
        //                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
        //                    } label: {
        //                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
        //                    }
        //                }
        //                .onDelete(perform: deleteItems)
        //            }
        //            .toolbar {
        //                ToolbarItem(placement: .navigationBarTrailing) {
        //                    EditButton()
        //                }
        //                ToolbarItem {
        //                    Button(action: addItem) {
        //                        Label("Add Item", systemImage: "plus")
        //                    }
        //                }
        //            }
        //        } detail: {
        //            Text("Select an item")
        //        }
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
        .modelContainer(for: Item.self, inMemory: true)
}

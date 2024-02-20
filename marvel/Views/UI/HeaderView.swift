//
//  HeaderView.swift
//  marvel
//
//  Created by Luis Alvarez on 20/02/2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack() {
            Image("Marvel")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(0)
            TextField("Search characters", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.header)
        }
        .padding()
        .background(Color.header)
    }
}
#Preview {
    HeaderView(searchText: .constant(""))
}

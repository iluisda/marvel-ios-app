//
//  SplashScreenView.swift
//  marvel
//
//  Created by Luis Alvarez on 19/02/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.accentColor)
            Color.accentColor
                .ignoresSafeArea(.all)
            Image("MarvelSplash")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        }
        .background(Color.accentColor)
    }
}

#Preview {
    SplashScreenView()
}

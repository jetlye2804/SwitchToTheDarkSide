//
//  SwitchToTheDarkSide.swift
//  SwitchToTheDarkSide
//
//  Created by Jet Lye on 15/10/2023.
//
import SwiftUI

@main
struct SwitchToTheDarkSideApp: App {
    @StateObject var appearanceManager = AppearanceManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appearanceManager)
        }
    }
}

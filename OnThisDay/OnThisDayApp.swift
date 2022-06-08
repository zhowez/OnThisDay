//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/7/22.
//

import SwiftUI

@main
struct OnThisDayApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)

        }
    }
}

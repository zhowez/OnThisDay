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
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
 

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)// 1
                .onAppear {
                  DisplayMode.changeDisplayMode(to: displayMode)
                }
                // 2
                .onChange(of: displayMode) { newValue in
                  DisplayMode.changeDisplayMode(to: newValue)
                }


        }.commands {
            Menus()
          }
       
        Settings {
          PreferencesView()
        }


    }
}

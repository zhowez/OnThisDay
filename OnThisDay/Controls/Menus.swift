//
//  Menus.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/9/22.
//

import Foundation

// 1
import SwiftUI

// 2
struct Menus: Commands {
    
    @AppStorage("showTotals") var showTotals = true
    @AppStorage("displayMode") var displayMode = DisplayMode.auto


    
   var body: some Commands {
    // 3
    //EmptyCommands()
       SidebarCommands()
       ToolbarCommands()
       
       CommandGroup(replacing: .help) {

           // 1
           Button("ZenQuotes.io web site") {
             // 2
             showAPIWebSite()
           }
           // 3
           .keyboardShortcut("/", modifiers: .command)

       }
       
       CommandMenu("Display") {
         // display menu items go here
           // 1
           Toggle(isOn: $showTotals) {
             // 2
             Text("Show Totals")
           }
           // 3
           .keyboardShortcut("t", modifiers: .command)

           // 1
           Divider()

           // 2
           Picker("Appearance", selection: $displayMode) {
             // 3
             ForEach(DisplayMode.allCases, id: \.self) {
               // 4
               Text($0.rawValue)
                 .tag($0)
             }
           }


       }




  }
    
    func showAPIWebSite() {
      // 1
      let address = "https://today.zenquotes.io"
      guard let url = URL(string: address) else {
        fatalError("Invalid address")
      }
      // 2
      NSWorkspace.shared.open(url)
    }

}

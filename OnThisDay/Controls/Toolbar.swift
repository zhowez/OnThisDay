//
//  Toolbar.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/10/22.
//

import Foundation

// 1
import SwiftUI

// 2
struct Toolbar: CustomizableToolbarContent {
    @Binding var viewMode: ViewMode

  var body: some CustomizableToolbarContent {

    // 3
//    ToolbarItem(placement: .navigation) {
//      // 4
//      Button {
//        // button action
//        toggleSidebar()
//
//      } label: {
//        // 5
//        Image(systemName: "sidebar.left")
//      }
//      // 6
//      .help("Toggle Sidebar")
//    }
      
      // 1
      ToolbarItem(
        id: "toggleSidebar",
        placement: .navigation,
        showsByDefault: true
      ) {
        // 2
        Button {
          toggleSidebar()
        } label: {
          // 3
          Label("Toggle Sidebar", systemImage: "sidebar.left")
        }
        .help("Toggle Sidebar")
      }
      
      // 1
      ToolbarItem(id: "viewMode") {
        // 2
        Picker("View Mode", selection: $viewMode) {
          // 3
          Label("Grid", systemImage: "square.grid.3x2")
            .tag(ViewMode.grid)
          Label("Table", systemImage: "tablecells")
            .tag(ViewMode.table)
        }
        // 4
        .pickerStyle(.segmented)
        // 5
        .help("Switch between Grid and Table")
      }


      
      
  }
    
    func toggleSidebar() {
      // 1
      NSApp.keyWindow?
        // 2
        .contentViewController?
        // 3
        .tryToPerform(
          // 4
          #selector(NSSplitViewController.toggleSidebar(_:)),
          with: nil)
    }

}

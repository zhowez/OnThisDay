//
//  DisplayMode.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/10/22.
//

import Foundation

// 1
import SwiftUI

// 2
enum DisplayMode: String, CaseIterable {
  // 3
  case light = "Light"
  case dark = "Dark"
  case auto = "Auto"
    
    
    // 1
    static func changeDisplayMode(to mode: DisplayMode) {
      // 2
      @AppStorage("displayMode") var displayMode = DisplayMode.auto

      // 3
      displayMode = mode

      // 4
      switch mode {
      case .light:
        // 5
        NSApp.appearance = NSAppearance(named: .aqua)
      case .dark:
        NSApp.appearance = NSAppearance(named: .darkAqua)
      case .auto:
        // 6
        NSApp.appearance = nil
      }
    }
    
}

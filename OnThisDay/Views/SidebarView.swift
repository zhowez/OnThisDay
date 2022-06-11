//
//  SidebarView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/8/22.
//

import SwiftUI

struct SidebarView: View {
    // 1
    @Binding var selection: EventType?
    @EnvironmentObject var appState: AppState
    @AppStorage("showTotals") var showTotals = true
  



    var body: some View {
      // 2
      List(selection: $selection) {
        // 3
        Section("Today") {
          // 4
          ForEach(EventType.allCases, id: \.self) { type in
            Text(type.rawValue).badge(
                showTotals
                ? appState.countFor(eventType: type)
                : 0)

          }
        }
      }
      // 5
      .listStyle(.sidebar)
    }

}



//
//  ContentView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var eventType: EventType? = .events
    @EnvironmentObject var appState: AppState
    var events: [Event] {
      appState.dataFor(eventType: eventType)
    }


    var body: some View {
        // 1
        
        NavigationView {
            
          // 2
            SidebarView(selection: $eventType)

            GridView(gridData: events)

        }
        // 3
        .frame(
          minWidth: 700,
          idealWidth: 1000,
          maxWidth: .infinity,
          minHeight: 400,
          idealHeight: 800,
          maxHeight: .infinity)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

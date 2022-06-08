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
    var windowTitle: String {
        if let eventType = eventType {
            return "On This Day - \(eventType.rawValue)"
        }
        return "On This Day"
    }
    
    
    var body: some View {
        // 1
        
        NavigationView {
            
            // 2
            SidebarView(selection: $eventType)
            
            //Don't love the idea of force unwrapping the value but its all i know for now
            GridView(gridData: events, eventName: eventType!)
            
        }
        // 3
        .frame(
            minWidth: 700,
            idealWidth: 1000,
            maxWidth: .infinity,
            minHeight: 400,
            idealHeight: 800,
            maxHeight: .infinity)
        .navigationTitle(windowTitle)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/7/22.
//

import SwiftUI

enum ViewMode: Int {
  case grid
  case table
}

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @SceneStorage("eventType") var eventType: EventType?
    @SceneStorage("searchText") var searchText = ""
    @SceneStorage("viewMode") var viewMode: ViewMode = .grid
    @SceneStorage("selectedDate") var selectedDate: String?




    
//    var events: [Event] {
//        appState.dataFor(eventType: eventType)
//    }
    
    var events: [Event] {
      appState.dataFor(
        eventType: eventType,
        date: selectedDate,
        searchText: searchText)
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
            //GridView(gridData: events, eventName: eventType!)
            //TableView(tableData: events)
            if viewMode == .table {
              TableView(tableData: events)
            } else {
                GridView(gridData: events)
            }


        }
        // 3
        .frame(
            minWidth: 700,
            idealWidth: 1000,
            maxWidth: .infinity,
            minHeight: 400,
            idealHeight: 800,
            maxHeight: .infinity)
        .navigationTitle(windowTitle).toolbar(id: "mainToolbar") {
            Toolbar(viewMode: $viewMode)

          }
.searchable(text: $searchText).onAppear {
    if eventType == nil {
      eventType = .events
    }
  }






        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  TableView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/11/22.
//

import SwiftUI

struct TableView: View {
    var tableData: [Event]
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    var sortedTableData: [Event] {
      return tableData.sorted(using: sortOrder)
    }
    @State private var selectedEventID: UUID?
    
    var selectedEvent: Event? {
      // 1
      guard let selectedEventID = selectedEventID else {
        return nil
      }

      // 2
      let event = tableData.first {
        $0.id == selectedEventID
      }
      // 3
      return event
    }





    var body: some View {
        // 1
        HStack {
            Table(
              sortedTableData,
              selection: $selectedEventID,
              sortOrder: $sortOrder) {



              // 2
                TableColumn("Title", value: \.text).width(min: 50, ideal: 60, max: 100)

              // 4
              TableColumn("Title") {
                Text($0.text)
              }
              }.tableStyle(.bordered)
        }// 1
        if let selectedEvent = selectedEvent {
          // 2
          EventView(event: selectedEvent)
            // 3
            .frame(width: 250)
        } else {
          // 4
          Text("Select an event for more details…")
            .font(.title3)
            .padding()
            .frame(width: 250)
        }


    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableData: [Event.sampleEvent])

    }
}

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
    @AppStorage("showBirths") var showBirths = true
    @AppStorage("showDeaths") var showDeaths = true
    @SceneStorage("selectedDate") var selectedDate: String?



    
    var body: some View {
      // 2
        VStack {
            List(selection: $selection) {
            // 3
            Section(selectedDate?.uppercased() ?? "TODAY") {

              // 4
            ForEach(validTypes, id: \.self) { type in

                Text(type.rawValue).badge(
                    showTotals
                    ? appState.countFor(eventType: type, date: selectedDate)

                    : 0)

              }
            }
                // 1
                Section("AVAILABLE DATES") {
                  // 2
                  ForEach(appState.sortedDates, id: \.self) { date in
                    // 3
                    Button {
                      selectedDate = date
                    } label: {
                      // 4
                      HStack {
                        Text(date)
                        Spacer()
                      }
                    }.modifier(DateButtonViewModifier(selected: date == selectedDate))

                    // 5
                    .controlSize(.large)
                  }
                }

          }
          // 5
            .listStyle(.sidebar)
            Spacer()
            DayPicker()

        }.frame(minWidth: 220)

    }
    // 1
    var validTypes: [EventType] {
      // 2
      var types = [EventType.events]
      // 3
      if showBirths {
        types.append(.births)
      }
      if showDeaths {
        types.append(.deaths)
      }
      // 4
      return types
    }


}


// 1
struct DateButtonViewModifier: ViewModifier {
  // 2
  var selected: Bool

  // 3
  func body(content: Content) -> some View {
    if selected {
      // 4
      content
        // 5
        .buttonStyle(.borderedProminent)
    } else {
      // 6
      content
    }
  }
}

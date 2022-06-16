////
//   DatePicker.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/15/22.
//

import SwiftUI

struct DayPicker: View {
    
    // 1
    @EnvironmentObject var appState: AppState
    @SceneStorage("selectedDate") var selectedDate: String?


    // 2
    @State private var month = "January"
    @State private var day = 1
    
    var maxDays: Int {
      switch month {
      case "February":
        return 29
      case "April", "June", "September", "November":
        return 30
      default:
        return 31
      }
    }
    
    // 1
    func getNewEvents() async {
      // 2
      let monthIndex = appState.englishMonthNames
        .firstIndex(of: month) ?? 0
      // 3
      let monthNumber = monthIndex + 1
      // 4
      await appState.getDataFor(month: monthNumber, day: day)
      selectedDate = "\(month) \(day)"

    }


    var body: some View {
        // 1
        VStack {
          Text("Select a Date")

          // 2
          HStack {
            // 3
            Picker("", selection: $month) {
              // 4
              ForEach(appState.englishMonthNames, id: \.self) {
                Text($0)
              }
            }
            // 5
            .pickerStyle(.menu)

            // 6
            Picker("", selection: $day) {
              ForEach(1 ... maxDays, id: \.self) {
                Text("\($0)")
              }
            }
            .pickerStyle(.menu)
            // 7
            .frame(maxWidth: 60)
            .padding(.trailing, 10)
          }

          // button goes here
            if appState.isLoading {
             // 1
             ProgressView()
               .frame(height: 28)
           } else {
             // 2
             Button("Get Events") {
               // 3
               Task {
                 await getNewEvents()
               }
             }
             // 4
             .buttonStyle(.borderedProminent)
             .controlSize(.large)
           }

        }
        // 8
        .padding()

    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPicker().environmentObject(AppState())
            .frame(width: 200)

    }
}

//
//  PreferencesView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/16/22.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        // 1
        TabView {
          // 2
            ShowView()
            // 3
            .tabItem {
              Image(systemName: "checkmark.circle")
              Text("Show")
            }

          // 4
            AppearanceView()
            .tabItem {
              Image(systemName: "sun.min")
              Text("Appearance")
            }
        }.frame(width: 200, height: 150).navigationTitle("Settings")


    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView()
          .frame(width: 200, height: 150)
        AppearanceView()
          .frame(width: 200, height: 150)


    }
}


// 1
struct ShowView: View {
  // 2
  @AppStorage("showBirths") var showBirths = true
  @AppStorage("showDeaths") var showDeaths = true
  @AppStorage("showTotals") var showTotals = true

  // 3
  var body: some View {
    // 4
    VStack(alignment: .leading) {
      Toggle("Show Births", isOn: $showBirths)
      Toggle("Show Deaths", isOn: $showDeaths)
      Toggle("Show Totals", isOn: $showTotals)
    }
  }
}


// 1
struct AppearanceView: View {
  // 2
  @AppStorage("displayMode") var displayMode = DisplayMode.auto

  // 3
  var body: some View {
    // 4
    Picker("", selection: $displayMode) {
      Text("Light").tag(DisplayMode.light)
      Text("Dark").tag(DisplayMode.dark)
      Text("Automatic").tag(DisplayMode.auto)
    }
    // 5
    .pickerStyle(.radioGroup)
  }
}

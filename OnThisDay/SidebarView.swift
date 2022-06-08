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

    var body: some View {
      // 2
      List(selection: $selection) {
        // 3
        Section("Today") {
          // 4
          ForEach(EventType.allCases, id: \.self) { type in
            Text(type.rawValue)
          }
        }
      }
      // 5
      .listStyle(.sidebar)
    }

}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(selection: .constant(nil))
          .frame(width: 200)

    }
}

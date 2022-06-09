//
//  EventView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/8/22.
//

import SwiftUI

struct EventView: View {
    var event: Event

    var body: some View {
        // 1
        HStack {
          // 2
          VStack(alignment: .leading, spacing: 30) {
            // 3
            Text(event.year)
              .font(.title)

            Text(event.text)
              .font(.title3)

              // 1
              VStack(alignment: .leading, spacing: 10) {
                // 2
                Text("Related Links:")
                  .font(.title2)

                // 3
                ForEach(event.links) { link in
                  Link(link.title, destination: link.url)
                    // 1
                    .onHover { inside in
                      if inside {
                        // 2
                        NSCursor.pointingHand.push()
                      } else {
                        // 3
                        NSCursor.pop()
                      }
                    }

                }
              }

            
            // 4
            Spacer()
          }
          // 5
          Spacer()
        }
        // 6
        .padding()
        .frame(width: 250)


    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.sampleEvent)

    }
}

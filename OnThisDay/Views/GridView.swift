//
//  GridView.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/8/22.
//

import SwiftUI

struct GridView: View {
    // 1
    var gridData: [Event]
   
    @AppStorage("showTotals") var showTotals = true

    // 2
    var columns: [GridItem] {
      [GridItem(.adaptive(minimum: 250, maximum: 250), spacing: 20)]
    }

    
    var body: some View {
                // 1
        ScrollView {
          // 2
          LazyVGrid(columns: columns, spacing: 15) {
            // 3
            ForEach(gridData) {
              EventView(event: $0)
                // 4
                .frame(height: 350, alignment: .topLeading)
                // styling modifiers go here
                // 1
                .background()
                .clipped()
                .border(.secondary, width: 1)
                // 2
                .padding(.bottom, 5)
                // 3
                .shadow(color: .primary.opacity(0.3), radius: 3, x: 3, y: 3)

            }
          }
        }.padding(.vertical)
        
        
        if(showTotals){
            Text("Number Of Entries: \(gridData.count)").padding(.bottom, 8)
        }
        

    }
}


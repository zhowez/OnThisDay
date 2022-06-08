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
            }
          }
        }

    }
}


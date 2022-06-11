//
//  TitleHeader.swift
//  OnThisDay
//
//  Created by Zach Howes on 6/8/22.
//

import SwiftUI

struct TitleHeader: View {
    var event:String
 
     
    // US English Locale (en_US)
   
    
    
    var body: some View {
        Text("\(event) - \(Date().formatted( Date.FormatStyle().day(.twoDigits).month(.wide)))").foregroundColor(.blue).font(.largeTitle).bold().padding(.top, 8)
        Divider()
    }
}



//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Fatimah Hussain on 2/16/21.
//

// if the view is used often, then put it in a separate file
//but if it unique to the screen, then keep it in the file
import SwiftUI

import Foundation

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
    
}

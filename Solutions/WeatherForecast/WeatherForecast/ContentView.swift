//
//  ContentView.swift
//  WeatherForecast
//
//  Created by chadhindsight on 3/10/26.
//

import SwiftUI

// 1️⃣ Define the data type for weather items
struct Forecast: Identifiable {
let id = UUID()
let day: String
let isRainy: Bool
let high: Int
let low: Int
}

struct ContentView: View {
    let forecastData = [
    Forecast(day: "Mon", isRainy: false, high: 70, low: 50),
    Forecast(day: "Tue", isRainy: true, high: 60, low: 40),
    Forecast(day: "Wed", isRainy: false, high: 72, low: 52),
    Forecast(day: "Thu", isRainy: true, high: 65, low: 45),
    Forecast(day: "Fri", isRainy: false, high: 75, low: 55)
    ]
    
    var body: some View {
        HStack {
            ForEach(forecastData) { forecast in
                DayForecast(day: forecast.day, isRainy: forecast.isRainy, high: forecast.high, low: forecast.low)
                
            }
        }
    }
}

// new reusable struct
struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    // Boolean used to determine the icon to show
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            HStack {}
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

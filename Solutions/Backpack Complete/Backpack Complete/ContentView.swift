//
//  ContentView.swift
//  Backpack Complete
//
//  Created by Chad Hinds on 4/22/26.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Data
    private var availableSupplies: [String] = ["✏️", "📏", "📚", "✂️"]

    // MARK: - State
    @State private var suppliesInBackpack: [String] = []
    @State private var isFull = false

    // MARK: - Computed Properties and 
    private let capacity = 4

    private var backpackColor: Color {
        let ratio = Double(suppliesInBackpack.count) / Double(capacity)
        if ratio == 0 {
            return .brown
        } else if ratio <= 0.5 {
            return .orange
        } else if ratio < 1.0 {
            return .red.opacity(0.7)
        } else {
            return .red
        }
    }

    private var supplyFontSize: CGFloat {
        let ratio = Double(suppliesInBackpack.count) / Double(capacity)
        if ratio >= 1.0 {
            return 28
        } else if ratio >= 0.5 {
            return 34
        } else {
            return 40
        }
    }

    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) {

            Text("Tap a school supply \n to add it to your backpack!")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: Available Supplies
            HStack(spacing: 20) {
                ForEach(availableSupplies, id: \.self) { supply in
                    Text(supply)
                        .font(.system(size: 60))
                        .opacity(suppliesInBackpack.contains(supply) ? 0.3 : 1.0)
                        .onTapGesture {
                            if suppliesInBackpack.count < capacity
                                && !suppliesInBackpack.contains(supply) {
                                suppliesInBackpack.append(supply)
                                isFull = suppliesInBackpack.count == capacity
                            }
                        }
                }
            }
            .padding()

            // MARK: Full Indicator
            if isFull {
                Text("🎒 Backpack is full!")
                    .font(.headline)
                    .foregroundColor(.red)
                    .transition(.opacity)
            }

            // MARK: Capacity Display
            Text("\(suppliesInBackpack.count) / \(capacity)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            // MARK: Backpack + Contents
            ZStack {
                Image(systemName: "backpack")
                    .resizable()
                    .frame(width: 300, height: 400)
                    .padding()
                    .foregroundColor(backpackColor)
                    .animation(.easeInOut(duration: 0.4), value: backpackColor)

                HStack(spacing: 6) {
                    ForEach(suppliesInBackpack.indices, id: \.self) { index in
                        Text(suppliesInBackpack[index])
                            .font(.system(size: supplyFontSize))
                            .animation(.easeInOut(duration: 0.3), value: supplyFontSize)
                            .onTapGesture {
                                suppliesInBackpack.remove(at: index)
                                isFull = suppliesInBackpack.count == capacity
                            }
                    }
                }
                .offset(y: -80)
            }

            // MARK: Empty Button
            Button("Empty Backpack") {
                suppliesInBackpack.removeAll()
                isFull = false
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)

        } // END VSTACK
    } // END BODY

} // END CONTENT VIEW

#Preview {
    ContentView()
}

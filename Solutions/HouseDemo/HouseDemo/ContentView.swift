import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
// Start coding on the line directly below:
        
        }
    }
}

// MARK: - Custom Triangle Shape to be used as the roof of our house
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}

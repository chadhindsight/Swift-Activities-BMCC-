import SwiftUI

struct ContentView: View {
   
    var body: some View {
        VStack{
            ZStack {
                // Top snowball
                Circle()
                    .fill(Color.white)
                    .frame(width: 120, height: 120)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                    )
                
                // Face
                VStack(spacing: 10) {
                    // Eyes
                    HStack(spacing: 20) {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 10, height: 10)
                        Circle()
                            .fill(Color.black)
                            .frame(width: 10, height: 10)
                    }
                    
                    // Nose
                    Triangle()
                        .fill(Color.orange)
                        .frame(width: 15, height: 30)
                        .rotationEffect(.degrees(90))
                    
                    // Mouth
                    HStack(spacing: 5) {
                        ForEach(0..<5) { _ in
                            Circle()
                                .fill(Color.black)
                                .frame(width: 5, height: 5)
                        }
                    }
                }
            }
            .padding()
        }
     
    }
}

// Triangle shape for carrot nose
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}

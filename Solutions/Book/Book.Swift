import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 0) {
            
            // MARK: - Spine
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.blue)
                .frame(width: 30, height: 220)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 3)
                )
            
            // MARK: - Cover
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 3)
                    )
                
                VStack(spacing: 8) {
                    
                    // MARK: - Title Bar
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.brown)
                        .frame(height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .overlay(
                            Text("Of Swift and Men")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        )
                    
                    Spacer()
                    
                    // MARK: - Author Bar
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.brown)
                        .frame(height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .overlay(
                            Text("Swift Steinbeck")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.white)
                        )
                }
                .padding(16)
            }
            .frame(width: 200, height: 220)
            
            // MARK: - Pages Edge
            Rectangle()
                .fill(Color.white)
                .frame(width: 12, height: 210)
                .overlay(
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

#Preview {
    ContentView()
}

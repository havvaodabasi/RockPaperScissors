import SwiftUI

struct ResultView: View {
    let result: GameResult
    let onPlayAgain: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text(result.emoji)
                    .font(.system(size: 100))
                
                Text(result.message)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Score: \(result.score)")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.9))
                
                Button(action: onPlayAgain) {
                    Text("Play Again")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.indigo)
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
    }
}

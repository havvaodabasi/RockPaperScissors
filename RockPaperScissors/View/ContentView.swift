import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()
                
                Text("🧠 Rock Paper Scissors")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Round \(viewModel.round) / 10")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
                
                VStack(spacing: 10) {
                    Text("🤖 App chose:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(viewModel.appMove.emoji)
                        .font(.system(size: 100))
                        .shadow(radius: 10)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                VStack {
                    Text(viewModel.shouldWin ? "Try to WIN 👊" : "Try to LOSE 🫣")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Spacer()
                
                HStack(spacing: 30) {
                    ForEach(Move.allCases, id: \.self) { move in
                        Button {
                            viewModel.tapped(move: move)
                        } label: {
                            Text(move.emoji)
                                .font(.system(size: 60))
                                .frame(width: 100, height: 100)
                                .background(Color.white.opacity(0.15))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.white.opacity(0.8), lineWidth: 2))
                                .scaleEffect(viewModel.selectedMove == move && viewModel.animateCorrect ? 1.4 : 1.0)
                                .rotationEffect(viewModel.selectedMove == move && viewModel.animateWrong ? .degrees(-10) : .degrees(0))
                                .animation(.easeInOut(duration: 0.2), value: viewModel.animateCorrect || viewModel.animateWrong)
                        }
                    }
                }

                Spacer()
                
                Text("Score: \(viewModel.score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            .padding()
            .alert("Game Over", isPresented: $viewModel.showingScore) {
                Button("Play Again", action: viewModel.resetGame)
            } message: {
                if let result = viewModel.result {
                    Text("\(result.message)\nScore: \(result.score)")
                } else {
                    Text("Score: \(viewModel.score)")
                }
            }
        }
    }
}

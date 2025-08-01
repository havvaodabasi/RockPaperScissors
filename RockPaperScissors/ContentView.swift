import SwiftUI
import AVFoundation

struct ContentView: View {
    let moves = ["🪨", "📄", "✂️"]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 1
    @State private var showingScore = false
    
    @State private var selectedMove: Int? = nil
    @State private var animateCorrect = false
    @State private var animateWrong = false
        
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo, .blue, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()
                
                Text("🧠 Rock Paper Scissors")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Round \(round) / 10")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
                
                VStack(spacing: 10) {
                    Text("🤖 App chose:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(moves[appMove])
                        .font(.system(size: 100))
                        .shadow(radius: 10)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                VStack {
                    Text(shouldWin ? "Try to WIN 👊" : "Try to LOSE 🫣")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Spacer()
                
                HStack(spacing: 30) {
                    ForEach(0..<3) { number in
                        Button {
                            tappedMove(number)
                        } label: {
                            Text(moves[number])
                                .font(.system(size: 60))
                                .frame(width: 100, height: 100)
                                .background(Color.white.opacity(0.15))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.white.opacity(0.8), lineWidth: 2))
                                .scaleEffect(selectedMove == number && animateCorrect ? 1.4 : 1.0)
                                .rotationEffect(selectedMove == number && animateWrong ? .degrees(-10) : .degrees(0))
                                .animation(.easeInOut(duration: 0.2), value: animateCorrect || animateWrong)
                        }
                    }
                }

                
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            .padding()
            .alert("Game Over", isPresented: $showingScore) {
                Button("Play Again", action: resetGame)
            } message: {
                Text("Your final score: \(score)")
            }
        }
    }
    
    func tappedMove(_ playerMove: Int) {
        selectedMove = playerMove

        let isCorrect = checkAnswer(playerMove)
        
        if isCorrect {
            score += 1
            animateCorrect = true
            playCorrectSound()
        } else {
            score -= 1
            animateWrong = true
            playWrongSound()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateCorrect = false
            animateWrong = false

            if round == 10 {
                showingScore = true
            } else {
                nextRound()
            }
        }
    }


    func checkAnswer(_ playerMove: Int) -> Bool {
        if shouldWin {
            return playerMove == (appMove + 1) % 3
        } else {
            return playerMove == (appMove + 2) % 3
        }
    }

    func nextRound() {
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
        round += 1
    }

    func resetGame() {
        score = 0
        round = 1
        appMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        showingScore = false
    }
    func playCorrectSound() {
        AudioServicesPlaySystemSound(1025) // başarı sesi
    }

    func playWrongSound() {
        AudioServicesPlaySystemSound(1053) // hata sesi
    }

}

#Preview {
    ContentView()
}

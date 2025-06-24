//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Havva Odabaşı on 18.06.2025.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "📄", "✂️"]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 1
    @State private var showingScore = false
        
    var body: some View {
        VStack {
            Text("Score: \(score)")
            Text("App chose: \(moves[appMove])")
            Text(shouldWin ? "You need to WIN" : "You need to LOSE")
        }
        HStack {
            ForEach(0..<3) { number in
                Button {
                    tappedMove(number)
                } label: {
                    Text(moves[number])
                        .font(.system(size: 60))
                }
            }
        }
        .alert("Game Over", isPresented: $showingScore) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score: \(score)")
        }
    }
    
    func tappedMove(_ playerMove: Int) {
        if checkAnswer(playerMove) {
            score += 1
        } else {
            score -= 1
        }
        
        if round == 10 {
            showingScore = true
        } else {
            nextRound()
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
        nextRound()
        shouldWin = Bool.random()
    }
}



#Preview {
    ContentView()
}

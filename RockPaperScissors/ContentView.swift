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
        
    var body: some View {
        VStack {
            Text("Score: \(score)")
            Text("App chose: \(moves[appMove])")
            Text(shouldWin ? "You need to WIN" : "You need to LOSE")
        }
    }
}

#Preview {
    ContentView()
}

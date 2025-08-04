import Foundation
import AVFoundation
import UIKit

class GameViewModel: ObservableObject {
    @Published var appMove: Move = Move.allCases.randomElement()!
    @Published var shouldWin = Bool.random()
    @Published var score = 0
    @Published var round = 1
    @Published var showingScore = false
    
    @Published var selectedMove: Move?
    @Published var animateCorrect = false
    @Published var animateWrong = false
    @Published var result: GameResult?

    
    func tapped(move: Move) {
        selectedMove = move
        
        let correct = shouldWin ? move.beats(appMove) : appMove.beats(move)
        
        if correct {
            score += 1
            animateCorrect = true
            playCorrectSound()
            vibrateSuccess()
        } else {
            score -= 1
            animateWrong = true
            playWrongSound()
            vibrateError()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animateCorrect = false
            self.animateWrong = false
            
            if self.round == 10 {
                self.result = GameResult.from(score: self.score)
                self.showingScore = true
            } else {
                self.nextRound()
            }
            
        }
    }
    
    func nextRound() {
        appMove = Move.allCases.randomElement()!
        shouldWin.toggle()
        round += 1
    }
    
    func resetGame() {
        score = 0
        round = 1
        appMove = Move.allCases.randomElement()!
        shouldWin = Bool.random()
        showingScore = false
    }
    
    func playCorrectSound() {
        AudioServicesPlaySystemSound(1025)
    }
    
    func playWrongSound() {
        AudioServicesPlaySystemSound(1053)
    }
    
    func vibrateSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func vibrateError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}

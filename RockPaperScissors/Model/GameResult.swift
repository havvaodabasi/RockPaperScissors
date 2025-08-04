import Foundation

struct GameResult {
    let score: Int
    let message: String
    let emoji: String
    let isSuccess: Bool

    static func from(score: Int) -> GameResult {
        if score >= 7 {
            return GameResult(score: score, message: "Bravo! 🎉", emoji: "🏆", isSuccess: true)
        } else if score >= 4 {
            return GameResult(score: score, message: "Not Bad 👏", emoji: "🙂", isSuccess: false)
        } else {
            return GameResult(score: score, message: "Sorry 😢", emoji: "💔", isSuccess: false)
        }
    }
}

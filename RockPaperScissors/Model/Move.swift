enum Move: String, CaseIterable {
    case rock = "🪨"
    case paper = "📄"
    case scissors = "✂️"
    
    var emoji: String { rawValue }
    
    func beats(_ other: Move) -> Bool {
        switch (self, other) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return true
        default:
            return false
        }
    }
}

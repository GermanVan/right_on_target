import UIKit

class SelectColorGame {
    var score: Int = 0
    var currentQuestionNumber: Int = 0
    let totalQuestions: Int = 5
    var currentQuestion: ColorQuestion?
    
    func startNewGame() {
        score = 0
        currentQuestionNumber = 0
        currentQuestion = ColorQuestion.generateQuestions()
    }
    
    func generateNextQuestion() -> ColorQuestion {
        currentQuestionNumber += 1
        return ColorQuestion.generateQuestions()
    }
    
    func checkAnswers(selectedIndex: Int) -> Bool {
        guard let question = currentQuestion else { return false }
        if selectedIndex == question.correctAnswerIndex {
            score += 1
            return true
        }
        return false
    }
    
    func isGameEnded() -> Bool {
        return currentQuestionNumber >= totalQuestions
    }
}


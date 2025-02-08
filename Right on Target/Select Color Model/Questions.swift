import UIKit

struct ColorQuestion {
    let correctColor: UIColor
    let options: [UIColor]
    let correctAnswerIndex: Int
    
    static func generateQuestions() -> ColorQuestion {
        let correctColor = UIColor.randomColor()
        let correctIndex = Int.random(in: 0..<4)
        var options = [UIColor]()
        
        for i in 0..<4 {
            if i == correctIndex {
                options.append(correctColor)
            } else {
                options.append(UIColor.randomColor())
            }
        }
        return ColorQuestion(correctColor: correctColor, options: options, correctAnswerIndex: correctIndex)
    }
}

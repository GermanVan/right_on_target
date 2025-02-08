import UIKit

class SelectColorViewController: UIViewController {
    
    @IBOutlet weak var hexCodeLabel: UILabel!
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var gameModel = SelectColorGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func startGame() {
        gameModel.startNewGame()
        updateUI()
    }
    
    func updateUI() {
        guard let question = gameModel.currentQuestion else { return }
        hexCodeLabel.text = question.correctColor.toHexString()
        
        optionButton1.backgroundColor = question.options[0]
        optionButton2.backgroundColor = question.options[1]
        optionButton3.backgroundColor = question.options[2]
        optionButton4.backgroundColor = question.options[3]
        
        optionButton1.setTitle("", for: .normal)
        optionButton2.setTitle("", for: .normal)
        optionButton3.setTitle("", for: .normal)
        optionButton4.setTitle("", for: .normal)
        
        optionButton1.tag = 0
        optionButton2.tag = 1
        optionButton3.tag = 3
        optionButton4.tag = 4
        
        scoreLabel.text = "Счет: \(gameModel.score)"
    }
    
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        let selectedIndex = sender.tag
        
        _ = gameModel.checkAnswers(selectedIndex: selectedIndex)
        
        if gameModel.isGameEnded() {
            let alert = UIAlertController(title: "Игра окончена", message: "Ваш счет: \(gameModel.score) из \(gameModel.totalQuestions)", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Начать заново", style: .default) { _ in self.startGame()}
            alert.addAction(restartAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            gameModel.currentQuestion = gameModel.generateNextQuestion()
            updateUI()
        }
    }
}


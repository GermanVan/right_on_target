import UIKit

class GameModeViewController: UIViewController {
    
    @IBAction func rightOnTargetTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showRightOnTarget", sender: nil)
    }
    
    @IBAction func colorGameTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showColorGame", sender: nil)
    }
}

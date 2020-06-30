
import UIKit
import AVFoundation


class ViewController: UIViewController {
var backgroundMusi: AVAudioPlayer?
    
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    
    @IBOutlet weak var TurnLable: UILabel!
    var buttons: [UIButton] = []
    override func viewDidLoad() {
        buttons = [B1, B2, B3, B4, B5, B6, B7, B8, B9]
     Music()
    }
    func Music(){
        let path = Bundle.main.path(forResource: "backgroundMusi.m4a", ofType:nil)
        let url = URL(fileURLWithPath: path!)

        do {
            backgroundMusi = try AVAudioPlayer(contentsOf: url)
            backgroundMusi?.play()
        } catch {
            // couldn't load file :(
        }
    }
       
    var counter = 0
    
    @IBAction func press(_ sender: UIButton) {
        
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.systemBlue, for: .normal)
            TurnLable.text = "O Turn"
        } else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.gray, for: .normal)
            TurnLable.text = "X Turn"
        }
        counter += 1
        sender.isEnabled = false
        
       theWinner(winner: "X")
       theWinner(winner: "O")
        
        
        
    }
    @IBAction func resetTapped() {
        restartGame()
    }
    
    
    func theWinner(winner: String){
        // Winner = X
        if (B1.titleLabel?.text == winner && B2.titleLabel?.text == winner && B3.titleLabel?.text == winner) ||
           (B4.titleLabel?.text == winner && B5.titleLabel?.text == winner && B6.titleLabel?.text == winner) ||
           (B7.titleLabel?.text == winner && B8.titleLabel?.text == winner && B9.titleLabel?.text == winner) ||
           (B1.titleLabel?.text == winner && B5.titleLabel?.text == winner && B9.titleLabel?.text == winner) ||
           (B3.titleLabel?.text == winner && B5.titleLabel?.text == winner && B7.titleLabel?.text == winner) ||
           (B2.titleLabel?.text == winner && B5.titleLabel?.text == winner && B8.titleLabel?.text == winner) ||
           (B1.titleLabel?.text == winner && B4.titleLabel?.text == winner && B7.titleLabel?.text == winner) ||
           (B3.titleLabel?.text == winner && B6.titleLabel?.text == winner && B9.titleLabel?.text == winner) {
        let alertCountroller = UIAlertController(title: "The Winner is \(winner)!", message: "Press the button to reset", preferredStyle: .alert)
            let restartaction = UIAlertAction(title: "Play Again", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertCountroller.addAction(restartaction)
        present(alertCountroller, animated: true, completion: nil)
        }
        else if counter > 8{
            let DrawAlert = UIAlertController(title: "It's Draw!", message: "Press the button to reset", preferredStyle: .alert)
                       let restartaction = UIAlertAction(title: "Play Again", style: .cancel) { (alert) in
                           self.restartGame()
                       }
                       DrawAlert.addAction(restartaction)
                   present(DrawAlert, animated: true, completion: nil)
        }
    }
    
    func restartGame() {
        
        for b in buttons {
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        counter = 0
        TurnLable.text = "X Turn"
    }
}


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var player:Int = 1
    
    var gameIsActive = true
    
    
    var gameState = [0,0,0,
                     0,0,0,
                     0,0,0]
    
    var winingIndexes = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    func determineWiner() {
        
        for index in winingIndexes {
            
            if gameState[index[0]] == gameState[index[1]] &&
                gameState[index[1]] == gameState[index[2]] &&
                gameState[index[2]] != 0 {
                
                resultLabel.text = String("Player \(player) is won")
               
                gameIsActive = false
                break
            }
        }
    }
        
    @IBOutlet weak var resultLabel: UILabel!
  
    @IBOutlet weak var position0: UIButton!
    @IBOutlet weak var position1: UIButton!
    @IBOutlet weak var position2: UIButton!
    @IBOutlet weak var position3: UIButton!
    @IBOutlet weak var position4: UIButton!
    @IBOutlet weak var position5: UIButton!
    @IBOutlet weak var position6: UIButton!
    @IBOutlet weak var position7: UIButton!
    @IBOutlet weak var position8: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        selectPosition(button: sender)
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        
        resetGame()
    }
    
    func resetGame() {
        
        position0.setImage(nil, for: UIControl.State.normal)
        position1.setImage(nil, for: UIControl.State.normal)
        position2.setImage(nil, for: UIControl.State.normal)
        position3.setImage(nil, for: UIControl.State.normal)
        position4.setImage(nil, for: UIControl.State.normal)
        position5.setImage(nil, for: UIControl.State.normal)
        position6.setImage(nil, for: UIControl.State.normal)
        position7.setImage(nil, for: UIControl.State.normal)
        position8.setImage(nil, for: UIControl.State.normal)
        
        resultLabel.text = ""
        
        for i in 0...8 {
            gameState[i] = 0
        }
        
        gameIsActive = true
    }
    
    func selectPosition(button: UIButton) {
        
        if gameIsActive {
            
            if button.image(for: UIControl.State.normal) == nil {
                
                if player == 1 { // player X
                    button.setImage( #imageLiteral(resourceName: "x3") , for: UIControl.State.normal)
                } else {
                    button.setImage( #imageLiteral(resourceName: "o2") , for: UIControl.State.normal)
                }
                
                gameState[button.tag] = player
                determineWiner()
                
                if player == 1 {
                    player = 2
                } else {
                    player = 1
                }
                
            }
        }
    }

    

}





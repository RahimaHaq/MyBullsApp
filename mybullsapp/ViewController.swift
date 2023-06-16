//
//  ViewController.swift
//  mybullsapp
//
//  Created by iosdeveloper on 12/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
    
        guard let thumbImageNormal = UIImage(named: "SliderThumb-Normal") else {return}
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        guard let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted") else {return}
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        guard let trackLeftImage = UIImage(named: "SliderTrackLeft") else {return}
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        guard let trackRightImage = UIImage(named: "SliderTrackRight") else {return}
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    
    @IBAction func startOver() {
        startNewGame()
        
    }
    
    func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
       scoreLabel.text = String(score)
      roundLabel.text = String(round)
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue )
var  points = 100 - difference
        
        let title: String
        
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Goood"
        } else {
            title = "Not even close"
            
        
    }
        score += points
        let messsage = "You scored \(points) points"

        
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ok", style: .default, handler:{_ in
            self.startNewRound()}
        
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
   
}

 

//
//  RussianLanguageViewController.swift
//  EPAM iOS School_practice_1
//
//  Created by Maxim on 26.01.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

class RussianLanguageViewController: UIViewController {

    var targetRandomValue = 0
    var currentValue = 0
    var round = 0
    
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        startNewRound()
    }
    
    @IBAction func getCurrentValue() {
        currentValue = Int(label.text!)!
        showCheckLabelAlert()
        roundLabel.text = String(round)
    }
    
    func showCheckLabelAlert() {
        
        let difference = abs(currentValue - targetRandomValue)
        
        if difference == 0 {
            title = "Perfect!"
            startNewGame()
            startNewRound()
        } else if currentValue > targetRandomValue {
            title = "Много!"
            startNewRound()
        } else if currentValue < targetRandomValue {
            title = "Мало!"
            startNewRound()
        }
        
        let alert = UIAlertController(title: title, message: "Я попробую ещё раз!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func startNewGame() {
        targetRandomValue = Int.random(in: 1...100)
        round = 0
    }
    
    func startNewRound() {
        round += 1
        roundLabel.text = String(round)
    }
}

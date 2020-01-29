//
//  ViewController.swift
//  EPAM iOS School_practice_1
//
//  Created by Maxim on 22.01.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var targetRandomValue = 0
    var currentValue = 0
    var round = 0
    var games = 0
    
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameslabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        startNewRound()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationStatViewController = segue.destination as? StatisticViewController else { return }
        destinationStatViewController.gamesValue = String(games)
    }
    
    @IBAction func getCurrentValue() {
        if let text = label.text, let number = Int(text) {

        currentValue = number
            
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Строка должна содержать число!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        showCheckLabelAlert()
        
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
        games += 1
        gameslabel.text = String(games)
    }
    
    func startNewRound() {
        round += 1
        roundLabel.text = String(round)
    }
}

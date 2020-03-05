//
//  ViewController.swift
//  EPAM iOS School_practice_1
//
//  Created by Maxim on 22.01.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func update(minNumber: Int, maxNumber: Int)
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    var targetRandomValue = 0
    var currentValue = 0
    var round = 0
    var games = -1
    var minNumber = 0
    var maxNumber = 0
    
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameslabel: UITextField!
    @IBOutlet weak var randomizeFromTextField: UILabel!
    @IBOutlet weak var randomizeToTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        games = -1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startNewGame()
        startNewRound()
    }
    
    func update(minNumber: Int, maxNumber: Int) {
        self.minNumber = minNumber
        self.maxNumber = maxNumber
    }
    
    func startNewGame() {
        targetRandomValue = Int.random(in: minNumber...maxNumber)
        randomizeFromTextField.text = String(minNumber)
        randomizeToTextField.text = String(maxNumber)
        round = 0
        games += 1
        gameslabel.text = String(games)
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
            startNewRound()
            randomizeFromTextField.text = "0"
            randomizeToTextField.text = "0"
            label.text = ""
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
    
    func startNewRound() {
        round += 1
        roundLabel.text = String(round)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            if let destinationController = segue.destination as? SettingsViewController {
                destinationController.minNumber = minNumber
                destinationController.maxNumber = maxNumber
                destinationController.delegate = self
            }
        }
        
        if segue.identifier == "statisticsSegue" {
            guard let destinationStatViewController = segue.destination as? StatisticViewController else { return }
            destinationStatViewController.gamesValue = String(games)
        }
    }
}

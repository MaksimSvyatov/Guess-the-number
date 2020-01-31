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
    var games = 0
    var minNumber = 0
    var maxNumber = 0
    
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameslabel: UITextField!
    @IBOutlet weak var randomizeFromTextField: UITextField!
    @IBOutlet weak var randomizeToTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        startNewRound()
    }
    
    func update(minNumber: Int, maxNumber: Int) {
        self.minNumber = minNumber
        self.maxNumber = maxNumber
        print(minNumber, maxNumber)
    }
    
    func startNewGame() {
        targetRandomValue = Int.random(in: minNumber...maxNumber)
        //print(minNumber, maxNumber, targetRandomValue)
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
    }
    
}




// Добавить в основной код обязательно


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destinationStatViewController = segue.destination as? StatisticViewController else { return }
//        destinationStatViewController.gamesValue = String(games)
//    }

// --------;;;;;;--------




//        if segue.identifier == "showStatisticSegue" {
//            if let destinationController = segue.destination as? StatisticViewController {
//                destinationController.gameCount = gameCount
//                destinationController.stepCount = bestStepCount
//            }
//        }

//    func userDidChooseFromNumber(data: Int) {
//        randomizeFromTextField.text = String(data)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "settingsSegue" {
//            guard let SettingsViewController: SettingsViewController = segue.destination as? SettingsViewController else { return }
//            SettingsViewController.delegate = self
//        }
        
//        guard let destination = segue.destination as? SettingsViewController else { return }
//        destination.delegate = self
    
    
    
      //  (randomFromNumber: String) {
//           randomizeFromTextField.text = randomFromNumber
//       }



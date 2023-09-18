//
//  ViewController.swift
//  DynamicCalculator
//
//  Created by Vikram Kunwar on 12/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundV: UIView!
    
    @IBOutlet weak var numbersView: UIView!
    
    @IBOutlet weak var caluclation: UILabel!
    
    
    var currentCalculation: String = ""

    
    @IBOutlet weak var numbersLabel: UILabel!
    
    
    var firstNumber = 0.0
    var secondNumber = 0.0
    var currentOperation: String?
    
    @IBOutlet weak var displayText: UILabel!
    
    // Create an array to store calculation history
        var history: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        numbersLabel.text = "0"
        displayText.text = "Clear"
        
        numbersView.layer.shadowColor = UIColor.black.cgColor
            numbersView.layer.shadowOffset = CGSize(width: 0, height: 2)
            numbersView.layer.shadowOpacity = 0.5
            numbersView.layer.shadowRadius = 2
            
            // Ensure that the shadow is not clipped
            numbersView.layer.masksToBounds = false
            
        
              
    }
    
    func formatNumber(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(number))
        } else {
            return String(number)
        }
    }
    
    
    
    
    @IBAction func numbersBtn(_ sender : UIButton){
        if let text = sender.titleLabel?.text {
                if numbersLabel.text == "0" {
                    numbersLabel.text = ""
                }
                if let currentText = numbersLabel.text {
                    numbersLabel.text = currentText + text
                } else {
                    numbersLabel.text = text
                }
                // Update the calculation label
                currentCalculation += text
                caluclation.text = currentCalculation
                // Update the displayText label to show the button text
                displayText.text = ""
            }
        
    }
    
    
    @IBAction func equalTo(_ sender : UIButton){
        
        
        if let operation = currentOperation {
               if let text = numbersLabel.text {
                   if let number = Double(text) {
                       switch operation {
                       case "+":
                           let result = firstNumber + number
                           numbersLabel.text = formatNumber(result)
                           displayText.text = "ADD"
                       case "-":
                           let result = firstNumber - number
                           numbersLabel.text = formatNumber(result)
                           displayText.text = "Subtract"
                       case "x":
                           let result = firstNumber * number
                           numbersLabel.text = formatNumber(result)
                           displayText.text = "Multiply"
                       case "÷":
                           if number != 0 {
                               let result = firstNumber / number
                               numbersLabel.text = formatNumber(result)
                               displayText.text = "Divide"
                           } else {
                               numbersLabel.text = "Error"
                           }
                       default:
                           break
                       }
                       // Add the calculation to the history
                       let calculation = "\(formatNumber(firstNumber)) \(operation) \(formatNumber(number)) = \(numbersLabel.text!)"
                       history.append(calculation)
                   }
               }
               displayText.text = "Equal"
           }

        
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        if let operation = sender.titleLabel?.text {
                if let text = numbersLabel.text {
                    if let number = Double(text) {
                        firstNumber = number
                        currentOperation = operation
                        numbersLabel.text = ""
                    }
                }
                // Set the displayText label to show the corresponding text
                switch operation {
                case "+":
                    displayText.text = "ADD"
                case "-":
                    displayText.text = "Subtract"
                case "x":
                    displayText.text = "Multiply"
                case "÷":
                    displayText.text = "Divide"
                default:
                    break
                }
                // Update the calculation label
                currentCalculation += " \(operation) "
                caluclation.text = currentCalculation
            }
        

        }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        numbersLabel.text = "0"
           firstNumber = 0.0
           secondNumber = 0.0
           currentOperation = nil
           // Update the displayText label to show the button text
           displayText.text = "Clear"
           
           // Clear the currentCalculation
           currentCalculation = ""
           caluclation.text = "0"
        }
    
    
    @IBAction func showHistory(_ sender: UIButton) {
            // Perform the segue to the HistoryViewController and pass the history data
        if let historyVC = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
                    historyVC.historyData = history
                    navigationController?.pushViewController(historyVC, animated: true)
                }
        }
    


}


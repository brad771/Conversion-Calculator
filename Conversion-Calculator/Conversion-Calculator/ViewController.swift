//
//  ViewController.swift
//  Conversion-Calculator
//
//  Created by Brad Puricelli on 7/24/17.
//  Copyright © 2017 Brad Puricelli. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    
    var choice: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.text = inputs[choice-1]
        outputTextField.text = outputs[choice-1]
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
        
    }
    

    var numbers: String = ""
    var unit: String = ""
    
    var inputs = ["mi", "km", "\u{00B0}F", "\u{00B0}C"]
    var outputs = ["km", "mi", "\u{00B0}C", "\u{00B0}F"]


    @IBAction func addNumber(_ sender: UIButton) {
      

        
        numbers = numbers + String(sender.tag-1)
        unit = inputs[choice-1]
    
        inputTextField.text = numbers + " " + inputs[choice-1]
        
        switch choice {
        case 1:
            self.outputTextField.text = self.milesToKilometers(numbers)
        case 2:
            self.outputTextField.text = self.kilometersToMiles(numbers)
        case 3:
            self.outputTextField.text = self.fToC(numbers)
        case 4:
            self.outputTextField.text = self.cToF(numbers)
        default:
            self.outputTextField.text = "default"
        }
    }
    
    var count = 0
    @IBAction func addDecimal(_ sender: UIButton) {
        
        if count == 0 {
        numbers = numbers + "."
            inputTextField.text = numbers + " " + inputs[choice-1]
            count = 1
        }
        
        
        
    }
    @IBAction func clearButton(_ sender: UIButton) {
        
        numbers = ""
        inputTextField.text = inputs[choice-1]
        outputTextField.text = outputs[choice-1]
        count = 0
    }
    

    @IBAction func plusminusChange(_ sender: UIButton) {
        
        if numbers == ""{
            return
        }
        
        if numbers == "." {
            return
        }
        
        var new: Double
        
        if let check = Double(numbers),
            check < 0{
            
            new = abs(check)
            numbers = String(new)
            count = 1
            
        }
        
        
            else{
                numbers = "-" + numbers
        }
        
        inputTextField.text = numbers + " " + inputs[choice-1]
        
        switch choice {
        case 1:
            self.outputTextField.text = self.milesToKilometers(numbers)
        case 2:
            self.outputTextField.text = self.kilometersToMiles(numbers)
        case 3:
            self.outputTextField.text = self.fToC(numbers)
        case 4:
            self.outputTextField.text = self.cToF(numbers)
        default:
            self.outputTextField.text = "default"
        }

    }
    
    
    func milesToKilometers(_ miles: String) -> String {
        
        let new: Double = Double(miles)!
        let multiplier: Double = 1.61
        
        let total = new * multiplier
        
        return String(total) + " km"
        
    }
    
    func kilometersToMiles(_ kilometers: String) -> String {
        
        let new: Double = Double(kilometers)!
        let multiplier: Double = 0.62
        
        let total = new * multiplier
        
        return String(total) + " mi"
        
    }
    
    
    func fToC(_ ferenheight: String) -> String {
        
        let new: Double = Double(ferenheight)!
        
        let total = (new - 32) * (5/9)
        
        //return String(round(100*total)/100) + " \u{00B0}C"
        return String(format: "%.2f", total ) + " \u{00b0}C"
        
    }
    
    
    func cToF(_ celcius: String) -> String {
        
        let new: Double = Double(celcius)!
        
        let total = new * (9/5) + 32
        
    
        return String(format: "%.2f", total ) + " \u{00b0}F"
        
    }
    
    @IBAction func converterButton(_ sender: AnyObject) {
        
        let alert = UIAlertController(title: "Choose a Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            
            self.choice = 1
            
                self.inputTextField.text = self.numbers + " " + self.inputs[self.choice-1]
            if self.numbers != ""{
            self.outputTextField.text = self.milesToKilometers(self.numbers)
            }
            else{
                self.outputTextField.text = self.outputs[self.choice-1]
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            
            self.choice = 2
            
                self.inputTextField.text = self.numbers + " " + self.inputs[self.choice-1]
            if self.numbers != ""{
                self.outputTextField.text = self.kilometersToMiles(self.numbers)
            }
            else{
                self.outputTextField.text = self.outputs[self.choice-1]
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Ferenheight to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            
            self.choice = 3
            
            self.inputTextField.text = self.numbers + " " + self.inputs[self.choice-1]
            if self.numbers != ""{
                self.outputTextField.text = self.fToC(self.numbers)
            }
            else{
                self.outputTextField.text = self.outputs[self.choice-1]
            }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Celcius to Ferenheight", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            
            self.choice = 4
            
            self.inputTextField.text = self.numbers + " " + self.inputs[self.choice-1]
            if self.numbers != ""{
                self.outputTextField.text = self.cToF(self.numbers)
            }
            else{
                self.outputTextField.text = self.outputs[self.choice-1]
            }
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

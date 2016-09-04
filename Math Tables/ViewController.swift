//
//  ViewController.swift
//  Math Tables
//
//  Created by Greg Willis on 9/1/16.
//  Copyright © 2016 Willis Programming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: - Outlets
    @IBOutlet weak var mathTablesLogo: UIImageView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var equationLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var answerBtn: UIButton!
    @IBOutlet weak var exitBtn: UIButton!
    
//MARK: - Actions
    @IBAction func playBtnPressed(sender: AnyObject) {
        if hasNumber(numberTextField) {
            textFieldNumber = getNumber()
            numA = getNumA()
            
            goToEquationPage()
            printLabel()
        }
    }
    
    @IBAction func nextBtnPressed(sender: AnyObject) {
        getNumA()
        printLabel()
    }
    
    @IBAction func answerBtnPressed(sender: AnyObject) {
        printLabelAnswer()
    }
    
    @IBAction func exitBtnPressed(sender: AnyObject) {
        goToMainPage()
        numberTextField.text = ""
        numA = 0
        answer = 0
    }
    
//MARK: - Variables
    
    var textFieldNumber: Int = 0
    var numA: Int = 0
    var answer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNumber() -> Int {
        return Int(numberTextField.text!)!
        
    }
    
    func getNumA() -> Int {
        numA = Int(arc4random_uniform(13))
        return numA
    }
    
    func printLabel() {
        equationLbl.text = "\(numA) X \(textFieldNumber) ="
    }
    
    func printLabelAnswer() {
        answer = numA * textFieldNumber
        equationLbl.text = "\(numA) X \(textFieldNumber) = \(answer)"
    }
    
    func hasNumber(textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        if let _ = Int(text) {
            // It's a number without a decimal
            return true
        }
        
        return false
    }
    
    func goToMainPage() {
        mathTablesLogo.hidden = false
        numberTextField.hidden = false
        playBtn.hidden = false
        equationLbl.hidden = true
        nextBtn.hidden = true
        answerBtn.hidden = true
        exitBtn.hidden = true
    }
    
    func goToEquationPage() {
        mathTablesLogo.hidden = false
        numberTextField.hidden = true
        playBtn.hidden = true
        equationLbl.hidden = false
        nextBtn.hidden = false
        answerBtn.hidden = false
        exitBtn.hidden = false
    }
}


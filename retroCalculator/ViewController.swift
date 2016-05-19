//
//  ViewController.swift
//  retroCalculator
//
//  Created by William Fairchild on 5/18/16.
//  Copyright © 2016 RunJumpStomp. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Global Variables
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    //Outlets
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch  let err as NSError{
            print(err.debugDescription)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Actions
    
    @IBAction func buttonPressed(btn: UIButton) {
        playSound()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        processopperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        processopperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractionPressed(sender: UIButton) {
        processopperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processopperation(Operation.Add)
    }

    @IBAction func onEqualPressed(sender: UIButton) {
        processopperation(currentOperation)
    }
        
    @IBAction func onClearPressed(sender: UIButton) {
        
        playSound()
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
        outputLbl.text = ""
    }
    
    func processopperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            //Run some math
            
            //a user selected two operators in a row.
            if runningNumber != "" {
                
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
                
                currentOperation = op
            }
            

            
        } else {
            //this is the first time an opperator has been pressed.
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
}


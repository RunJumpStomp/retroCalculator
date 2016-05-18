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
        case Equals = "="
        case Empty = "Empty"
    }
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    
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
        btnSound.play()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
    }
    
    @IBAction func onSubtractionPressed(sender: UIButton) {
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
    }

    @IBAction func onEqualPressed(sender: UIButton) {
    }
}


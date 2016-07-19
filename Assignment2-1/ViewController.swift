//
//  ViewController.swift
//  Assignment2-1
//
//  Created by Tony on 6/28/16.
//  Copyright © 2016 Anthony Cavallo. All rights reserved.
//  This is just a simple binary calculator game, created to supplement an instructional document for English 3130: Technical Writing

import UIKit

class ViewController: UIViewController {
    
    var randomNum: UInt32 = 0
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var binaryString: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNum = arc4random() % 512
        numberLabel.text = String(format: "Convert %i to binary", randomNum)
        answerLabel.text = "Answer"
        binaryStringConversion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Every time a switch is flipped, regardless of which one, we need to recalculate the binary string.
    @IBAction func switchFlipped(sender: UISwitch) {
        binaryStringConversion()
    }

    @IBOutlet weak var s0: UISwitch!
    @IBOutlet weak var s1: UISwitch!
    @IBOutlet weak var s2: UISwitch!
    @IBOutlet weak var s3: UISwitch!
    @IBOutlet weak var s4: UISwitch!
    @IBOutlet weak var s5: UISwitch!
    @IBOutlet weak var s6: UISwitch!
    @IBOutlet weak var s7: UISwitch!
    @IBOutlet weak var s8: UISwitch!
    
    //Check the answer to see if what the user entered, through switches, is correct.
    @IBAction func checkAnswer(sender: UIButton) {
        var x: UInt32 = 0
        if s0.on { x += 1 }
        if s1.on { x += 2 }
        if s2.on { x += 4 }
        if s3.on { x += 8 }
        if s4.on { x += 16 }
        if s5.on { x += 32 }
        if s6.on { x += 64 }
        if s7.on { x += 128 }
        if s8.on { x += 256 }
        
        if x == randomNum {
            answerLabel.text = "Correct!"
        } else {
            answerLabel.text = String(format: "Incorrect. You entered %i", x)
        }
    }
    
    //Generate a random number, then turn each switch off.
    @IBAction func newNumber(sender: UIButton) {
        randomNum = arc4random() % 512
        numberLabel.text = String(format: "Convert %i to binary", randomNum)
        s0.setOn(false, animated: true)
        s1.setOn(false, animated: true)
        s2.setOn(false, animated: true)
        s3.setOn(false, animated: true)
        s4.setOn(false, animated: true)
        s5.setOn(false, animated: true)
        s6.setOn(false, animated: true)
        s7.setOn(false, animated: true)
        s8.setOn(false, animated: true)

        answerLabel.text = "Answer"
        binaryStringConversion()
    }

    //Change the binary string label, based on whether the switch is on or off for that index.
    func binaryStringConversion() {
        var zero = 0; var one = 0; var two = 0; var three = 0; var four = 0; var five = 0; var six = 0
        var seven = 0; var eight = 0
        
        if s0.on { zero = 1  } else { zero = 0 }
        if s1.on { one = 1   } else { one = 0 }
        if s2.on { two = 1   } else { two = 0 }
        if s3.on { three = 1 } else { three = 0 }
        if s4.on { four = 1  } else { four = 0 }
        if s5.on { five = 1  } else { five = 0 }
        if s6.on { six = 1   } else { six = 0 }
        if s7.on { seven = 1 } else { seven = 0 }
        if s8.on { eight = 1 } else { eight = 0 }
        
        binaryString.text = String(format: "%i%i%i%i%i%i%i%i%i", eight, seven, six, five, four, three, two, one, zero)
    }
}
//
//  ViewController0.swift
//  ticTacToe
//
//  Created by Connor Pan on 7/3/15.
//  Copyright © 2015 Connor Pan. All rights reserved.
//

import UIKit

class ViewController0: UIViewController {

    @IBOutlet weak var playMPButton: UIButton!
    
    @IBOutlet weak var labelTopLeft: gridLabel!
    @IBOutlet weak var labelTopMid: gridLabel!
    @IBOutlet weak var labelTopRight: gridLabel!
    
    @IBOutlet weak var labelMidLeft: gridLabel!
    @IBOutlet weak var labelMidMid: gridLabel!
    @IBOutlet weak var labelMidRight: gridLabel!
    
    @IBOutlet weak var labelBotLeft: gridLabel!
    @IBOutlet weak var labelBotMid: gridLabel!
    @IBOutlet weak var labelBotRight: gridLabel!
 
    @IBOutlet weak var playAreaView: UIView!
    
    var labelsArray : [gridLabel!] = []
    var turn = 0
    var win = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMPButton.backgroundColor = UIColor.redColor()
        
        labelsArray = [labelTopLeft,labelTopMid,labelTopRight,labelMidLeft,labelMidMid,labelMidRight,labelBotLeft,labelBotMid,labelBotRight]
       
    }

    @IBAction func onMPButtonTapped(sender: UIButton) {
    }
 
    @IBAction func onScreenWasTapped(sender: UITapGestureRecognizer) {
        for label in labelsArray {
            
            if CGRectContainsPoint(label.frame, sender.locationInView(playAreaView)){
                //assigns X turn
                if label.text != "X" && label.text != "O" {
                    if turn % 2 == 0 {
                        label.text = "X"
                        hal9000()
                        if turn >= 3 {
                            checkForWinner()
                        }
                        if win == true {
                            win = false
                            alertMessageWin(label.text!)
                            for label in labelsArray {
                                label.text = ""
                                
                            }
                            
                        }
                        else {
                            if turn <= 7 {
                                turn++
                            }
                            else {
                                alertMessageCG(label.text!)
                                turn = 0
                                for label in labelsArray {
                                    label.text = ""
                                }
                            }
                        }
                        //end X turn
                    }
                    
    
                }
            }
        }
    }
    
    func hal9000 () {
        let pos = Int(arc4random_uniform(UInt32(labelsArray.count)))
            if labelsArray[pos].text != "X" && labelsArray[pos].text != "O" {
            labelsArray[pos].text = "O"
        }
        turn++
    }
    
    func checkForWinner () {
        
        if labelTopLeft.text == labelTopMid.text && labelTopLeft.text == labelTopRight.text && labelTopLeft.text != "" {
            win = true
            turn = 0
        }
        else if labelTopLeft.text == labelMidLeft.text && labelTopLeft.text == labelBotLeft.text && labelTopLeft.text != "" {
            win = true
            turn = 0
        }
        else if labelTopLeft.text == labelMidMid.text && labelTopLeft.text == labelBotRight.text && labelTopLeft.text != "" {
            win = true
            turn = 0
        }
        else if labelMidLeft.text == labelMidMid.text && labelMidLeft.text == labelMidRight.text && labelMidLeft.text != "" {
            win = true
            turn = 0
        }
        else if labelTopMid.text == labelMidMid.text && labelTopMid.text == labelBotMid.text && labelTopMid != "" {
            win = true
            turn = 0
        }
        else if labelTopRight.text == labelMidRight.text && labelTopRight.text == labelBotRight.text && labelTopRight.text != "" {
            win = true
            turn = 0
        }
        else if labelBotLeft.text == labelBotMid.text && labelBotLeft.text == labelBotRight.text && labelBotLeft.text != "" {
            win = true
            turn = 0
        }
        else if labelTopRight.text == labelMidMid.text && labelTopRight.text == labelBotLeft.text && labelTopRight.text != "" {
            win = true
            turn = 0
        }
        else {
            win = false
        }
        
    }
    
    func alertMessageWin(value : String) {
        let message = "Player " + value + " Wins!"
        let alert = UIAlertController(title: "Winner!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
        self.presentViewController(alert, animated : true, completion: nil)
    }
    func alertMessageCG(value : String) {
        let message = "Cat's Game."
        let alert = UIAlertController(title: "Cat's Game", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
        self.presentViewController(alert, animated : true, completion: nil)
    }
    
    
    @IBAction func onPlaySPButtonTapped(sender: UIButton) {
    }
    
    
    
    
    
    
    
}






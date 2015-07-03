//
//  ViewController.swift
//  ticTacToe
//
//  Created by Connor Pan on 7/2/15.
//  Copyright © 2015 Connor Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelTopLeft: gridLabel!
    @IBOutlet weak var labelTopMid: gridLabel!
    @IBOutlet weak var labelTopRight: gridLabel!
    
    @IBOutlet weak var labelMidLeft: gridLabel!
    @IBOutlet weak var labelMidMid: gridLabel!
    @IBOutlet weak var labelMidRight: gridLabel!
    
    @IBOutlet weak var labelBotLeft: gridLabel!
    @IBOutlet weak var labelBotMid: gridLabel!
    @IBOutlet weak var labelBotRight: gridLabel!
    
    @IBOutlet weak var playSPButton: UIButton!
    
    var labelsArray :[gridLabel!] = []
    var turn = 0
    var win = false
    
    @IBOutlet weak var playAreaView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray = [labelTopLeft,labelTopMid,labelTopRight,labelMidLeft,labelMidMid,labelMidRight,labelBotLeft,labelBotMid,labelBotRight]
        playSPButton.backgroundColor = UIColor.cyanColor()
        
    }
    
    @IBAction func onScreenWasTapped(sender: UITapGestureRecognizer) {
        for label in labelsArray {
            
            if CGRectContainsPoint(label.frame, sender.locationInView(playAreaView)){
                //assigns X turn
                if label.text != "X" && label.text != "O" {
                    if turn % 2 == 0 {
                        label.text = "X"
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
                    //assigns O turn
                    else {
                        label.text = "O"
                        if turn >= 5 {
                            checkForWinner()
                        }
                        
                        if win == true {
                            win = false
                            alertMessageWin(label.text!)
                            for label in labelsArray {
                                label.text = ""
                                turn = 0
                            }
                            turn = 0
                        }
                        else {
                            if turn <=  7 {
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
                        
                    }
                }
            }
        }
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


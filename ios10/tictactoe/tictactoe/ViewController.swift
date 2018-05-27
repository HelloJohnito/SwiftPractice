//
//  ViewController.swift
//  tictactoe
//
//  Created by John  Ito lee on 11/18/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var youWinLabel: UILabel!
    
    var gameWin = false
    
    var gameState: [String: String?] = [
        "btn-1": nil,
        "btn-2": nil,
        "btn-3": nil,
        "btn-4": nil,
        "btn-5": nil,
        "btn-6": nil,
        "btn-7": nil,
        "btn-8": nil,
        "btn-9": nil,
    ]
    
    var playerObject = ["playerOne": ["mark": "x", "image": "cross.png"],
                        "playerTwo": ["mark" :"o", "image": "nought.png"]
                       ]
    
    var playerTurn = "playerOne"
    
    @IBAction func clickedButton(_ sender: UIButton) {
        let currentButton = sender.currentTitle!
        
        if(!gameWin){
            if let spotTaken = gameState[sender.currentTitle!]! {
                print("Spot is taken by \(spotTaken)")
            }
            else {
                //UPDATE state
                gameState[currentButton] = playerObject[playerTurn]!["mark"]!
                //UPDATE Board
                sender.setImage(UIImage(named: playerObject[playerTurn]!["image"]!), for: .normal)
                // change player
                playerTurn = playerTurn == "playerOne" ? "playerTwo" : "playerOne"
            }
        
            self.checkWin(button: currentButton)
        }
    }

    
    func checkWin(button: String) {
        print(gameState)
        switch button {
            case "btn-1", "btn-3", "btn-5", "btn-7", "btn-9":
                checkVertical(button: button)
                checkHorizontal(button: button)
                checkDiagonal(button: button)
                break
            case "btn-2", "btn-4", "btn-6", "btn-8":
                checkVertical(button: button)
                checkHorizontal(button: button)
                break
            default:
                print("something went wrong")
                break
        }
    }

    
    func checkVertical(button: String){
        switch button {
            case "btn-1", "btn-4", "btn-7":
                if(gameState["btn-1"]! == gameState["btn-4"]! && gameState["btn-4"]! == gameState["btn-7"]!){
                    notifyWinner()
                }
                break
            case "btn-2", "btn-5","btn-8":
                if(gameState["btn-2"]! == gameState["btn-5"]! && gameState["btn-5"]! == gameState["btn-8"]!){
                    notifyWinner()
                }
                break
            case "btn-3","btn-6", "btn-9":
                if(gameState["btn-3"]! == gameState["btn-6"]! && gameState["btn-6"]! == gameState["btn-9"]!){
                    notifyWinner()
                }
                break
            default:
                print("error")
        }
    }
    
    func checkHorizontal(button: String){
        switch button {
            case "btn-1", "btn-2", "btn-3":
                if(gameState["btn-1"]! == gameState["btn-2"]! && gameState["btn-2"]! == gameState["btn-3"]!){
                    notifyWinner()
                }
                break
            case "btn-4", "btn-5", "btn-6":
                if(gameState["btn-4"]! == gameState["btn-5"]! && gameState["btn-5"]! == gameState["btn-6"]!){
                    notifyWinner()
                }
                break
            case "btn-7", "btn-8", "btn-9":
                if(gameState["btn-7"]! == gameState["btn-8"]! && gameState["btn-8"]! == gameState["btn-9"]!){
                    notifyWinner()
                }
                break
            default:
                print("Error")
                break
        }
    }
    
    func checkDiagonal(button: String){
        switch button {
        case "btn-1", "btn-9":
            if(gameState["btn-1"]! == gameState["btn-5"]! && gameState["btn-5"]! == gameState["btn-9"]!){
                notifyWinner()
            }
            break
        case "btn-5":
            if(gameState["btn-1"]! == gameState["btn-5"]! && gameState["btn-5"]! == gameState["btn-9"]!){
                notifyWinner()
            }
            if(gameState["btn-3"]! == gameState["btn-5"]! && gameState["btn-5"]! == gameState["btn-7"]!){
                notifyWinner()
            }
            break
        case "btn-3", "btn-7":
            if(gameState["btn-3"]! == gameState["btn-5"]! && gameState["btn-5"]! == gameState["btn-7"]!){
                notifyWinner()
            }
            break
        default:
            print("Error")
            break
        }
    }
    
    
    func notifyWinner(){
        print("You Win")
        gameWin = true
        youWinLabel.textColor = UIColor.blue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




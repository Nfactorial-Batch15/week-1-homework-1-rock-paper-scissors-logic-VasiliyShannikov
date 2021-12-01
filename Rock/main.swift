//
//  main.swift
//  Rock
//
//  Created by Vasiliy Shannikov on 30.11.2021.
//

import Foundation

protocol Playable {
   func makeChoice() -> Int
}

enum Choice: Int {
    case stone = 1
    case scissors = 2
    case paper = 3
   
}

class Player : Playable {
    func makeChoice() -> Int {
        print("""
    Please choose:
        1 - stone
        2 - scissors
        3 - paper
    """)
    var choice1 : Int = -1
        print("Please type  a number")
        if let number =  readLine(){
            if let choice = Int(number), choice >= 1, choice <= 3 {
                print("You make your choice")
                choice1 = choice
            }
            else {
                print("You type wrong simbol.  \n Do you want to try again? Please type yes or no ")
                if let a = readLine(), a == "yes" {
                   choice1 =  makeChoice()
                }
        }
        
        }
        return choice1
    }
    
    var name: String
    
    init (name1: String) {
        name = name1
    }
}
var playerName: String
print("Hello! Please enter your name:")
if let a = readLine() {
    playerName = a
}
else {
    playerName = "default"
}
var player = Player(name1: playerName)
var scorePlayer = 0
var scoreComp = 0

print("\(player.name), would you like to play a game? \n please type yes or no")
if let input = readLine(), input == "yes" {
    var posibility = "yes"
    while (posibility == "yes") {
        let playerChoice = player.makeChoice()
        var playerChoiceStr :String
        switch playerChoice {
        case 1 :playerChoiceStr = "stone"
        case 2: playerChoiceStr = "scissors"
        case 3: playerChoiceStr = "paper"
        default: playerChoiceStr = "nothing"
        }
        print ("\(player.name)'s choice  is " + playerChoiceStr)
        
        let compChoice = Int.random(in: 1...3)
        var compChoiceStr :String
        switch compChoice {
        case 1 :compChoiceStr = "stone"
        case 2: compChoiceStr = "scissors"
        case 3: compChoiceStr = "paper"
        default: compChoiceStr = "nothing"
        }
        print ("Comp's choice  is " + compChoiceStr)
        
        
        let stoneScissors = compChoice==Choice.stone.rawValue && playerChoice == Choice.scissors.rawValue
        let scissorsPaper = compChoice==Choice.scissors.rawValue && playerChoice == Choice.paper.rawValue
        let paperStone = compChoice==Choice.paper.rawValue && playerChoice == Choice.stone.rawValue

        if compChoice == playerChoice  {
             print("The game is tied")
        } else if stoneScissors || scissorsPaper || paperStone {
          print ("Computer wins this round")
            scoreComp += 1
        } else {
            print ("\(player.name) wins this round")
            scorePlayer += 1
        }
         
        print("Would you like to continue the game? \n Type yes, if you want.")
        if let a = readLine(), a == "yes" {
            posibility = a
        }
        else {
            break
        }
    }
}
print("""
SCORE:
    Computer   \(player.name)
        \(scoreComp)         \(scorePlayer)

        GAME OVER!!!
""")

//
//  ViewController.swift
//  Project2
//
//  Created by giovanni modica on 20.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!

    @IBOutlet var button2: UIButton!

    @IBOutlet var button3: UIButton!

    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countries += ["estonia", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 0.5
        button2.layer.borderWidth = 0.5
        button3.layer.borderWidth = 0.5
        
        //you can also cuse UIcolor(red:, green:, blue:).cgColor
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion(action: nil)
    }


    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2) //number between 0 and 2 inclusive
        
        // .normal non é realmente una enum anche se sembrerebbe una enum
        button1.setImage(UIImage(named: countries[0]), for:.normal)
        button2.setImage(UIImage(named: countries[1]), for:.normal)
        button3.setImage(UIImage(named: countries[2]), for:.normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    //three buttons are into the same method that's interestin not existing in android, you can still do it but in a different way
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score +=  1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        
        let ac = UIAlertController(
            title: title,
            message: "Your score is \(score)",
            preferredStyle: .alert //there is also .actionsheet
        )
        
        ac.addAction(
            UIAlertAction(
                title: "continue",
                style: .default,
                handler: askQuestion
            )
        )
        
        present(ac, animated: true)
    }
    
}


//
//  ViewController.swift
//  VocabularyGuess
//
//  Created by Clovis Magenta da Cunha on 12/02/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit
import TransitionButton

class ViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var manageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerButton.backgroundColor = .red
        registerButton.layer.cornerRadius = 20
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.tintColor = .white
        
        playButton.backgroundColor = .red
        playButton.layer.cornerRadius = 20
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.tintColor = .white
        
    }

    @IBAction func registerDataButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "playSegue", sender: self)
    }
    
    @IBAction func manageButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "manageSegue", sender: self)
    }
}

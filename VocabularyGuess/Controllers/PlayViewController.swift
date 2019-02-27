//
//  PlayViewController.swift
//  VocabularyGuess
//
//  Created by Clovis Magenta da Cunha on 13/02/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit
import RealmSwift

class PlayViewController: UIViewController {

    private let myRealm = try! Realm()
    private var emptyDB = false
    private var positionRightQuestion = 0
    private var defaultButtonColor = UIColor.blue
    private var glovalTranslation : Translations?
    
    @IBOutlet weak var englishWordLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        defaultButtonColor = option1Button.titleColor(for: .normal) ?? .blue
    }
    
    func updateQuestion() {
        updateUI()
    }
    
    func updateUI() {
        
        guard let newTranslation = loadTranslation() else { return }
        glovalTranslation = newTranslation
        
        positionRightQuestion = Int.random(in: 1...4)
    
        englishWordLabel.text = newTranslation.english
        
        // ****************   1   ****************//
        if positionRightQuestion != 1 {
            option1Button.setTitle( loadOptions(lessThisOne: newTranslation.internalID ), for: .normal )
        } else {
            option1Button.setTitle( newTranslation.translation , for: .normal )
        }
        option1Button.setTitleColor(defaultButtonColor, for: .normal)
        
        // ****************   2   ****************//
        if positionRightQuestion != 2 {
            option2Button.setTitle( loadOptions(lessThisOne: newTranslation.internalID ), for: .normal )
        } else {
            option2Button.setTitle( newTranslation.translation , for: .normal )
        }
        option2Button.setTitleColor(defaultButtonColor, for: .normal)
        
        // ****************   3   ****************//
        if positionRightQuestion != 3 {
            option3Button.setTitle( loadOptions(lessThisOne: newTranslation.internalID ), for: .normal )
        } else {
            option3Button.setTitle( newTranslation.translation , for: .normal )
        }
        option3Button.setTitleColor(defaultButtonColor, for: .normal)
        
        // ****************   4   ****************//
        if positionRightQuestion != 4 {
            option4Button.setTitle( loadOptions(lessThisOne: newTranslation.internalID ), for: .normal )
        } else {
            option4Button.setTitle( newTranslation.translation , for: .normal )
        }
        option4Button.setTitleColor(defaultButtonColor, for: .normal)

    }
    
    func loadTranslation() -> Translations? {
        
        let thisTranslation: Translations?
        
        if let pickedTranslation = myRealm.objects(Translations.self).randomElement() {
            thisTranslation = pickedTranslation
        } else {
            thisTranslation = nil
            emptyDB = true
        }
        
        return thisTranslation
        
    }
    
    func loadOptions( lessThisOne: String ) -> String {
        
        var cOption = ""
        
        if let optionalTransl = myRealm.objects(Translations.self).filter("internalID <> '\(lessThisOne)'").randomElement() {
            cOption = optionalTransl.translation
        }
        
        return cOption
    }
    
    @IBAction func answerChoosenAction(_ sender: UIButton) {
        
        let optionPicked = sender.tag
        
        if optionPicked == positionRightQuestion {
            sender.setTitleColor(.green, for: .normal)
            processNextQuestion()
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
        
    }
    
    func processNextQuestion() {
        
        let explanationText = glovalTranslation?.explanation
        let alert = UIAlertController(title: "Congrats! You've got it!", message: explanationText, preferredStyle: .alert)
        let when = DispatchTime.now() + 3
        
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: when) {
            alert.dismiss(animated: true, completion: {
                self.updateQuestion()
            })
        }
        
        
    }

}

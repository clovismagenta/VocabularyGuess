//
//  RegisterDataViewController.swift
//  VocabularyGuess
//
//  Created by Clovis Magenta da Cunha on 12/02/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterDataViewController: UIViewController {

    let myRealm = try! Realm()
    
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var englishWordText: UITextField!
    @IBOutlet weak var nativeWordText: UITextField!
    @IBOutlet weak var explanationText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        
        if validInfo() {
            
            let newTranslation = Translations()
            
            newTranslation.english = englishWordText!.text!
            newTranslation.translation = nativeWordText!.text!
            newTranslation.explanation = explanationText!.text!
            
            saveWord(thisTranslation: newTranslation)
            updateUI()

        } else {
            alertLabel.text = "Please, fill first 2 fields"
            alertLabel.isHidden = false
        }

    }
    
    func validInfo() -> Bool {
        
        var lOK = true
        
        if let english = englishWordText.text {
            if english.isEmpty {
                lOK = false
            } else if let translation = nativeWordText.text {
                if translation.isEmpty {
                    lOK = false
                }
            }
        }
        
        return lOK
    }
    
    func saveWord( thisTranslation : Translations) {
        
        do {
            try myRealm.write {
                myRealm.add( thisTranslation )
            }
        } catch {
            //show a message
        }
    }

    func updateUI() {
        
        englishWordText.text = ""
        nativeWordText.text = ""
        explanationText.text = ""
        alertLabel.isHidden = true
        
    }

}

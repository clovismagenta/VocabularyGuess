//
//  Translations.swift
//  VocabularyGuess
//
//  Created by Clovis Magenta da Cunha on 13/02/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import Foundation
import RealmSwift

class Translations: Object {
    @objc dynamic var internalID : String = UUID().uuidString
    @objc dynamic var english : String = ""
    @objc dynamic var translation : String = ""
    @objc dynamic var explanation : String = ""
    
    //var parentCategory = LinkingObjects(fromType: Category.self, property:"items")
}

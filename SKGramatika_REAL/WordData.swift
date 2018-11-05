//
//  WordData.swift
//  SKGramatika_REAL
//
//  Created by Michal Vavercak on 11/3/18.
//  Copyright © 2018 Michal Vavercak. All rights reserved.
//

import Foundation

class WordDataDef {
    
    let word : String
    let correct : String
    let answer : Int
    
    init(wordExact: String, wordCorrect: String, answerExact: Int) {
        word = wordExact
        correct = wordCorrect
        answer = answerExact
    }
}

class WordData {
    
    var wordData = [WordDataDef]()
    
    init() {
        
        wordData.append(WordDataDef(wordExact: "zm_sel pre poriadok", wordCorrect: "zmysel pre poriadok", answerExact: 1))
        wordData.append(WordDataDef(wordExact: "Um_la umývadlo", wordCorrect: "umyla umývadlo", answerExact: 1))
        wordData.append(WordDataDef(wordExact: "dob_ť", wordCorrect: "dobyť", answerExact: 1))
        wordData.append(WordDataDef(wordExact: "hm_riť sa", wordCorrect: "hmýriť sa", answerExact: 1))
        wordData.append(WordDataDef(wordExact: "kor_to", wordCorrect: "koryto", answerExact: 1))
        wordData.append(WordDataDef(wordExact: "prez_vať", wordCorrect: "prezývať", answerExact: 1))
        wordData.append(WordDataDef(wordExact: "m_kina", wordCorrect: "mikina", answerExact: 2))
        wordData.append(WordDataDef(wordExact: "horč_ca", wordCorrect: "horčica", answerExact: 2))
        wordData.append(WordDataDef(wordExact: "stol_čka", wordCorrect: "stolička", answerExact: 2))
        wordData.append(WordDataDef(wordExact: "l_ezť", wordCorrect: "liezť", answerExact: 2))
        wordData.append(WordDataDef(wordExact: "p_lník", wordCorrect: "pilník", answerExact: 2))
        wordData.append(WordDataDef(wordExact: "slan_na", wordCorrect: "slanina", answerExact: 2))
        
       
        
        
    }
    
    
}



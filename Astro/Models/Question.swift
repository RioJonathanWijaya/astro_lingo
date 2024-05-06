//
//  Question.swift
//  Astro
//
//  Created by Rio Jonathan on 02/05/24.
//

import Foundation
import SwiftData

@Model
class Questions: Identifiable{
    var id = UUID()
    var questions: String
    var correctAnswer: [String]
    var answer: [String]
    var score: Int = 0
    var status: [Bool]
    var indexButton: Int
    var stage: Int
    
    init(id: UUID = UUID(), questions: String, correctAnswer: [String], answer: [String], score: Int, status: [Bool], indexButton: Int, stage: Int) {
        self.id = id
        self.questions = questions
        self.correctAnswer = []
        self.answer = answer
        self.score = score
        self.status = status
        self.indexButton = indexButton
        self.stage = stage
    }


}

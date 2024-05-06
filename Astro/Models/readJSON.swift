//
//  readJSON.swift
//  Astro
//
//  Created by Rio Jonathan on 30/04/24.
//

import Foundation

struct Question: Codable, Identifiable {
    
    enum CodingKeys: CodingKey{
        case question
        case correctAnswer
        case answer1
        case answer2
    }
    
    var id = UUID()
    var question: String
    var correctAnswer: [String]
    var answer1: [String]
    var answer2: [String]
}

class readQuestion: ObservableObject {
    @Published var question = [Question]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        guard let url = Bundle.main.url(forResource: "data-2", withExtension: "json")
        else {
            print("JSON File Not Found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let question = try? JSONDecoder().decode([Question].self, from: data!)
        
        self.question = question!
    }
    
}

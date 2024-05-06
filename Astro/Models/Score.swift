//
//  Score.swift
//  Astro
//
//  Created by Rio Jonathan on 02/05/24.
//

import Foundation
import SwiftUI

struct Score: View{
    @Binding private var question: Questions
    
    var body: some View{
        VStack{
            HStack{
                ForEach(0..<question.score, id:\.self){
                    i in
                    Image("star").resizable()
                }
            }
        }
    }
}

//#Preview {
//    Score(question: $question)
//}

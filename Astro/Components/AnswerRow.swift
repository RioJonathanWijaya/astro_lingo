//
//  AnswerRow.swift
//  Astro
//
//  Created by Rio Jonathan on 30/04/24.
//
import Foundation
import SwiftUI

struct AnswerRow: View{
    var answer: Answer
    @Binding var question: Questions
    @State private var isSelected = false
    @State var status = false
    var index: Int
//    @Binding var selected: String
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094
    , blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20){
            Text(answer.text).font(.custom("SPACE-Regular", size: 15))
                
        }.padding(20)
            .frame(maxWidth: 200, minHeight: 55)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        .shadow(.inner(color: Color(red: 158/255, green: 240/255, blue: 252/255),radius: 3, x:0, y: 3))
                        .shadow(.inner(color: Color(red: 25/255, green: 160/255, blue: 179/255),radius: 5, x:0, y: -6))
                        
                    )
                    .foregroundColor(Color(red: 30/255, green: 206/255, blue: 231/255))
                    

            )
            
            .foregroundStyle(.white)
            .cornerRadius(35)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 35).stroke(Color.white, lineWidth: isSelected ? 10 : 0))
            .onTapGesture {
                if(isSelected){
                        isSelected = false
                    question.status.removeAll()

                } else{
                    if (question.status.count != 1) {
                        print(question.status.count)
                        if (question.answer.count <= index){
                            question.answer.append(answer.text)
                            isSelected = true
                            question.status.append(status)
                        }else {
                            question.answer[index] = answer.text
                            isSelected = true
                            question.status.append(status)
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
    }
}

//#Preview {
//    AnswerRow(answers: "Test")
//}

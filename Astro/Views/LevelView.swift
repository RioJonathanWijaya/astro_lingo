//
//  LevelView.swift
//  Astro
//
//  Created by Rio Jonathan on 29/04/24.
//

import Foundation
import SwiftUI

var ansIndex: Int = 0;

struct LevelView: View{
    
    @Environment(\.presentationMode) private var
presentationMode: Binding<PresentationMode>
    
    @ObservedObject var data = readQuestion()
    
    @State private var isWhatButton = false;
    @State private var indexButton = 0;
    @State var isChange = false
    @State var selected = ""
    @State private var isSelected = false
    @State private var totalAnswered = 0;
    @State private var answersArray = [" "]
    @State var answerStatus = [false, false]
   
    
    var status = false
    
    @Binding var whatStage: Int
    var index: Int
    @State var question: Questions = Questions(questions: "", correctAnswer: [], answer: ["",""], score: 0, status:[], indexButton: 5, stage: 0)
    var body: some View{
        NavigationStack{
            ZStack{
                Image("level")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    VStack{
                        HStack(content: {
                            backButtonView().padding(.leading, -2)
                            
                            Text("STAGE 1-1").font(.custom("SPACE-Regular", size: 30)).foregroundStyle(.white)
                                .padding(.leading, 20)
                        })
                    }.padding(.top, 40)
                    Rectangle().frame(height: 10).opacity(0)
                    VStack{
                        
                        Text(data.question[index].question).font(.system(size: 20, weight: .regular, design: .rounded)).foregroundStyle(Color.white)
                            .frame(width: 350)
                            .padding(.all, 10)
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Material.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            }
                            .padding(.top, 25)
                        
                        
                    }
                    VStack{
                        
                        HStack{
                            ForEach(0...1, id: \.self){
                                i in
                                Button(action:{ isWhatButton.toggle()
                                    indexButton = i}){
                                        Text("\(i+1)").font(.custom( "SPACE-Regular", size: 20)).foregroundStyle(.black).padding(.horizontal, 70)
                                            .padding(.vertical, 20)
                                            .background(.white)
                                            .cornerRadius(10)
                                            .padding(.top, 20)
                                    }
                            }
                            
                        }
                    }
                    Rectangle().frame(height: 10).opacity(0)
                    if (isWhatButton){
                        VStack{
                            HStack{
                                if indexButton == 0 {
                                    AnswerRow(answer: Answer( text: data.question[index].answer1[0], isCorrect: true),question: $question, index: indexButton)
                                    
                                    AnswerRow(answer: Answer( text: data.question[index].answer1[1], isCorrect: false),question: $question, index: indexButton)
                                } else if indexButton == 1 {
                                    AnswerRow(answer: Answer( text: data.question[index].answer2[0], isCorrect: true),question: $question, index: indexButton)
                                    AnswerRow(answer: Answer( text: data.question[index].answer1[1], isCorrect: true),question: $question, index: indexButton)
                                }
                                
                                
                                
                            }
                            if indexButton == 0 {
                                AnswerRow(answer: Answer( text: data.question[index].answer1[2], isCorrect: false),question: $question, index: indexButton)
                            } else if indexButton == 1 {
                                AnswerRow(answer: Answer( text: data.question[index].answer2[2], isCorrect: true),question: $question, index: indexButton)
                            }
                        }.padding(.top, 50)
                            .padding([.leading, .trailing], 10)
                        Rectangle().frame(height: 20).opacity(0)
                        VStack{
                            Text("SUBMIT").font(.custom("SPACE-Regular", size: 20))
                                .frame(maxWidth: 200, minHeight: 55)
                                .background(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .fill(
                                            .shadow(.inner(color: Color(red: 158/255, green: 240/255, blue: 252/255),radius: 3, x:0, y: 3))
                                            .shadow(.inner(color: Color(red: 25/255, green: 160/255, blue: 179/255),radius: 5, x:0, y: -6))
                                            
                                        )
                                        .foregroundColor(Color(red: 30/255, green: 206/255, blue: 231/255)))
                                .foregroundStyle(.white)
                            
                                .cornerRadius(35)
                                .padding(5)
                                .onTapGesture {
                                    if(answerStatus[indexButton] == false){
                                        answerStatus[indexButton] = true
                                    }
                                    print(answerStatus[indexButton])
                                    
                                    isWhatButton.toggle()
                                    
//                                    print(totalAnswered)
                                    print(question.answer)
                                    question.status.removeAll()
                                    
                                }
//                            Rectangle().frame(height: 10)
                        }
                        
                        
                    } else {
                        
                        if(answerStatus[0] == true && answerStatus[1] == true){
                            NavigationLink(destination: ScoreView(question: $question, whatStage: $whatStage),label: {
//                                Rectangle().frame(height: 150).opacity(0)
                                VStack{
                                    Rectangle().frame(height: 25).opacity(0)
                                    Text("FINISH").font(.custom("SPACE-Regular", size: 20))
                                        .frame(maxWidth: 200, minHeight: 55)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .fill(
                                                    .shadow(.inner(color: Color(red: 158/255, green: 240/255, blue: 252/255),radius: 3, x:0, y: 3))
                                                    .shadow(.inner(color: Color(red: 25/255, green: 160/255, blue: 179/255),radius: 5, x:0, y: -6))
                                                    
                                                )
                                                .foregroundColor(Color(red: 30/255, green: 206/255, blue: 231/255)))
                                        .foregroundStyle(.white)
                                    
                                        .cornerRadius(35)
                                        .onTapGesture {
                                            question.indexButton = index
                                            for i in 0...1{
                                                question.correctAnswer.append(data.question[index].correctAnswer[i])
                                                print("\(data.question[index].correctAnswer[i])")
                                                if(question.answer[i] == question.correctAnswer[i]){
                                                    question.score += 1
                                                }
                                            }
                                            print(question.score)
                                            isChange.toggle()
                                            
                                        }
                                    Rectangle().frame(height: 190).opacity(0)
                                }
                            })
                            
                        }else {
                            Rectangle().frame(height: 285).opacity(0)
                        }
                        NavigationLink("", destination: ScoreView(question: $question, whatStage: $whatStage), isActive: $isChange)
                    }
                    
                    
                }
            }
            
            
        }.navigationBarBackButtonHidden()
            .onAppear(perform: {
                question.questions = data.question[index].question
                question.stage = whatStage
            })
        
    }
}


//#Preview {
//    LevelView(index: 0)
//}


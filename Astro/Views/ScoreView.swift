//
//  ScoreView.swift
//  Astro
//
//  Created by Rio Jonathan on 30/04/24.
//

import Foundation
import SwiftUI



struct ScoreView: View{
    @Binding var question: Questions
    @State var currentLevel: Int = 0
    @State var totalScore = 0.0
    @Environment(\.modelContext) var context
    @Binding var whatStage: Int
    @State var isChange = false
    
    var body: some View{
        
        NavigationStack{
            ZStack{
                Image("score_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    ZStack{

                        Text("COMPLETE").font(.custom("SPACE-Regular", size: 36)).foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 340, height: 60)
                        .padding(.all, 10)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Material.ultraThinMaterial)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        }
                        .padding(.top, 20)
                        
                    }
                    VStack{
                        Text("\(Int(totalScore))%").font(.custom("SPACE-Regular", size: 75)).foregroundStyle(.white).padding(.top, 20)
                        Rectangle().frame(height: 20).opacity(0)
                        ZStack{
                                Image("empty_stars").resizable().frame(width: 325, height: 100)
                                if(question.correctAnswer.count % 2 == 0){
                                    if(question.score == 1){
                                        Image("half_stars").resizable().frame(width: 325, height: 100)
                                    } else if (question.score == 2){
                                        Image("stars").resizable().frame(width: 325, height: 100)
                                }else{
                                        Image("empty_stars").resizable().frame(width: 325, height: 100)
                                }
                                
                            }
                        }.padding([.top], -80)
                        Rectangle().frame(height: 50).opacity(0)
                        buttonView(text: "DETAIL", destination: AnyView(DetailView(question: $question)))
                        Rectangle().frame(height: 10).opacity(0)
                        HStack{
                            NavigationLink(destination: StageLevelView(), label: {
                                Text("NEXT").font(.custom("SPACE-Regular", size: 27))
                                    .frame(maxWidth: 250, minHeight: 62)
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
                                    .onTapGesture(perform: {
                                        context.insert(Questions(questions: question.questions, correctAnswer: question.correctAnswer, answer: question.answer, score: question.score, status: question.status, indexButton: question.indexButton, stage: whatStage))
                                        isChange.toggle()
                                    })
                            })
                            NavigationLink("", destination: StageLevelView(), isActive: $isChange)
                                
                            
                        }.padding(.horizontal, 20)
                        //                            Text("\(question.score)").font(.custom("SPACE-Regular", size: 100)).foregroundStyle(.white).padding(.trailing, 30)
                        //                            Text("/").font(.custom("SPACE-Regular", size: 100)).foregroundStyle(.white).padding(.trailing, 30)
                        //                            Text("\(question.correctAnswer.count)").font(.custom("SPACE-Regular", size: 100)).foregroundStyle(.white)
                        
                    }.onAppear(perform:{
                        totalScore = (Double(question.score) / Double(question.correctAnswer.count)) * 100
                        
                        print("score: \(question.score)")
                    })
                    
                }
            }.navigationBarBackButtonHidden()
        }
    }
}

//#Preview {
//    ScoreView()
//}

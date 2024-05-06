//
//  LevelView.swift
//  Astro
//
//  Created by Rio Jonathan on 29/04/24.
//

import Foundation
import SwiftUI


struct DetailView: View{
    
    
    @Binding var question: Questions
    
    
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
                            backButtonView()
                            
                            Text("STAGE 1-1").font(.custom("SPACE-Regular", size: 30)).foregroundStyle(.white)
                                .padding(.leading, 20)
                            Spacer()
                        })
                        Text("DETAIL").font(.custom("SPACE-Regular", size: 20)).foregroundStyle(.white)
                    }.padding(.top, 45)
                    Spacer()
                    VStack{
                        Text(question.questions).font(.system(size: 23, weight: .regular, design: .rounded)).foregroundStyle(Color.white)
                            .frame(width: 350)
                            .padding(.all, 10)
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Material.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            }
                            .padding(.top, 20)
                        
                        
                    }
                    Rectangle().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).opacity(0)
                    VStack{
                        HStack(spacing: 40){
                            ForEach(0..<question.answer.count){
                                i in
                                if(question.answer[i] == question.correctAnswer[i]){
                                    Text("\(question.answer[i])").font(.custom("SPACE-Regular",size: 16)).foregroundStyle(.green).padding(20).background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Material.ultraThinMaterial)
                                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                                    }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).cornerRadius(8)
                                } else{
                                    Text("\(question.answer[i])").font(.custom("SPACE-Regular",size: 16)).foregroundStyle(.red).padding(20).background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Material.ultraThinMaterial)
                                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                                    }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).cornerRadius(8)
                                }
                                
                            }
                            
                            
                        }
                        HStack(spacing: 110){
                            ForEach(0..<question.answer.count){
                                i in
                                Text("\(question.correctAnswer[i])").font(.custom("SPACE-Regular",size: 14)).foregroundStyle(.green)
                                
                            }
                            
                            
                        }
                    }
                    Spacer(minLength: 225)
                    
                    
                    
                    
                }.navigationBarBackButtonHidden()
                
            }
        }
    }
}





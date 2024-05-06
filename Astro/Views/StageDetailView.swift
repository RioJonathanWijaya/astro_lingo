//
//  File.swift
//  Astro
//
//  Created by Rio Jonathan on 29/04/24.
//

import Foundation
import SwiftUI
import SwiftData

struct StageDetailView: View{
    @Query() var currentScore: [Questions]
    @State var currentLevel: Int
    @State var whatStage: Int
    //    @Binding private var question: Questions
    
    @State var filteredData: [Questions] = []
    var body: some View{
        NavigationStack{
            ZStack(alignment: .center){
                Image("stage_detail")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack(){
                    VStack{
                        HStack(content: {
                            backButtonView()
                            
                            Text("STAGE").font(.custom("SPACE-Regular", size: 40)).foregroundStyle(.white)
                                .padding(.leading, 20)
                            Spacer()
                        })
                    }.padding(.top, 45)
                    Rectangle().frame(height: 60).opacity(0)
                    VStack(){
                        if(filteredData.count == 0){
                            ForEach(0...4, id: \.self){
                                i in
                                buttonLevelView(text: "Stage \(currentLevel)-\(i+1)", destination: AnyView(LevelView(whatStage: $whatStage, index: i)))
                            }
                            
                        }else{
                            ForEach(0...filteredData.count-1, id:\.self){
                                i in
                                if(filteredData[i].indexButton != 5){
                                    buttonLevelStarView(text: "Stage \(currentLevel)-\(i+1)", destination: AnyView(LevelView(whatStage: $whatStage, index: i)), score: filteredData[i].score)
                                } else {
                                    buttonLevelView(text: "Stage \(currentLevel)-\(i+1)", destination: AnyView(LevelView(whatStage: $whatStage, index: i)))
                                }
                            
                            }
                            ForEach(filteredData.count..<5, id:\.self){
                                i in
                                buttonLevelView(text: "Stage \(currentLevel)-\(i+1)", destination: AnyView(LevelView(whatStage: $whatStage, index: i)))
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            //                        buttonLevelView(text: "Stage 1-2", destination: AnyView(LevelView(index: 1))).padding(.bottom, 20)
                            //                        buttonLevelView(text: "Stage 1-3", destination: AnyView(LevelView(index: 2))).padding(.bottom, 20)
                            //                        buttonLevelView(text: "Stage 1-4", destination: AnyView(StageLevelView())).padding(.bottom, 20)
                            //                        buttonLevelView(text: "Stage 1-5", destination: AnyView(StageLevelView())).padding(.bottom, 20)
                        }
                        VStack{
                            if(filteredData.count == 5){
                               buttonView(text: "MASTERY", destination: AnyView(MasteryView(filteredData: $filteredData))).padding(.top, 20)
                            } else {
                                ZStack{
                                    buttonMasteryDisabledView(text: "MASTERY", destination: AnyView(MasteryView(filteredData: $filteredData))).padding(.top, 20)
                                    Image(systemName: "lock.fill").resizable().frame(width: 30, height: 40).padding(.top, 30)
                                }
                            }
                            
                        }
                        Spacer()
                    }
                }
            }.navigationBarBackButtonHidden()
                .onAppear(){
                    filteredData = self.currentScore.filter { data in
                        data.stage == whatStage
                    }
                }
        }
    }
    
    //#Preview {
    //    StageDetailView(question: $question)
    //}
}

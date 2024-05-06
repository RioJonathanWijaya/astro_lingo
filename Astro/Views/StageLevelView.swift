//
//  StageLevelView.swift
//  Astro
//
//  Created by Rio Jonathan on 26/04/24.
//

import Foundation
import SwiftUI



struct StageLevelView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    Image("stage_level")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.vertical)
                    VStack{
                        VStack{
                            HStack(content: {
                                backButtonView()
                                
                                Text("STAGE").font(.custom("SPACE-Regular", size: 40)).foregroundStyle(.white)
                                    .padding(.leading, 20)
                                Spacer()
                            })
                        }.padding(.top, 45)
                        Spacer()
                        VStack{
                            ButtonLevelView(text: "1", positionX: -5, positionY: -60, destination: AnyView(StageDetailView(currentLevel: 1, whatStage: 0)))
                            ButtonLevelView(text: "2", positionX: 110, positionY: -345, destination: AnyView(StageDetailView(currentLevel: 2, whatStage: 1)))
                            ButtonLevelView(text: "3", positionX: -75, positionY: -670, destination: AnyView(StageDetailView(currentLevel: 3, whatStage: 2)))
                        }
                    }
                    
                }
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    StageLevelView()
}

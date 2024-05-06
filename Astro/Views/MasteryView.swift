//
//  MasteryView.swift
//  Astro
//
//  Created by Rio Jonathan on 05/05/24.
//

import SwiftUI

struct MasteryView: View {
    
    @Binding var filteredData: [Questions]
    @State var totalScore = 0
    @State var totalScoreMastery = 0.0
    @State var masteryLevel = "Failed"
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("score_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    HStack{
                        backButtonView()
                        Rectangle().frame(width: 10).opacity(0)
                        Text("MASTERY").font(.custom("SPACE-Regular", size: 35))
                    }
                    Rectangle().frame(height: 150).opacity(0)
                    VStack{
                        Text("\(totalScoreMastery, specifier: "%.0f")%").font(.custom("SPACE-Regular", size: 45))
                        
                        Text("Your Level").font(.custom("SPACE-Regular", size: 16))
                        Text("\(masteryLevel)").font(.custom("SPACE-Regular", size: 55)).foregroundStyle(getColor())
                    }
                    Rectangle().frame(height: 225).opacity(0)
                }
                
                
            }
        }.navigationBarBackButtonHidden()
            .onAppear(){
                for i in 0..<filteredData.count{
                    totalScore += filteredData[i].score
                }
                print(totalScore)
                totalScoreMastery = (Double(totalScore) / Double(filteredData.count * 2)) * 100
                
                if(totalScoreMastery <= 25){
                    masteryLevel = "Failed"
                } else if(totalScoreMastery > 25 && totalScoreMastery <= 45){
                    masteryLevel = "Poor"
                } else if(totalScoreMastery > 45 && totalScoreMastery <= 65){
                    masteryLevel = "Enough"
                } else if(totalScoreMastery > 65 && totalScoreMastery <= 85){
                    masteryLevel = "Good"
                } else if(totalScoreMastery > 85 && totalScoreMastery <= 100){
                    masteryLevel = "Excellent"
                }
                
            }
    }
    
    func getColor() -> Color {
        switch masteryLevel{
        case "Failed":
            return .red
        case "Poor":
            return .orange
        case "Enough":
            return .yellow
        case "Good":
            return .blue
        case "Excellent":
            return .green
        default:
            return .red
        }
    }
}

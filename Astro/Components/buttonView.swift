//
//  buttonView.swift
//  Astro
//
//  Created by Rio Jonathan on 29/04/24.
//

import Foundation
import SwiftUI

struct ButtonLevelView: View{
    var text: String;
    var positionX: CGFloat;
    var positionY: CGFloat;
    var destination: AnyView;
    
    @State var scale = 1.0
    
    var body: some View{
        NavigationLink(destination: destination, label: {
            Text(text).font(.custom("SPACE-Regular", size: 20))
                .frame(width: 60, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(
                            .shadow(.inner(color: Color(red: 158/255, green: 240/255, blue: 252/255),radius: 3, x:0, y: 3))
                            .shadow(.inner(color: Color(red: 25/255, green: 160/255, blue: 179/255),radius: 5, x:0, y: -6))
                            
                        )
                        .foregroundColor(Color(red: 30/255, green: 206/255, blue: 231/255)))
                .foregroundStyle(.white)
                .cornerRadius(10)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 10))
                .onTapGesture {
                    
//                    withAnimation(.spring(duration: 2)){
//                        scale = 1.5
//                    }completion: {
//                        scale = 1.0
//                    }
                }
                
        }).offset(x:positionX, y:positionY)
    }
}

struct buttonAnswerView: View{
    var text: String;
    var body: some View{
            Text(text).font(.custom("SPACE-Regular", size: 18))
                .frame(maxWidth: 200, minHeight: 60)
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
        }
    }

struct buttonView: View{
    var text: String;
    var destination: AnyView;
    var body: some View{
        NavigationLink(destination: destination, label: {
            Text(text).font(.custom("SPACE-Regular", size: 27))
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
        })
            
    }
}

struct buttonMasteryDisabledView: View{
    var text: String;
    var destination: AnyView;
    var body: some View{
            Text(text).font(.custom("SPACE-Regular", size: 27))
                .frame(maxWidth: 250, minHeight: 62)
                .background((Color(red: 30/255, green: 206/255, blue: 231/255)))
                .foregroundStyle(.white).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .background(Color(red: 117/255, green: 117/225, blue: 117/225)).opacity(0.4)
                .cornerRadius(35)
                .padding(5)

    }
}

struct buttonLevelView: View{
    var text: String;
    var destination: AnyView;
    var body: some View{
        NavigationLink(destination: destination, label: {
            Text(text).font(.custom("SPACE-Regular", size: 27))
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
        })
            
    }
}

struct buttonLevelStarView: View{
    var text: String;
    var destination: AnyView;
    var score: Int;
    var body: some View{
        NavigationLink(destination: destination, label: {
            HStack{
                Text(text).font(.custom("SPACE-Regular", size: 20)).padding(.trailing, 20)
                    if(score == 1){
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                        Image(systemName: "star.leadinghalf.filled").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                        Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                    } else if (score == 2){
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                    } else if (score == 0){
                        Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                        Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                        Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundStyle(.purple)
                }
            }.frame(maxWidth: 300, minHeight: 62)
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
        })
            
    }
}


struct backButtonView: View{
    @Environment(\.presentationMode) private var
presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label:{
            Image(systemName: "arrowshape.backward.fill")
            .frame(width: 50, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 65, style: .continuous)
                    .fill(
                        .shadow(.inner(color: Color(red: 158/255, green: 240/255, blue: 252/255),radius: 3, x:0, y: 3))
                        .shadow(.inner(color: Color(red: 25/255, green: 160/255, blue: 179/255),radius: 5, x:0, y: -6))
                        
                    )
                    .foregroundColor(Color(red: 30/255, green: 206/255, blue: 231/255)))
            .foregroundStyle(.white)
            .cornerRadius(10)
            .background(RoundedRectangle(cornerRadius: 65).stroke(Color.white, lineWidth: 10))
                .padding(.leading, 20)
        })
    }
}



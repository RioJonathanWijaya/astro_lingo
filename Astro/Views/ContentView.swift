//
//  ContentView.swift
//  Astro
//
//  Created by Rio Jonathan on 26/04/24.
//

import SwiftUI
import AVFAudio

var player: AVAudioPlayer!

struct ContentView: View {
    
    @State private var offset: CGSize = CGSize(width: 0, height: 460)
    @State private var opacity = 1.0
    @State private var isChange = false
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Image("rocket")
                    .resizable()
                    .frame(width: 400, height: 600)
                    .offset(offset)
                
                VStack {
                    VStack(){
                        Text("Astro").font(.custom("SPACE-Regular", size: 55)).foregroundStyle(.orange).opacity(opacity)
                        Text("Lingo").font(.custom("SPACE-Regular", size: 50)).foregroundStyle(.orange).opacity(opacity)
                        
                    }.padding(.top, 90)
                    Spacer()
                    VStack{
                            Text("START").font(.custom("SPACE-Regular", size: 27))
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
                                .onTapGesture {
                                    let soundName = "beep"
                                    guard let soundFile = NSDataAsset(name: soundName) else {
                                        print("error")
                                        return
                                    }
                                    do{
                                        audioPlayer = try AVAudioPlayer(data: soundFile.data)
                                        audioPlayer.play()
                                    }catch{
                                        print("error2")
                                    }
                                    
                                    withAnimation(.easeIn(duration:1.5)){
                                        offset = CGSize(width: 0, height: -700)
                                        opacity = 0.0
//                                        self.playSound()
                                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                    }completion: {
                                        isChange = true
                                        offset = CGSize(width: 0, height: 460)
                                        opacity = 1
                                    }
                                }
                                .opacity(opacity)
                                
                        NavigationLink("", destination: StageLevelView(), isActive: $isChange)
                        
                    }.padding(.bottom, 80)
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
        }.navigationBarBackButtonHidden()
            
        
        
        
        
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "beep", withExtension: "mp3")
        
        player = try!AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}

#Preview {
    ContentView()
}

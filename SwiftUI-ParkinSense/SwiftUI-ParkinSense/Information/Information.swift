//
//  Information.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct Information: View {
    var body: some View {
        NavigationStack{
            ZStack{
                MenuBar()
                ZStack{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Text("Important Information")
                            .bold()
                            .font(.custom("Sinhala Sangam MN Bold", size: 55))
            
                        Text("Common Symptoms of Parkinson’s disease")
                            .font(.custom("Sinhala Sangam MN", size: 45))
                            .offset(x:-134)
                        
                        HStack{
                            Text("Tremors\nRigidity\nBradykinesia\nVocal Symptoms\nPostural Instability\nWalking or Gait Difficulties\nCognitive Changes\nDepression and Anxiety\nDisturbances in the Sense of Smell\nEye and Vision Issues\nFatigue")
                                .font(.custom("Avenir Next", size: 35))
                                .frame(width: 600, height: 635)
                            Text("Gastrointestinal Issues\nLightheadedness\nMelanoma\nPain\nPersonality Changes\nPsychosis\nSexual Concerns\nSleep Problems\nSweating\nUrinary Issues\nWeight Loss")
                                .font(.custom("Avenir Next", size: 35))
                                .frame(width: 600, height: 635)
                                
                        } .frame(width: 600, height: 535)
                    }).position(x:629, y:478)
                }
                 
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Information()
}

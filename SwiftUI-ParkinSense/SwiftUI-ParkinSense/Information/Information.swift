//
//  Information.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct Information: View {
    var body: some View {
        NavigationView{
            ZStack{
                MenuBar()
                ZStack{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Text("Important Informations")
                            .bold()
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                            .padding()
                        Text("Common Symptoms of Parkinson’s disease")
                            .font(.custom("Sinhala Sangam MN", size: 25))
                            
                        
                        HStack{
                            Text("Tremors\nRigidity\nBradykinesia\nVocal Symptoms\nPostural Instability\nWalking or Gait Difficulties\nCognitive Changes\nDepression and Anxiety\nDisturbances in the Sense of Smell\nEye and Vision Issues\nFatigue")
                                .font(.custom("Avenir Next", size: 25))
                                .frame(width: 600, height: 635)
                            Text("Gastrointestinal Issues\nLightheadedness\nMelanoma\nPain\nPersonality Changes\nPsychosis\nSexual Concerns\nSleep Problems\nSweating\nUrinary Issues\nWeight Loss")
                                .font(.custom("Avenir Next", size: 25))
                                .frame(width: 600, height: 635)
                                
                        }
                    }).position(x:729, y:478)
                }
                
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Information()
}

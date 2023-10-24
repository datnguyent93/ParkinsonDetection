//
//  Result.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI

struct Result: View {
    @State var percent: Double = 0
    var body: some View {
        NavigationStack{
            VStack{
                MenuBar()
                ZStack{
                    VStack{
                        RInstruction()
                        Spacer()
                        VStack{
                            Text("Your Score: \(Int(percent))")
                                .font(.system(size: 40, weight: .bold))
                            if (percent <= 50){
                                ResultBar(width: 800, height: 60, percent: percent, color1:.blue.opacity(0.5) ,color2: .blue)
                            }
                            else{
                                ResultBar(width: 800, height: 60, percent: percent, color1:.orange ,color2: .pink)
                            }
                        }.animation(.spring())
                        Button(action: {percent = CGFloat.random(in: 0...100)}, label: {
                            Text("\nRandom Number")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                //.position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                        })
                        if(percent <= 50 && percent > 0){
                            Text("According to the result, we did not detect monotone speech, dysarthria, or inconsistencies in hand-drawing patterns.We recommand the user visit and get a consultation with their primary physician.")
                                .frame(width: 1050, height: 250)
                                .font(.custom("Gurmukhi MN", size: 40))
                                .foregroundColor(.blue)
                        }
                        else if(percent >= 50){
                            Text("According to the result, we were able to detect monotone speech, dysarthria, and inconsistencies in hand-drawing patterns. We recommend the user visit and get a consultation with their primary physician or neurologist.")
                              //  .position(x:434)
                                .frame(width: 1050, height: 250)
                                .font(.custom("Gurmukhi MN", size: 40))
                                .foregroundColor(.red)
                        }
                        
                        NavigationLink{
                            MainPage()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Finish")
                        }.foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(width: 300, height: 50)
                            .background(Color("BarColor").opacity(0.85))
                            .cornerRadius(40)
                            .position(x: 1243, y:10)
                        
                    }.position(x:600,y:10)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RInstruction: View {
    var body: some View {
        VStack{
            Text("Result")
                .bold()
                .font(.custom("Avenir Next", size: 50))
               
            Text("Result Scale")
                .font(.custom("Sinhala Sangam MN Bold", size: 45))
                .position(x: 280)
                .padding()
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 95,height: 100)
                        .foregroundColor(.blue.opacity(0.75))
                    HStack{
                        Image(systemName: "lessthan")
                            .foregroundColor(.white)
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                        Text("50")
                            .foregroundColor(.white)
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                    }
                }
                Text(" Indicates that the User is not experiencing symptoms. ")
                    .font(.custom("Gurmukhi MN", size: 40))
                    .frame(width: 1000, height: 100)
            }
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 95,height: 100)
                        .foregroundColor(.red.opacity(0.95))
                    HStack{
                        Image(systemName: "greaterthan")
                            .foregroundColor(.white)
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                        Text("50")
                            .foregroundColor(.white)
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                    }
                }
                Text(" Indicates that the User might need consultation with a neurologist. ")
                    .font(.custom("Gurmukhi MN", size: 40))
                    .frame(width: 1000, height: 100)
                
            }
           
        }
       
        

    }
        
    
    
}

#Preview {
    Result()
}


//
//  Result.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI

struct Result: View {
    @State var percent: Double = 0
    @State private var calculated = false
    let screen = UIScreen.main.bounds
    var body: some View {
        NavigationStack{
            VStack{
                MenuBar()
                ZStack{
                    VStack{
                        
                        /*VStack{
                            Text("Your Score: \(Int(percent))")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                            if (percent <= 50){
                                ResultBar(width: screen.width * 0.8, height: 60, percent: percent, color1:.blue.opacity(0.5) ,color2: .blue)
                            }
                            else{
                                ResultBar(width: screen.width * 0.8, height: 60, percent: percent, color1:.orange ,color2: .pink)
                            }
                        }
                        .animation(.spring, value: percent)*/
                        
//                        Button(action: {percent = 56}, label: {
//                            Text("\nPositive")
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                //.position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
//                        })
//                        Button(action: {percent = 2}, label: {
//                            Text("\nNegative")
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                //.position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
//                        })
                        let percent = 56;
                        if(percent <= 50 && percent > 0){
                            Group{
                                Text("Result: ")
                                    .font(.custom("Avenir Next", size: 60))
                                    .foregroundColor(.white).bold()
                                +
                                Text("Negative")
                                    .foregroundColor(Color("pGreen"))
                                    .font(.custom("Avenir Next", size: 60, relativeTo: .body)).bold()
                            }
                            
                            Text("According to the result, we did not detect monotone speech, dysarthria, or inconsistencies in hand-drawing patterns. If you have any further concerns, we recommend that you visit and get a consultation with their primary physician.")
                                .frame(width: screen.width * 0.8, height: 250)
                                .font(.custom("Gurmukhi MN", size: 40, relativeTo: .body))
                                .foregroundColor(.white)
                        }
                        else if(percent >= 50){
                            Group{
                                Text("Result: ")
                                    .font(.custom("Avenir Next", size: 60))
                                    .foregroundColor(.white).bold()
                                +
                                Text("Positive")
                                    .foregroundColor(Color("pOrange"))
                                    .font(.custom("Avenir Next", size: 60, relativeTo: .body)).bold()
                            }
                            
                            Text("According to the result, we were able to detect monotone speech, dysarthria, and inconsistencies in hand-drawing patterns. We recommend that you visit and get a consultation with their primary physician or neurologist.")
                              //  .position(x:434)
                                .frame(width: screen.width * 0.8, height: 250)
                                .font(.custom("Gurmukhi MN", size: 40))
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink{
                            MainPage()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Finish")
                        }.foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .frame(width: screen.width * 0.3, height: 50)
                            .background(Color("pGreen").opacity(0.85))
                            .cornerRadius(40)
                            .position(x: screen.width * 0.75, y:80)
                        
                    }
                    //.position(x:600,y:10)
                    .offset(y:-180)
                }
            } .background(Color.black)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

#Preview {
    Result()
}


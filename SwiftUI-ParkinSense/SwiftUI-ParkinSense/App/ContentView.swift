//
//  ContentView.swift
//  SwiftUI-ParkinSense
//
//  Created by user242759 on 04/07/1402 AP.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    /*Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .mask{
                            Rectangle().frame(width:500, height:500, alignment:.top).offset(y:-100)
                        }*/
                    
                    Group{
                        Text("Parkin").font(.custom("Constantia",size:150)).foregroundColor(Color("pOrange"))
                            .bold()
                        +
                        Text("Sense").font(.custom("Constantia",size:150)).foregroundColor(Color("pGreen"))
                            .bold()
                    }
                    //.offset(y:-500)
                    NavigationLink{
                        //ProfilePage()
                        Login()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Tap to Continue")
                    }.foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color("pGreen"))
                        .cornerRadius(40)
                        //.offset(y:-400)
                    
                }
            }
            
        }
    }
}


#Preview {
    ContentView()
}



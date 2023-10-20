//
//  ContentView.swift
//  SwiftUI-ParkinSense
//
//  Created by user242759 on 04/07/1402 AP.
//
import SwiftUI
import Python

guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else { return }
guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else { return }
setenv("PYTHONHOME", stdLibPath, 1)
setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
Py_Initialize()
// we now have a Python interpreter ready to be used
import Python

guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else { return }
guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else { return }
setenv("PYTHONHOME", stdLibPath, 1)
setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
Py_Initialize()
// we now have a Python interpreter ready to be used
struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    Image("Logo")
                        .resizable()
                    
                    NavigationLink{
                        //ProfilePage()
                        Login()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Tap toContinue")
                    }.foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(40)
                    
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}



#Preview {
    ContentView()
}



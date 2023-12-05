//
//  ContentView.swift
//  SwiftUI-ParkinSense
//
//  Created by user242759 on 04/07/1402 AP.
//
import SwiftUI
import Python
import PythonKit

func myPython() -> Void {
    guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else { return }
    guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else { return }
    setenv("PYTHONHOME", stdLibPath, 1)
    setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
    Py_Initialize()
    // we now have a Python interpreter ready to be used
    let sys = Python.import("sys")
    print("Python Version: \(sys.version_info.major).\(sys.version_info.minor)")
    print("Python Encoding: \(sys.getdefaultencoding().upper())")
    print("Python Path: \(sys.path)")

    _ = Python.import("math") // verifies `lib-dynload` is found and signed successfully
}

struct ContentView: View {
    init() {
        myPython()
    }
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
                        MainPage()
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



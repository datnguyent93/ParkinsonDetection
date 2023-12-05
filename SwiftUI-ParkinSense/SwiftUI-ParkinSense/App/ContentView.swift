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
    let os = Python.import("os")
    if let projectDir = ProcessInfo.processInfo.environment["PROJECT_DIR"] {
       FileManager.default.changeCurrentDirectoryPath(projectDir)
    }

    let currentDirectoryPath = FileManager.default.currentDirectoryPath
    print("Python Version: \(sys.version_info.major).\(sys.version_info.minor)")
    print("Python Encoding: \(sys.getdefaultencoding().upper())")
    print("Path: \(os.getcwd())")
    
    let speechDirPath = os.path.join(currentDirectoryPath, "_Speech")
    let audioDirPath = os.path.join(currentDirectoryPath, "_Audio")
    
    print("Speech path: \(speechDirPath)")
    print("Audio path: \(audioDirPath)")
    
    //let random_array = np.random.rand(3, 3)
    //print("\(random_array)")
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



//
//  ContentView.swift
//  AppIconChange
//
//  Created by 亚飞 on 2022/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented = false
    @State var description = ""
    
    var body: some View {
        
        VStack {
            
            Text("default")
                .padding()
                .onTapGesture {
                
                    UIApplication.shared.setAlternateIconName("AppIcon") { error in
                        
                        NSLog(error?.localizedDescription ?? "123")
                    }
                        
                }
            
            Text("luffy Icon")
                .padding()
                .onTapGesture {
                    
                    UIApplication.shared.setAlternateIconName("luffy")
                  
                    }
            }
            
            Text("ace Icon")
                .padding()
                .onTapGesture {
                    
                    UIApplication.shared.setAlternateIconName("ace")
                }
            
            Text("onami")
                .padding()
                .onTapGesture {
                    
                    UIApplication.shared.setAlternateIconName("onami") { error in
              
                        description = error?.localizedDescription ?? "找不到对应Icon"
                        isPresented = true
                        
                    }
                
                }
                .alert(isPresented: $isPresented) {
                    
                    let  alert = Alert(title: Text("修改失败"), message: Text(description), dismissButton: .default(Text("确认")))
                    
                    return alert
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

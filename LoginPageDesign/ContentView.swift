//
//  ContentView.swift
//  LoginPageDesign
//
//  Created by ramil on 04.06.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var frontAnimate = false
    @State private var backgroundAnimate = false
    
    @State private var userName = ""
    @State private var password = ""
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("purple"), Color.white]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            .offset(y: self.backgroundAnimate ? 0 : -20)
            
            VStack {
                Image("front")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            .offset(y: self.frontAnimate ? -20 : 0)
            
            Group {
                VStack {
                    Spacer()
                    HStack {
                        Text("Login")
                            .foregroundColor(Color("darkPurple"))
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    Group {
                        TextField("Username", text: $userName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()
                    .shadow(color: Color("darkPurple"), radius: 10, x: 0, y: 5)
                    
                    Button(action: {
                        
                    }) {
                        Text("Forgot Password?")
                            .foregroundColor(Color("darkPurple"))
                    }.padding()
                    
                    Button(action: {
                        
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300)
                            .background(Color("darkPurple")
                                .cornerRadius(20)
                                .offset(y: 2))
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1))
                            .shadow(color: Color("darkPurple"), radius: 5, x: 0, y: 2)
                            .padding()
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Create Account")
                            .foregroundColor(Color("darkPurple"))
                    }.padding()
                }
            }.padding()
            
        }.onAppear() {
            withAnimation(self.foreverAnimation) {
                self.backgroundAnimate.toggle()
                self.frontAnimate.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

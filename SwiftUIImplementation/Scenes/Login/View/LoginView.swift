//
//  ContentView.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/8/23.
//

import SwiftUI

struct LoginView: View , ViewProtocol{
    var vm: LoginViewModel = LoginViewModel()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var moveDashboard: Bool = false
    @State private var showAlert: Bool = false
    
    
    
    var body: some View {
        GeometryReader { reader in
            let size = reader.size
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                Image("starsIcon")
                    .resizable()
                    .frame(width: size.width * 0.9, height: size.height * 0.5)
                    .scaledToFill()
                    .offset(y: -size.height * 0.2)
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .blur(radius: 5)
                            .opacity(0.4)
                        VStack(spacing: 20){
                            Text("Login")
                                .font(.system(size: min(size.width, size.height) * 0.1))
                            Spacer()
                            TextField("Enter your email", text: $emailText)
                                .textFieldStyle(.roundedBorder)
                                .textContentType(.emailAddress)
                                .padding(.horizontal, 40)
                            
                            
                            SecureField("Enter your password", text: $passwordText)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 40)
                            
                            Button(action: {
                                checkValidation()
                            }) {
                                Text("Login")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal, 80)
                            .navigationDestination(isPresented: $moveDashboard) {
                                DashboardView()
                                    .navigationBarBackButtonHidden()
                            }
                        }.padding(.horizontal, 20)
                            .frame(maxHeight: 40)
                        
                    }
                    .frame(width: size.width * 0.9, height: size.height * (verticalSizeClass == .compact ? 0.9 : 0.4))
                    .cornerRadius(15)
                    Spacer()
                    Spacer()
                    
                }
                
            }.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Oops!"), message: Text("Invalid Email / Password !"), dismissButton: .default(Text("OK")))
            })
        }
        
        
    }
    
    func checkValidation() {
        
        if emailText.isEmpty || passwordText.isEmpty {
            showAlert = true
            return
        }
        
        moveDashboard.toggle()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

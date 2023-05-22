//
//  ContentView.swift
//  MyAppOS
//
//  Created by DA MAC M1 124 on 2023/05/19.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var showSuccessPopup: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.black)
                            .padding(.bottom,50)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .background(isUsernameValid ? Color.white : Color.red.opacity(0.3))
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(isPasswordValid ? Color.white : Color.red.opacity(0.3))
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $showSuccessPopup) {
                  Alert(
                      title: Text("Success"),
                      message: Text("Sign up successful!"),
                      dismissButton: .default(Text("OK"))
                  )
              }
    }
    func isValidUsername(_ username: String) -> Bool {
        // Add your validation logic here
        // This is just a simple example that checks if the username has at least 5 characters
        return username.count >= 5
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // Add your validation logic for password
        // This is just a simple example that checks if the password has at least 8 characters
        return password.count >= 8
    }
    func signUp() {
        // Perform validation for username
             isUsernameValid = isValidUsername(username)
            isPasswordValid = isValidPassword(password)
        
             
             // Perform sign up logic if all validations pass
             if isUsernameValid {
                 print("Username: \(username)")
                 print("Password: \(password)")
                 print("Confirm Password: \(confirmPassword)")
             }    // Perform sign up logic if all validations pass
        if isUsernameValid && isPasswordValid {
            // Perform additional sign up actions
            
            // Show the success popup
            showSuccessPopup = true
        }
        
            
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


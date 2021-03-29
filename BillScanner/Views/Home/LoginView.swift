//
//  LoginView.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 18/02/21.
//

import SwiftUI

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View{
        VStack {
            Spacer()
            HStack {
                Text("Email:")
                    .font(.title)
                TextField("Email Address", text: $email)
                    
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 4)
            )
            
            Spacer().frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 10, maxWidth: 20, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 10, maxHeight: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("Password:")
                    .font(.title)
                TextField("Password", text: $password)
                    
            }
            .padding(10)
            .background(Color.blue.opacity(0.15))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 4)
                    
            )
            
            Button(action: {
                print("User logs in.")
                let _ = Backend.shared.signIn(email: email, password: password)
            }, label: {
                Text("Login")
                    .font(.title)
            })
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(email: .constant(""), password: .constant(""))
    }
}

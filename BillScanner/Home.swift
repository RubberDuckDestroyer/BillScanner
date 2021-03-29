//
//  Home.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 14/02/21.
//

import SwiftUI

struct Home: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack {
                    HStack{
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 40)
                    
                    VStack {
                        HStack(spacing: 15){
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("Color1"))
                            
                            TextField("Email Address", text: self.$email)
                        }
                        Divider().background(Color.white.opacity(0.5))
                    }
                }
                .padding()
                .background(Color("Color2"), alignment: .center)
                .padding(.horizontal, 20)
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all), alignment: .center)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

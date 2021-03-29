//
//  ContentView.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 14/02/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel
    
    @State var isUserLoggedIn:Bool = false
    
    var body: some View {
        ZStack {
            if (isUserLoggedIn) {
                
                HomeView()
                    .environmentObject(dataModel)
            } else {
                LoginView()
                    .environmentObject(dataModel)
            }
            
        }.onReceive(dataModel.$profile, perform: {newValue   in
            
            print(newValue.isLoggedIn)
            self.isUserLoggedIn = newValue.isLoggedIn
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
    }
}

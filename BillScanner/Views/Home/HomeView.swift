//
//  DocumentView.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 14/02/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack() {
            
            NavigationView {
                NavigationLink(destination: DocumentView()) {
                    Text("Scan Document")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

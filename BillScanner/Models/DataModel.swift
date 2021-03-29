//
//  DataModel.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 18/02/21.
//

import Foundation
import Combine

final class DataModel: ObservableObject {
    @Published var profile = Profile.default
    
}

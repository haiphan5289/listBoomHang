//
//  FirebaseDatabase.swift
//  ListBoomHang
//
//  Created by MacbookPro on 4/24/20.
//  Copyright © 2020 MacbookPro. All rights reserved.
//

import Foundation
import Firebase
import UIKit

enum FirebaseTable {
    case listUser
    
    var table: String {
        switch self {
        case .listUser:
            return "ListUser"
        }
    }
}

class FirebaseDatabase {
    static var instance = FirebaseDatabase()
    var ref: FIRDatabaseReference = FIRDatabase.database().reference()
    var storage = FIRStorage.storage().reference()
}

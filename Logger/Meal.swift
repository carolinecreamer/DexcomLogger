//
//  Meal.swift
//  Carbie
//
//  Created by Caroline Creamer on 5/21/20.
//  Copyright © 2020 Caroline Creamer. All rights reserved.
//

import Foundation

class Meal {
    let id: Int64?
    var name: String
    var carb: String
    var insulin: String
    
    init(id: Int64) {
        self.id = id
        name = ""
        carb = ""
        insulin = ""
    }
    
    init(id: Int64, name: String, carb: String, insulin: String) {
        self.id = id
        self.name = name
        self.carb = carb
        self.insulin = insulin
    }
}

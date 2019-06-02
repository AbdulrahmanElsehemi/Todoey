//
//  Category.swift
//  Todoey
//
//  Created by Abdelrahman on 5/30/19.
//  Copyright © 2019 Abdelrahman. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}

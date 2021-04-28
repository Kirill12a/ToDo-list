//
//  Item.swift
//  RealmToDoListInformaticsProject
//
//  Created by Kirill Drozdov on 28.04.2021.
//

import RealmSwift

class Item: Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
}

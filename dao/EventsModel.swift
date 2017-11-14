//
//  EventsModel.swift
//  Sports
//
//  Created by ios13 on 17/11/9.
//  Copyright © 2017年 ios20. All rights reserved.
//

import Foundation
class EventsModel {
     public var basicInfo: String?
     public var icon: String?
     public var id: Int32 = 0
     public var keyInfo: String?
     public var name: String?
     public var olympicInfo: String?
    init() {
        
    }
    init(_ id:Int32,_ basicInfo:String,_ icon:String,_ keyInfo:String,_ name:String,_ olympicInfo:String) {
        self.id = id
        self.name = name
        self.basicInfo = basicInfo
        self.icon = icon
        self.keyInfo = keyInfo
        self.olympicInfo = olympicInfo
    }
}

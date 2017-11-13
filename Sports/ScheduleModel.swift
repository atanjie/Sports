//
//  ScheduleModel.swift
//  Sports
//
//  Created by ios13 on 17/11/13.
//  Copyright © 2017年 ios20. All rights reserved.
//

import Foundation
class ScheduleModel {
    public var id: Int32 = 0
    public var gameDate: String?
    public var gameTime: String?
    public var eid: Int32 = 0
    public var info: String?
    public var startGameDate: String?

    public var endGameDate: String?

    public var startGameTime: String?

    public var endGameTime: String?

    init(){}
    init(_ id:Int32,_ eid:Int32,_ gameDate:String,_ gameTime:String,_ info:String) {
        self.id = id
        self.eid = eid
        self.info = info
        self.gameDate = gameDate
        self.gameTime = gameTime
        
    }
    init(id:Int32,eid:Int32,gameDate:String,gameTime:String,info:String,startGameDate: String,endGameDate: String,startGameTime: String,endGameTime: String) {
        self.id = id
        self.eid = eid
        self.info = info
        self.gameDate = gameDate
        self.gameTime = gameTime
        self.startGameDate = startGameDate
        self.endGameDate = endGameDate
        self.startGameTime = startGameTime
        self.endGameTime = endGameTime
    }
}

//
//  ViewController.swift
//  Sports
//
//  Created by ios20 on 17/11/9.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addClick(_ sender: Any) {
        let eve = EventsModel(10, "测试", "1", "测试冠军", "测试数据", "这是一条测试数据")
        let evt = EventsDao()
        let p = evt.addEvents(eve)
        print(p)
    }
    @IBAction func readClick(_ sender: Any) {
        let eve = EventsModel(10, "测试", "1", "测试冠军", "测试数据", "这是一条测试数据")
        let evt = EventsDao()
        let p = evt.getEvents(eve)
        for i in p {
            print(i.name!)
        }
    }
    @IBAction func addS(_ sender: Any) {
        let s = ScheduleModel(1, 1, "2017-11-11", "12:30", "ceshi")
        ScheduleDao().addSchedule(s)
    }
    @IBAction func readS(_ sender: Any) {
        let s = ScheduleModel(id: 1, eid: 1, gameDate: "2017-11-11", gameTime: "12:30", info: "ceshi",startGameDate: "2017-11-11",endGameDate: "",startGameTime: "",endGameTime: "")
        let a = ScheduleDao()
        let list = a.getSchedule(s)
        for i in list{
            print(i.info)
        }
        
    }

}


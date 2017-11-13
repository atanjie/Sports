//
//  SChe.swift
//  Sports
//
//  Created by ios13 on 17/11/13.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit
import CoreData
class ScheduleDao: UIViewController {
    private func getContext()->NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    /**
     *添加 根据Id
     **/
    func addSchedule(_ newSchedule:ScheduleModel)->Bool{
        do{
            let ctx = self.getContext()
            print(ctx)
            let eve = NSEntityDescription.insertNewObject(forEntityName: "Schedule", into: ctx)
            eve.setValue(newSchedule.id, forKey: "id")
            eve.setValue(newSchedule.eid, forKey: "eid")
            eve.setValue(newSchedule.info, forKey: "info")
            eve.setValue(newSchedule.gameTime, forKey: "gameTime")
            eve.setValue(newSchedule.gameDate, forKey: "gameDate")
            try ctx.save()
            return true
        }
        catch{
            return false
        }
    }
    /**
     *删除 根据Id
     **/
    func deleteSchedule(_ id:Int)->Bool{
        do{
            let ctx = self.getContext()
            let eve = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
            eve.predicate = NSPredicate(format: "id=\(id)", "")
            let result = try ctx.fetch(eve) as! [NSManagedObject]
            for event in result {
                ctx.delete(event)
            }
            try ctx.save()
            return true
        }
        catch{
            return false
        }
    }
    /**
     *修改 根据Id
     **/
    func updateSchedule(_ newSchedule:ScheduleModel,_ eventeId:Int)->Bool{
        do{
            let  ctx = self.getContext()
            let eve = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
            eve.predicate = NSPredicate(format: "id=\(eventeId)", "")
            let result = try ctx.fetch(eve) as! [NSManagedObject]
            for  eve in result{
                eve.setValue(newSchedule.id, forKey: "id")
                eve.setValue(newSchedule.eid, forKey: "eid")
                eve.setValue(newSchedule.info, forKey: "info")
                eve.setValue(newSchedule.gameTime, forKey: "gameTime")
                eve.setValue(newSchedule.gameDate, forKey: "gameDate")
            }
            try ctx.save()
            return true
        }
        catch{
            return false
        }
    }
    /**
     *id,eid不模糊查询，
     *gameDate，gameTime模糊查询
     **/
    func getSchedule(_ whereSchedule:ScheduleModel)->[ScheduleModel]{
        
        var list:[ScheduleModel] = Array<ScheduleModel>()
        do{
            let  ctx = self.getContext()
            let eve = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
            var whereStr=""
            whereStr = whereStr + ((NSString(format: "1 = 1","")) as String)
            if whereSchedule.id != 0 {
                whereStr = whereStr + " and id = \(whereSchedule.id) "
            }
            if whereSchedule.eid  != 0 {
                whereStr = whereStr + " and eid = \(whereSchedule.eid)"
            }
            if whereSchedule.startGameTime  != nil && whereSchedule.startGameTime  != ""{
                whereStr = whereStr + (NSString(format: "and gameTime >= '%@'", whereSchedule.startGameTime!) as String)
            }
            if whereSchedule.endGameTime  != nil && whereSchedule.endGameTime  != ""{
                whereStr = whereStr + (NSString(format: "and gameTime <= '%@'", whereSchedule.endGameTime!) as String)
            }
            if whereSchedule.startGameDate  != nil && whereSchedule.startGameDate  != ""{
                whereStr = whereStr + (NSString(format: "and gameDate >= '%@'", whereSchedule.startGameDate!) as String)
            }
            if whereSchedule.endGameDate  != nil && whereSchedule.endGameDate  != ""{
                whereStr = whereStr + (NSString(format: "and gameDate <= '%@'", whereSchedule.endGameDate!) as String)
            }
            eve.predicate = NSPredicate(format:whereStr, "")
            let result  = try ctx.fetch(eve) as![NSManagedObject]
            print(result.count)
            for p in result{
                let schedule: ScheduleModel = ScheduleModel()
                schedule.id = p.value(forKey: "id") as! Int32
                schedule.gameTime = p.value(forKey: "gameTime") as! String?
                schedule.gameDate = p.value(forKey: "gameDate") as! String?
                schedule.info = p.value(forKey: "info") as! String?
                schedule.eid = p.value(forKey: "eid") as! Int32
                list.insert(schedule, at: 0)
            }
        }
        catch{
        }
        return list
    }

}

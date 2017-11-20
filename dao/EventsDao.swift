//
//  EventesDao.swift
//  Sports
//
//  Created by ios13 on 17/11/10.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit
import  CoreData
class EventsDao: UIViewController {
    private  let context = NSManagedObjectContext.init(concurrencyType:NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
    private func getContext()->NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    /**
     *添加 根据Id
     **/
    func addEvents(_ newEvents:EventsModel)->Bool{
        do{
            let ctx = self.getContext()
            let eve = NSEntityDescription.insertNewObject(forEntityName: "Events", into: ctx)
            eve.setValue(newEvents.id, forKey: "id")
            eve.setValue(newEvents.name, forKey: "name")
            eve.setValue(newEvents.icon, forKey: "icon")
            eve.setValue(newEvents.basicInfo, forKey: "basicInfo")
            eve.setValue(newEvents.keyInfo, forKey: "keyInfo")
            eve.setValue(newEvents.olympicInfo, forKey: "olympicInfo")
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
    func deleteEventes(_ id:Int)->Bool{
        do{
            let ctx = self.getContext()
            let eve = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
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
    func updateEventes(_ newEvents:EventsModel,_ eventeId:Int)->Bool{
        do{
            let  ctx = self.getContext()
            let eve = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
            eve.predicate = NSPredicate(format: "id=\(eventeId)","")
            let result = try ctx.fetch(eve) as! [NSManagedObject]
            for  eve in result{
                eve.setValue(newEvents.id, forKey: "id")
                eve.setValue(newEvents.name, forKey: "name")
                eve.setValue(newEvents.icon, forKey: "icon")
                eve.setValue(newEvents.basicInfo, forKey: "basicInfo")
                eve.setValue(newEvents.keyInfo, forKey: "keyInfo")
                eve.setValue(newEvents.olympicInfo, forKey: "olympicInfo")
            }
            try ctx.save()
            
            return true
        }
        catch{
            return false
        }
    }
    /**
     *暂时只支出name 和 keyInfo 模糊查询 id不模糊查询
     **/
    func getEvents(_ whereEvente:EventsModel)->[EventsModel]{
        
        var eventsList:[EventsModel] = Array<EventsModel>()
        do{
            let  ctx = self.getContext()
            let eve = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
            var whereStr="1 = 1"
                whereStr = whereStr + (NSString(format: " and name like [cd]'*%@*'", whereEvente.name!) as String)
               whereStr = whereStr + (NSString(format: " and keyInfo like [cd]'*%@*'", whereEvente.keyInfo!) as String)
            if whereEvente.id != 0 {
             whereStr = whereStr + " and id = \(whereEvente.id)"
            }
            print(whereStr)
            eve.predicate = NSPredicate(format:whereStr, "")
            let result  = try ctx.fetch(eve) as![NSManagedObject]
            for p in result{
                let event: EventsModel = EventsModel()
                event.id = p.value(forKey: "id") as! Int32
                event.basicInfo = p.value(forKey: "basicInfo") as! String?
                event.icon = p.value(forKey: "icon") as! String?
                event.name = p.value(forKey: "name") as! String?
                event.keyInfo = p.value(forKey: "keyInfo") as! String?
                event.olympicInfo = p.value(forKey: "olympicInfo") as! String?
                eventsList.insert(event, at: 0)
            }
        }
        catch{
        }
        return eventsList
    }
}

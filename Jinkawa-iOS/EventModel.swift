//
//  DataManager.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/06/28.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import Foundation
import UIKit
import NCMB

class EventModel: NSObject{
    
    static let sharedManager = EventModel()
    private var eventList:[NCMBObject] = []
    
    
    private override init() {
      super.init()
    
    }
    
    func loadEventList(){
        let query = NCMBQuery(className: "Event")
        var result:[NCMBObject] = []
        do{
            try result = query?.findObjects() as! [NCMBObject]
        }catch let error as NSError{
            print(error)
            return
        }
        
        if result.count > 0 {
            self.eventList = result
            print("イベントリストが更新されました")
        }
    }
    
    func getEventList()->[NCMBObject]{
        return self.eventList
    }

}

struct Event{
    
    let eventName:String
    let updateAt:String
    let description:String
    
    init(eventName:String, updateAt:String, description:String){
        self.eventName = eventName
        self.updateAt = updateAt
        self.description = description
    }
    
    func add(){
        let eventObject = NCMBObject(className: "Event")
        eventObject?.setObject(self.eventName, forKey: "EventName")
        eventObject?.setObject(self.updateAt, forKey: "UpdateAt")
        eventObject?.setObject(self.description, forKey: "Description")
        
        eventObject?.saveInBackground({(error) in
            if error != nil{
                print("Save error: ", error!)
            }
        })
    }
    
}

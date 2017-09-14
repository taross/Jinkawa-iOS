//
//  Participant.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/09/14.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import Foundation
import NCMB

class Participant: NSObject{
    
    let name:String;
    let gender:String;
    let age: Int;
    let tell:String;
    let address:String;
    
    init(participant: NCMBObject) {
        name = participant.object(forKey: "name") as! String
        gender = participant.object(forKey: "sex") as! String
        age = participant.object(forKey: "age") as! Int
        tell = participant.object(forKey: "tell") as! String
        address = participant.object(forKey: "address") as! String
    }
    
    func save(){
        let participantObject = NCMBObject(className: "Participant")
        participantObject?.setObject(name, forKey: "name")
        participantObject?.setObject(gender, forKey: "sex")
        participantObject?.setObject(age, forKey: "age")
        participantObject?.setObject(tell, forKey: "tell")
        participantObject?.setObject(address, forKey: "address")
    }
}

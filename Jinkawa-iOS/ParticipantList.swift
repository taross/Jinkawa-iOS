//
//  ParticipantModel.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/09/14.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import Foundation
import UIKit
import NCMB

class ParticipantModel: NSObject{
    
    static let sharedManager = ParticipantModel()
    private var participantList:[Participant] = []
    
    
    private override init() {
        super.init()
        
    }
    
    func loadList(){
        let query = NCMBQuery(className: "Participant")
        var result:[NCMBObject] = []
        do{
            try result = query?.findObjects() as! [NCMBObject]
        }catch let error as NSError{
            print(error)
            return
        }
        
        if result.count > 0 {
            result.forEach{ obj in
                self.participantList.append(Participant(participant: obj))
            }
            print("参加者リストが更新されました")
        }
    }
    
    func getList()->[Participant]{
        return self.participantList
    }
}


//
//  InfomationModel.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/07/09.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import Foundation
import UIKit
import NCMB

class InfomationModel: NSObject{
    
    static let sharedManager = InfomationModel()
    private var infomationList:[NCMBObject] = []
    
    
    private override init() {
        super.init()
        
    }
    
    func loadList(){
        let query = NCMBQuery(className: "Information")
        var result:[NCMBObject] = []
        do{
            try result = query?.findObjects() as! [NCMBObject]
        }catch let error as NSError{
            print(error)
            return
        }
        
        if result.count > 0 {
            self.infomationList = result
            print("お知らせリストが更新されました")
        }
    }
    
    func getList()->[NCMBObject]{
        return self.infomationList
    }
}

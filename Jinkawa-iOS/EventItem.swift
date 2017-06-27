//
//  EventView.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/06/27.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import UIKit

class EventView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let eventItem = Bundle.main.loadNibNamed("EventItem", owner: self, options: nil)?.first as! UIView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

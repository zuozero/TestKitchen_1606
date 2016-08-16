//
//  CBRecommedModel.swift
//  TestKitchen
//
//  Created by 左佳林 on 16/8/16.
//  Copyright © 2016年 左佳林. All rights reserved.
//

import UIKit

class CBRecommendModel: NSObject {
    
    var code:NSNumber?
    var msg:Bool?
    var version:String?
    var timestamp:NSNumber?
    var data:NSDictionary?

}

class CBRecommenDataModel: NSObject {
    
    var banner:Array<CBRecommendBanner>?
    var widgetList:Array<CBRecommendWidgetListModel>?
    
}

class CBRecommendBanner: NSObject {
    
    var banner_id:NSNumber?
    var banner_title:String?
    var banner_picture:String?
    
    var banner_link:String?
    var is_link:NSNumber?
    var refer_key:NSNumber?
    var type_id:NSNumber?
    
}

class CBRecommendWidgetListModel: NSObject {
    
    var widget_id:NSNumber?
    var widget_type:NSNumber?
    var tiltle:String?
    var title_link:String?
    var desc:String?
    var widget_data:Array<CBRecommendWidgeDataModel>?
}

class CBRecommendWidgeDataModel: NSObject {
    
    var id:NSNumber?
    var type:String?
    var content:String?
    var link:String?
}











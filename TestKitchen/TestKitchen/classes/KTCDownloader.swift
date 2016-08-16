//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by 左佳林 on 16/8/16.
//  Copyright © 2016年 左佳林. All rights reserved.
//

import UIKit
import Alamofire

public enum KTCDownloadType:Int{
    
    case Default = 10
}


protocol KTCDownloaderDelegate:NSObjectProtocol {
    
    func dowloader(downloader:KTCDownloader,didFailWithError error:NSError)
    func downloader(downloader:KTCDownloader,didFinishWithData data:NSData?)
}

class KTCDownloader: NSObject {

    weak var delegate:KTCDownloaderDelegate?
    var type:KTCDownloadType = .Default
    
    func postWithUrl(urlString:String,params:Dictionary<String,String>?){
        
        Alamofire.request(.POST, urlString, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            
            switch response.result{
            case .Failure(let error):
                
                self.delegate?.dowloader(self, didFailWithError: error)
            case .Success:
                
                self.delegate?.downloader(self, didFinishWithData: response.data)
            }
        }
    }
       
}

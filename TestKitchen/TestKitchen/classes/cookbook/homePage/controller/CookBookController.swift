//
//  CookBookController.swift
//  TestKitchen
//
//  Created by 左佳林 on 16/8/15.
//  Copyright © 2016年 左佳林. All rights reserved.
//

import UIKit

class CookBookController: BaseViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadRecommendData()
        self.createMyNav()
    }

    func createMyNav(){
        
        addNavBtn("saoyisao.png", target: self, action: #selector(scanAction), isLeft: true)
        addNavBtn("search.png", target: self, action: #selector(searchAction), isLeft: false)
    }
    
    func downloadRecommendData(){
        
       let dict = ["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.postWithUrl(kHostUrl, params: dict)
        
    }
    
    func scanAction(){
        
    }
    
    func searchAction(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK:KTCDownloader
extension CookBookController:KTCDownloaderDelegate{
    func dowloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print(str)
    }
    
    
    
    
    
    
    }
    















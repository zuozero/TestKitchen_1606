//
//  BaseViewController.swift
//  TestKitchen
//
//  Created by 左佳林 on 16/8/15.
//  Copyright © 2016年 左佳林. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
    }

    func addNavTitle(title:String){
        
        let titleLabel = UILabel.createLabel(title, font: UIFont.boldSystemFontOfSize(24), textAlignment: .Center, textColor: UIColor.blackColor())
        navigationItem.titleView = titleLabel
    }
    
    func addNavBtn(imageNmae:String,target:AnyObject,action:Selector,isLeft:Bool){
        let btn = UIButton.createBtn(nil, bgImageName: imageNmae, selectBgImageName: nil, target: self, action: action)
        let barBtnItem = UIBarButtonItem(customView: btn)
        btn.frame = CGRectMake(0, 4, 30, 36)
        if isLeft{
            navigationItem.leftBarButtonItem = barBtnItem
            
        }else{
            navigationItem.rightBarButtonItem = barBtnItem
        }
        
    }
    
    func addNavBackBtn(){
        
        self.addNavBtn("nav_back_black", target: self, action: #selector(backAction), isLeft: true)
    }
    
    func backAction(){
        self.navigationController?.popViewControllerAnimated(true)
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

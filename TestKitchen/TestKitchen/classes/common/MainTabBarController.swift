//
//  MainTabBarController.swift
//  TestKitchen
//
//  Created by 左佳林 on 16/8/15.
//  Copyright © 2016年 左佳林. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var bgView:UIView?
    
    private var array:Array<Dictionary<String,String>>?{
        get{
            //读文件
            let path = NSBundle.mainBundle().pathForResource("Ctrl", ofType: "json")
            var myArray:Array<Dictionary<String,String>>? = nil
            if let filePath = path{
                let data = NSData(contentsOfFile: filePath)
                if let jsonData = data{
                    do {
                        let jsonVale = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
                        if jsonVale.isKindOfClass(NSArray.self){
                            myArray = jsonVale as? Array<Dictionary<String,String>>
                        }
                    }catch{
                        print(error)
                        return nil
                    }
                    
                }
                
            }
            return myArray!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Swift里面,一般在类内部调用属性和方法的时候,可以不写self,一般在闭包写
        createViewControllers()

    }

    func createViewControllers(){
        
        
        var ctrlNames = [String]()
        var imageNames = [String]()
        var titleNames = [String]()
        var selectImageNames = [String]()
        
        //let ctrlNames = ["CommunityViewController","CookBookController","FoodClassViewController","MallViewController","ProfileViewController"]
        
        if let tmpArray = self.array{
            for dict in tmpArray{
                let ctrlName = dict["ctrlName"]
                let titleName = dict["titleName"]
                let imageName = dict["imageName"]
                ctrlNames.append(ctrlName!)
                titleNames.append(titleName!)
                imageNames.append(imageName!)
            }

        }else{
        
           ctrlNames = ["CommunityViewController","CookBookController","FoodClassViewController","MallViewController","ProfileViewController"]
            //home_normal community_normal shop_normal shike_normal mine_normal
            
            titleNames = ["食材","社区","商城","食客","我的"]
            imageNames = ["home","community", "shop","shike","mine"]
            
            
        }
        var vCtrlArray = Array<UINavigationController>()
        for i in 0..<ctrlNames.count{
            
            let ctrlName = "TestKitchen."+ctrlNames[i]
            let cls = NSClassFromString(ctrlName) as! UIViewController.Type
            let ctrl = cls.init()
            let navCtrl = UINavigationController(rootViewController:ctrl)
            vCtrlArray.append(navCtrl)
        }
        self.viewControllers = vCtrlArray
        createCustomTabar(titleNames, imageNames: imageNames)
    }
    
    func createCustomTabar(titleNames:[String],imageNames:[String]){
        
        bgView = UIView.createView()
        bgView?.backgroundColor = UIColor.whiteColor()
        bgView?.layer.borderWidth = 1
        bgView?.layer.borderColor = UIColor.grayColor().CGColor
        view.addSubview(self.bgView!)
        bgView?.snp_makeConstraints(closure: { [weak self] (make) in
            make.left.right.equalTo(self!.view)
            make.top.equalTo((self?.view.snp_bottom)!).offset(-49)
            let width = kScreenWidth/5.0
            for i in 0..<imageNames.count{
                
                let imageName = imageNames[i]
                let titleName = titleNames[i]
                let bgImageName = imageName+"_normal"
                let selectBgImageName = imageName+"_select"
                let btn = UIButton.createBtn(nil, bgImageName: bgImageName, selectBgImageName: selectBgImageName, target: self, action: #selector(self!.clickBtn(_:)))
                
                self!.bgView?.addSubview(btn)
                btn.snp_makeConstraints(closure: { (make) in
    
                    make.top.bottom.equalTo((self?.bgView!)!)
                    make.width.equalTo(width)
                    make.left.equalTo(width*CGFloat(i))
                    
                })
                let label = UILabel.createLabel(titleName, font: UIFont.systemFontOfSize(8), textAlignment: .Center, textColor: UIColor.grayColor())
                btn.addSubview(label)
                label.snp_makeConstraints(closure: { (make) in
                    make.left.right.equalTo(btn)
                    make.top.equalTo(btn).offset(32)
                    make.height.equalTo(12)
                    
                })
                btn.tag = 300 + i
                label.tag = 400
                if i == 0{
                    btn.selected = true
                    label.textColor = UIColor.orangeColor()
                }
            }
        })
    }
    
    func clickBtn(curBtn:UIButton){
        
        let lastBtnView = self.view.viewWithTag(300+selectedIndex)
        if let tmpBtn = lastBtnView{
            let lastBtn = tmpBtn as! UIButton
            let lastView = tmpBtn.viewWithTag(400)
            if let tmpLabel = lastView{
                let lastLabel = tmpLabel as! UILabel
                lastBtn.selected = false
                lastLabel.textColor = UIColor.grayColor()
            }
            
        }
        
        let curLabelView = curBtn.viewWithTag(400)
        if let tmpLabel = curLabelView{
            let curLabel = tmpLabel as! UILabel
            curBtn.selected = true
            curLabel.textColor = UIColor.orangeColor()
        }
        selectedIndex = curBtn.tag - 300
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

//
//  ViewController.swift
//  FlowTag
//
//  Created by tanson on 16/6/22.
//  Copyright © 2016年 tanson. All rights reserved.
//

import UIKit

private let datas = ["帅气","完美大人","好给力","好厉害","编程高手","设计师","有品位","色彩玩家","颜值高","善于沟通","牛逼闪闪","哈哈","潜力股","富二代","跑车一族","牛叉","泡妞高手","萝莉控","爱喝啤酒吃烧烤","外星人","妹子","妞妞","瓦窑","丽丽","土豪","冲锋枪啊","哈哈","潜力股","富二代","跑车一族","牛叉","泡妞高手"]

class ViewController: UIViewController{

    @IBOutlet weak var flowTagView: FlowTagView!{
        didSet{
            flowTagView.setBlockForTagName { (index) -> String in
                return datas[index]
            }
            flowTagView.reloadData(datas.count)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//
//  ViewController.swift
//  test
//
//  Created by liqungang on 16/2/24.
//  Copyright © 2016年 liqungang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let labelStr:NSString = "The width is"
        let width:NSInteger = 94
        let widthLabelStr:NSString = String(labelStr) + String(width)
        print("widthLabel== ", widthLabelStr)
        
        
        let a:Float = 30.00
        let format = String(format:"%.2f",a)
        print("double:\(format)")
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


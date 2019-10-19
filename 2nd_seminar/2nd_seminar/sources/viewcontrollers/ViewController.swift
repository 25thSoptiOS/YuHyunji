//
//  ViewController.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/17.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //destination scene이 나타나기 전 미리 필요한 작업을 수행하기위해 준비해주는 단계
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let destination = segue.destination
        let button = sender as! UIButton
        destination.title = button.titleLabel?.text
        
    }


}


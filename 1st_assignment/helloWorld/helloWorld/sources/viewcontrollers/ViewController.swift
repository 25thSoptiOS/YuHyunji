//
//  ViewController.swift
//  helloWorld
//
//  Created by hjyoo on 28/09/2019.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel! //아울렛일땐 override fuc 위에
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayHello(_ sender: Any) {
        self.titleLabel.text = "SOPT!"
    } //액션일땐 override fuc 아래에
    
}


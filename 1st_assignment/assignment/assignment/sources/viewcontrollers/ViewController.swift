//
//  ViewController.swift
//  assignment
//
//  Created by hjyoo on 30/09/2019.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likeMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleLike(_ sender: Any) {
        likeBtn.isSelected = !likeBtn.isSelected
        self.likeMessage.text = "sopt.iOS.Lover 님이 좋아합니다"
    }
    
}


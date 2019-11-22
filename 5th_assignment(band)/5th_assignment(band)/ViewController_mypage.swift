//
//  ViewController_mypage.swift
//  5th_assignment(band)
//
//  Created by hjyoo on 2019/11/19.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController_mypage: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var myActivity: UIButton!
    @IBOutlet weak var mySetting: UIButton!
    
    @IBOutlet weak var MypageTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loginBtn 둥근테두리 설정
        myActivity.layer.cornerRadius = self.myActivity.frame.width / 8
        myActivity.layer.borderColor = CGColor(srgbRed: 100, green: 100, blue: 100, alpha: 1)
        //myActivity.backgroundColor = UIColor.red
        myActivity.layer.borderWidth = 1
        myActivity.layer.masksToBounds = true
        
        // loginBtn 둥근테두리 설정
        mySetting.layer.cornerRadius = self.mySetting.frame.width / 8
        mySetting.layer.borderColor = CGColor(srgbRed: 244, green: 245, blue: 247, alpha: 1)
        //mySetting.layer.backgroundColor = CGColor(srgbRed: 244, green: 245, blue: 247, alpha: 1)
        mySetting.layer.borderWidth = 1
        mySetting.layer.masksToBounds = true
        
        MypageTV.dataSource = self
        
    }
    
}


extension ViewController_mypage: UITableViewDataSource {
    
    //섹션 내에 속한 셀의 갯수(필수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //각 항복에 대한 셀 객체 공급(필수)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MypageCell1", for: indexPath)
        cell.textLabel?.text = "공지사항"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        cell.textLabel?.textColor = UIColor.black
 
        return cell
        }
        
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MypageCell2", for: indexPath)
            cell.textLabel?.text = "밴드북/사진인화"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
            cell.textLabel?.textColor = UIColor.black
        
            return cell
            }
 
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MypageCell3", for: indexPath)
            cell.textLabel?.text = "스티커 샵"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
            cell.textLabel?.textColor = UIColor.black
        
            return cell
            }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MypageCell4", for: indexPath)
            cell.textLabel?.text = "기프트 샵"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
            cell.textLabel?.textColor = UIColor.black
        
            return cell
            }
        
        return UITableViewCell()
    }
    
}



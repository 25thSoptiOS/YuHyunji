//
//  ViewController.swift
//  5th_assignment(band)
//
//  Created by hjyoo on 2019/11/18.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NewpostTV: UITableView!
    @IBOutlet weak var MybandCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 24))
        logoImg.contentMode = .scaleAspectFit
        let logo = UIImage(named: "bandIc")
        logoImg.image = logo
        navigationItem.titleView = logoImg
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.tabBarController?.tabBar.backgroundColor = .white
        self.tabBarController?.tabBar.isTranslucent = false
        
        setmyband()
        NewpostTV.dataSource = self
        MybandCV.delegate = self
        MybandCV.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    
    //섹션 내에 속한 셀의 갯수(필수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //각 항복에 대한 셀 객체 공급(필수)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewpostCell1", for: indexPath)
            cell.textLabel?.text = "내용"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.textLabel?.textColor = UIColor.darkGray
            cell.detailTextLabel?.text = "시간"
            //cell.detailTextLabel?.text = "\((myCurri?.englishLecture)!) / \((departmentCurri?.englishLecture)!)과목"
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 8)
            cell.detailTextLabel?.textColor = UIColor.lightGray
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewpostCell2", for: indexPath)
            cell.textLabel?.text = "내용"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.textLabel?.textColor = UIColor.darkGray
            cell.detailTextLabel?.text = "시간"
            //cell.detailTextLabel?.text = "\((myCurri?.englishLecture)!) / \((departmentCurri?.englishLecture)!)과목"
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 8)
            cell.detailTextLabel?.textColor = UIColor.lightGray
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewpostCell3", for: indexPath)
            cell.textLabel?.text = "내용"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.textLabel?.textColor = UIColor.darkGray
            cell.detailTextLabel?.text = "시간"
            //cell.detailTextLabel?.text = "\((myCurri?.englishLecture)!) / \((departmentCurri?.englishLecture)!)과목"
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 8)
            cell.detailTextLabel?.textColor = UIColor.lightGray
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewpostCell4", for: indexPath)
            cell.textLabel?.text = "내용"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.textLabel?.textColor = UIColor.darkGray
            cell.detailTextLabel?.text = "시간"
            //cell.detailTextLabel?.text = "\((myCurri?.englishLecture)!) / \((departmentCurri?.englishLecture)!)과목"
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 8)
            cell.detailTextLabel?.textColor = UIColor.lightGray
            return cell
        }
        
        return UITableViewCell()
    }
}


//'bannerCV.delegate = self'이 구문오류발생 했을 때
//UICollectionView_Delegate를 채택하는 코드
extension ViewController: UICollectionViewDelegate {
        
}

//UICollectionView_DataSource를 채택하는 코드
extension ViewController: UICollectionViewDataSource {
        
        //섹션 내에 속한 셀의 갯수(필수)
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //mybandList의 갯수만큼 return
            return appDelegate.mybandList.count
        }
        
        //각 항복에 대한 셀 객체 공급(필수)
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MybandCell", for: indexPath) as! MybandCell
            
            let myband = appDelegate.mybandList[indexPath.row]
            
            cell.MybandImg?.image = myband.mybandimg
            cell.MybandLabel = myband.mybandlabel
            cell.MybandLabel?.font = UIFont.systemFont(ofSize: 12)

            return cell
                    
        }
        
}
    
extension ViewController {
    
    func setmyband() {
        let myband1 = Myband(mybandName: "img1")
        let myband2 = Myband(mybandName: "img2")
        let myband3 = Myband(mybandName: "img3")
        let myband4 = Myband(mybandName: "img4")
        
        appDelegate.mybandList = [myband1, myband2, myband3, myband4]
    }

}
    
    
    
    
    
    
    
    
    
    



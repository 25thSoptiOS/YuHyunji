//
//  2ndViewController.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/26.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit
import CHIPageControl

class _ndViewController: UIViewController {
    

    @IBOutlet weak var decoration: UIView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var bannerCV: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlAleppo!
    @IBOutlet weak var workCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        decoration.layer.cornerRadius = self.decoration.frame.size.width / 2
        decoration.layer.borderColor = CGColor(srgbRed: 255, green: 209, blue: 270, alpha: 1)
    
        setBanner()
        setWork()
        bannerCV.delegate = self
        bannerCV.dataSource = self
        workCV.delegate = self
        workCV.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
}

//'bannerCV.delegate = self'이 구문오류발생 했을 때
//UICollectionViewDelegate를 채택하는 코드
extension _ndViewController: UICollectionViewDelegate{
    
    //@IBOutlet weak var paging: CHIPageControlAleppo!
    //paging을 연결하여 animate 작동시켜주기
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
    
}

//UICollectionViewDataSource를 채택하는 코드
extension _ndViewController: UICollectionViewDataSource {
    
    //섹션 내에 속한 셀의 갯수(필수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                if collectionView == self.workCV {
                    return appDelegate.workList.count
                }
        //bannerList의 갯수만큼 return
        return appDelegate.bannerList.count
    }
    
    //각 항복에 대한 셀 객체 공급(필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                if collectionView == self.workCV {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! WorkCell
        
                    let work = appDelegate.workList[indexPath.row]
        
                    //cell.workIdx = work.workIdx
                    cell.work?.image = work.workImg

            
                    return cell
                }
                else {
                    let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
                    
                    let banner = appDelegate.bannerList[indexPath.row]
                    bannerCell.banner?.image = banner.bannerImg
                    // bannerCell.banner = bannerList.
                    
                    //bannerCell에 image 넣기.
                    return bannerCell
                    }
    }
    
}

extension _ndViewController {
    
    func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage02")
        let banner3 = Banner(bannerName: "mainImage03")
        
        appDelegate.bannerList = [banner1, banner2, banner3]
    }
    
    func setWork() {
        let work1 = Work(workName: "mainImg01")
        let work2 = Work(workName: "mainImg02")
        let work3 = Work(workName: "mainImg03")
        let work4 = Work(workName: "mainImg04")
        let work5 = Work(workName: "mainImg05")
        let work6 = Work(workName: "mainImg06")
        let work7 = Work(workName: "mainImg07")
        let work8 = Work(workName: "mainImg08")
        let work9 = Work(workName: "mainImg09")
        let work10 = Work(workName: "mainImg10")
        let work11 = Work(workName: "mainImg11")
        let work12 = Work(workName: "mainImg12")
        let work13 = Work(workName: "mainImg13")
        let work14 = Work(workName: "mainImg14")
        let work15 = Work(workName: "mainImg15")
        let work16 = Work(workName: "mainImg16")
        let work17 = Work(workName: "mainImg17")
        let work18 = Work(workName: "mainImg18")
        let work19 = Work(workName: "mainImg19")
        let work20 = Work(workName: "mainImg20")
        let work21 = Work(workName: "mainImg21")

        appDelegate.workList = [work1, work2, work3, work4, work5, work6, work7, work8, work9, work10, work11, work12, work13, work14, work15, work16, work17, work18, work19, work20, work21]
    }

}




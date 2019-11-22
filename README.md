# 25th SOPT iOS
## 2nd_seminar  
### __* View 간의 데이터 전달 - Segue__

```swift
//destination scene이 나타나기 전 미리 필요한 작업을 수행하기위해 준비해주는 단계
override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    
    let destination = segue.destination
    let button = sender as! UIButton
    destination.title = button.titleLabel?.text
    //데이터가 전달되어 destination scene의 네비게이션 바 '타이틀' 설정

}
```

### __* View 간의 데이터 전달 - 직접 전달 방식__

<img width="200" alt="스크린샷 2019-10-18 오후 8 39 41" src="https://user-images.githubusercontent.com/22251299/67091851-b43b4280-f1e8-11e9-8d24-ed17356a077f.png">

####_viewcontroller_cause에 들어갈 코드
```swift
@IBAction func onSubmit(_ sender: Any) {
    
    //(withIdentifier: "Next viewcontroller의 storyboard ID")
    guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ViewController_result
        else {
            return
        }
    
    rvc.paramEmail = self.email.text!
    rvc.paramUpdate = self.isUpdate.isOn
    rvc.paramInterval = self.interval.value
    
    //코드로 뷰간의 present연결(이때,스토리보드에선 뷰간 연결해주면 안됨)
    self.present(rvc,animated: true)
    
}
```

####_viewcontroller_result에 들어갈 코드
```swift
   //이전 viewcontroller에서 넘겨준 데이터 어떤형식으로 받을지 선언
   var paramEmail: String = ""
   var paramUpdate: Bool = false
   var paramInterval: Double = 0
 
   //코드로 Back Action(이때,스토리보드에선 뷰간 연결해주면 안됨)
   @IBAction func onBack(_ sender: Any) {
       self.dismiss(animated: true)
 }
```

### __* 과제1: Stackview - Loginview그리기__
<div>
<img width="200" alt="스크린샷 2019-10-18 오후 8 06 36" src="https://user-images.githubusercontent.com/22251299/67090084-26f5ef00-f1e4-11e9-8d93-71bdd0a9b10a.png">

<img width="200" alt="스크린샷 2019-10-18 오후 8 06 22" src="https://user-images.githubusercontent.com/22251299/67090115-3c6b1900-f1e4-11e9-963e-9794f9de4149.png">
</div>

```swift  
// 로그인 뷰의 모든 AutoLayout을 잡고 StackView의 'Center Y축을' @IBOutlet으로 선언해서 키보드 제스처에 따라 높이를 제어
@IBOutlet weak var stackViewCenterY: NSLayoutConstraint! 

// animation 함수
// 최종 결과물로 보여줄 상태만 선언해주면 애니메이션은 알아서 동작
// duration은 간격
UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
    
    self.logoImgView.alpha = 0
    
    // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
    self.stackViewCenterY.constant = -keyboardHeight/2 + 125
})
//스택뷰 CenterY 잡아와서 constant 계산
```

### __* 과제2: Stackview - Calculator그리기__

<div>
<img width="200" alt="스크린샷 2019-10-25 오전 10 12 06" src="https://user-images.githubusercontent.com/22251299/67537644-45457880-f717-11e9-92db-4efac2694b7d.png">
</div>

####_Button layout 둥글게 만들 때 
```swift  
import UIKit

class Roundingbutton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //값이 커질수록 둥글
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        //버튼 배경색
        //self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //버튼의 textcolor
        //self.tintColor = UIColor.white
        //버튼의 외곽선컬러
        //self.layer.borderColor =
        //버튼의 외곽선두께: 값이 커질수록 두꺼움
        //self.layer.borderWidth =

    }
}
```

--------------------------------------------------------------------------------------------------------------------------------------

## 3rd_seminar  
### __* ScrollView & CollectionView그리기__

<img width="200" alt="스크린샷 2019-11-22 오후 8 38 47" src="https://user-images.githubusercontent.com/22251299/69423324-27485380-0d69-11ea-80f1-4f7428c669e7.png">

####_ScrollView 사용 전, Viewcontroller의 Simulated Size(Fixed -> Freeform)와 Height(1000) 변경

<img width="200" alt="스크린샷 2019-11-22 오후 8 40 30" src="https://user-images.githubusercontent.com/22251299/69423468-86a66380-0d69-11ea-8149-919df3a82ff6.png">

####_CollectionView Cell의 Estimate Size(Automatic -> None)으로 변경
####_Cell Size 수정할 시, View Size를  먼저 수정(확대)한 후 변경

<div>
<img width="200" alt="스크린샷 2019-11-01 오후 9 30 14" src="https://user-images.githubusercontent.com/22251299/68025318-cdb3b280-fcef-11e9-9379-3009bfea8c57.png">

<img width="200" alt="스크린샷 2019-11-01 오후 9 33 59" src="https://user-images.githubusercontent.com/22251299/68025269-baa0e280-fcef-11e9-8857-03b04667ea44.png">
</div>

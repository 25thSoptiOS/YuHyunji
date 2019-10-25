# 25th SOPT iOS
## 2nd_seminar  
### __* View 간의 데이터 전달 - Segue__

```swift
//destination scene이 나타나기 전 미리 필요한 작업을 수행하기위해 준비해주는 단계
override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    
    let destination = segue.destination
    let button = sender as! UIButton
    destination.title = button.titleLabel?.text

}
```

### __* View 간의 데이터 전달 - 직접 전달 방식__

<img width="411" alt="스크린샷 2019-10-18 오후 8 39 41" src="https://user-images.githubusercontent.com/22251299/67091851-b43b4280-f1e8-11e9-8d24-ed17356a077f.png">

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

### __* 과제1: Stackview - Loginview그리기__
<div>
<img width="411" alt="스크린샷 2019-10-18 오후 8 06 36" src="https://user-images.githubusercontent.com/22251299/67090084-26f5ef00-f1e4-11e9-8d93-71bdd0a9b10a.png">

<img width="411" alt="스크린샷 2019-10-18 오후 8 06 22" src="https://user-images.githubusercontent.com/22251299/67090115-3c6b1900-f1e4-11e9-963e-9794f9de4149.png">
</div>


```swift  
// 로그인 뷰의 모든 AutoLayout을 잡고 StackView의 'Center Y축을' @IBOutlet으로 선언해서 키보드 제스처에 따라 높이를 제어
@IBOutlet weak var stackViewCenterY: NSLayoutConstraint! 
```

### __* 과제2: Stackview - Calculator그리기__

<div>
<img width="411" alt="스크린샷 2019-10-25 오전 10 12 06" src="https://user-images.githubusercontent.com/22251299/67537644-45457880-f717-11e9-92db-4efac2694b7d.png">
</div>

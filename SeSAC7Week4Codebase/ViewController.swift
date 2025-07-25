//
//  ViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/21/25.
//

import UIKit

struct BMI {
    static var name = "고래밥" //타입, 저장 프로퍼티
    let height: Double //인스턴스, 저장 프로퍼티
    let weight: Double
    
    //주로 저장프로퍼티를 통해 연산(get, set)을 한다
    var result: String {
        get {
            let value = weight / (height * height)
            
            if value < 18.5 {
                return "저체중"
            } else {
                return "정상"
            }
        }
        set {
            BMI.name = newValue
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var goButton: UIButton!
    
    var bmi = BMI(height: 1.8, weight: 80)
    
    var ud = UserDefaultsHelper()
    
    //Swift5.7+ if let shorthand
    var nickname: String?
    var age: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(ud.name)
        print(ud.age)
        
        ud.age = 345
        ud.name = "jack"
        
        print(ud.name)
        print(ud.age)
        
        
        goButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
    }
    
    @objc func goButtonClicked() {
        
        //        print(BMI.name)
        //        print(bmi.height, bmi.weight)
        //
        //        print(bmi.result)
        //
        //        bmi.result = "sessac"
        //
        //        print(BMI.name)
        //
        //        let result = bmi.weight / (bmi.height * bmi.height)
        //
        //        if result < 18.5 {
        //            print("저체중")
        //        } else {
        //            print("정상")
        //        }
        
        //        guard let height = heightTextField.text, height.count > 2 else {
        //            print("height 2글자 미만임")
        //            return
        //        }
        //        print(height)
        //
        //        guard let weight = weightTextField.text, weight.count > 2 else {
        //            print("weight 2글자 미만임")
        //            return
        //        }
        //        print(weight)
        
        //둘 중 하나가 안되더라도 어떤 텍스트필드가 잘못됐는지 특정할 수 있음
        //height, weight 두 상수가 쓸 수 있는 범위가 다름
        //        if let height = heightTextField.text, height.count > 2 {
        //            print(height)
        //        } else {
        //            print("height 2글자 미만임")
        //        }
        //
        //        if let weight = weightTextField.text, weight.count > 2 {
        //            print(weight)
        //        } else {
        //            print("weight 2글자 미만임")
        //        }
        
        //        guard let weight = weightTextField.text, let height = heightTextField.text else {
        //            print("nil")
        //            return //early exit
        //        }
        //
        //        if let weight = weightTextField.text, let height = heightTextField.text {
        //            print(weight.count, height.count)
        //        } else {
        //            print("weight, height TextField가 nil")
        //        }
        
        
        //스토리보드 없을 때
        let vc = BookViewController()
        present(vc, animated: true)
    }
}

class User {
    
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct Mentor {
    
    let name: String
    let age: Int
}

//
//  PurpleTextField.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/23/25.
//

import UIKit

class PurpleTextField: UITextField {

    //코드로 뷰를 구성했을 때 실행되는 초기화 구문
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("코드 init")
        

    }
    
    //스토리보드로 뷰를 구성했을 떄 실행되는 초기화 구문
    //코드베이스여도 필수로 작성해줘야 함
    //required 키워드는 protocol에서 왔다는 명패
    required init?(coder: NSCoder) {
        print("스토리보드 init")
        fatalError("init(coder:) has not been implemented")
    }

    //부모클래스의 프로퍼티도 모두 초기화를 먼저 해야 함
    init(placeholder: String, keyboard: UIKeyboardType) {
        super.init(frame: .zero)
        print("코드 커스텀 init")
        self.placeholder = placeholder
        self.keyboardType = keyboard
        self.borderStyle = .none
        self.font = .boldSystemFont(ofSize: 15)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemPurple.cgColor
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
        self.tintColor = .systemPurple
    }
}

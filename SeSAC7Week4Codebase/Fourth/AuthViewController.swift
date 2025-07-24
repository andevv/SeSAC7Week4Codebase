//
//  AuthViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/23/25.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    //타입 메서드로 활용했을 때 공간이 영영 남아있는 이슈
    //각 뷰 객체마다 메서드 수가 늘어나는 이슈
    
    // -> 익명함수, 클로저, 즉시실행함수
    let emailTextField = {
        print("클로저")
        let emailTextField = PurpleTextField(placeholder: "이메일을 작성해주세요", keyboard: .emailAddress)

        return emailTextField
    }()
    
    let passwordTextField = {
        print(#function)
        let emailTextField = PurpleTextField(placeholder: "비밀번호를 작성해주세요", keyboard: .default)
        
        emailTextField.isSecureTextEntry = true
        
        return emailTextField
    }()
    
    lazy var ageTextField = {
        print(#function)
        let emailTextField = PurpleTextField(placeholder: "나이를 선택해주세요", keyboard: .numberPad)

        emailTextField.inputView = picker
        
        return emailTextField
    }()
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad 시작")
        configureHierarchy()
        configureLayout()
        configureView()
        
        
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        print("viewDidLoad 끝")
        
        passwordTextField.delegate = self
    }
    
    @objc func datePickerValueChanged() {
        print(#function)
        ageTextField.text = "\(picker.date)"
    }
    
}

extension AuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        view.endEditing(true)
        return true
    }
}


// MARK: - UI Setup
extension AuthViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(ageTextField)
    }
    
    func configureLayout() {
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        
        
    }
    

    
    

    
}

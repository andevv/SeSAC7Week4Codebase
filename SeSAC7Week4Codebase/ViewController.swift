//
//  ViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/21/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var goButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
    }

    @objc func goButtonClicked() {
        
        //스토리보드 없을 때
        let vc = ResultViewController()
        
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

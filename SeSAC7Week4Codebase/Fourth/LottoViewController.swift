//
//  LottoViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/24/25.
//

import UIKit
import SnapKit
import Alamofire

class LottoViewController: UIViewController {
    
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view)
        }
        resultLabel.backgroundColor = .yellow
        resultLabel.text = "test"
        callRequest()
    }
    
    func callRequest() {
        print(#function)


        print("callRequest END")
    }
    



}

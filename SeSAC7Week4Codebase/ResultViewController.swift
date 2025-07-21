//
//  ResultViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/21/25.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
    let resultLabel = UILabel()
    
    let redView = UIView()
    let blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(resultLabel)
        
        resultLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(20)
            //make.trailing.equalTo(view).offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(44)
        }
        
        resultLabel.backgroundColor = .systemGreen
        
        view.addSubview(redView)
        redView.addSubview(blackView)
        
        redView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            
            make.size.equalTo(100)
            //make.width.height.equalTo(100)
            //make.height.equalTo(100)
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
        }
        
        redView.backgroundColor = .red
        
        blackView.snp.makeConstraints { make in
            make.edges.equalTo(redView).inset(20)
            
//            make.horizontalEdges.equalTo(redView.snp.horizontalEdges)
//            make.verticalEdges.equalTo(redView.snp.verticalEdges)
            
//            make.leading.equalTo(redView.snp.leading)
//            make.trailing.equalTo(redView.snp.trailing)
//            make.top.equalTo(redView.snp.top)
//            make.bottom.equalTo(redView.snp.bottom)
        }
        blackView.backgroundColor = .black
    }
    
    func practiceFrameBasedLayout() {
        view.addSubview(blackView)
        blackView.addSubview(redView)
        
        
        redView.frame = CGRect(x: 100, y: 150, width: 100, height: 100)
        blackView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
        
        redView.backgroundColor = .red
        blackView.backgroundColor = .black
        blackView.layer.cornerRadius = 20
        blackView.clipsToBounds = true
        
        //객체 추가
        view.addSubview(resultLabel)
        
        //객체 배치
        resultLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        
        //객체 속성 설정
        resultLabel.backgroundColor = .gray
        resultLabel.text = "레이블 테스트"
    }
    
    func practiceAutoLayout() {
        view.addSubview(resultLabel)
        resultLabel.backgroundColor = .gray
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        let leading = NSLayoutConstraint(item: resultLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        //
        //        let trailing = NSLayoutConstraint(item: resultLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        //
        //        let bottom = NSLayoutConstraint(item: resultLabel, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -20)
        //
        //        let height = NSLayoutConstraint(item: resultLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44)
        //
        //        view.addConstraints([leading, trailing, bottom, height])
        
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 44),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

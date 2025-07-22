//
//  JackNavigationProtocol.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/22/25.
//

import Foundation

//Optional Requirements
@objc protocol JackNavigationProtocol {
    
    //프로퍼티 요구사항은 최소 요구사항
    //저장프로퍼티로도 쓸 수 있고, 연산프로퍼티로도 쓸 수 있다.
    //get만 있으면 되고, set은 옵션임
    var myTitle: String { get }
    var myButton: String { get set }
    
    func configure()
    @objc optional func configureButton()
}

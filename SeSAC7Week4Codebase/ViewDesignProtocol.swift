//
//  ViewDesignProtocol.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/22/25.
//

import Foundation

//Interface
//Protocol Requirements
//Method Requirements
//Property Requirements
//명세만 할 뿐, 구현은 구현부에서 알아서

//UIKit Class에서만 사용할 수 있도록 제약조건(AnyObject)
protocol ViewDesignProtocol: AnyObject {
    
    func configureHierarchy()
    func configureLayout()
    func configureView()
    
}

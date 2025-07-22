//
//  SearchViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/22/25.
//

import UIKit

class SearchViewController: UIViewController {
    
    //protocol
    var myTitle: String = "검색 화면"
    
    var myButton: String {
        get {
            return "save"
        }
        set {
            print(newValue)
        }
    }

    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        configureHierarchy()
        configureLayout()
        configureView()
    }


}

extension SearchViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(label)
    }
    
    func configureLayout() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(100)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        label.backgroundColor = .orange
    }
}

extension SearchViewController: JackNavigationProtocol {
    
    func configure() {
        navigationItem.title = myTitle
    }
    
}

//
//  BookViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/25/25.
//

import UIKit
import Alamofire
import SnapKit

class BookViewController: UIViewController {
    
    lazy var tableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange
        tableView.rowHeight = 130
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
        return tableView
    }()
    
    let searchBar = UISearchBar()
    
    var list: BookInfo = BookInfo(items: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
    }
    
    func callRequest(query: String) {
        print(#function, "첫 번째")
        
        let url = "https://openapi.naver.com/v1/search/book.json?query=\(query)"
        let header: HTTPHeaders = [
            "X-Naver_Client_Id": "",
            "X-Naver-Client-Secret": ""
        ]
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BookInfo.self) { response in
                print(#function, "두 번째")
                switch response.result {
                case .success(let value):
                    dump(value)
                    
                    self.list = value
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print("fail", error)
                }
            }
    }
}

extension BookViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(#function, searchBar.text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        
        guard let text = searchBar.text, text.count > 0 else {
            print("빈값 입력")
            return
        }
        callRequest(query: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        list = BookInfo(items: [])
        tableView.reloadData()
    }
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as! BookTableViewCell
        let row = list.items[indexPath.row]
        cell.titleLabel.text = row.title
        cell.subTitleLabel.text = "\(row.author) 작가 (\(row.pubdate)출간)"
        cell.overviewLabel.text = row.description
        cell.thumbnailImageView.backgroundColor = .lightGray
        return cell
    }
}

extension BookViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(tableView)
        view.addSubview(searchBar)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        tableView.keyboardDismissMode = .onDrag
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    }
}

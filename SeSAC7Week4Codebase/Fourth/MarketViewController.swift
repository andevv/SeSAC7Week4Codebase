//
//  MarketViewController.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/23/25.
//

import UIKit
import SnapKit
import Alamofire

class MarketViewController: UIViewController {
    

    
    lazy var tableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        callRequest()
        callBoxOffice()
    }
    
    func callBoxOffice() {
        
        guard let movieApiKey = Bundle.main.object(forInfoDictionaryKey: "MOVIE_API_KEY") as? String else { return }
        
        print(movieApiKey)
        
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(movieApiKey)&targetDt=20250720"
        AF.request(url, method: .get).validate(statusCode: 200..<300)
            .responseDecodable(of: boxOfficeResult.self) { response in
            
            switch response.result {
            case .success(let value):
                print("success", value)
                print(url)
                dump(value)
                
                print(value.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
                
            case .failure(let error):
                print("fail", error)
                print(url)
            }
        }
    }
    
    func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: [Coin].self) { response in
            
            switch response.result {
            case .success(let value):
                print("success", value)
                
                print(value[2].korean_name)
                print(value[2].english_name)
                print(value[2].market)
                
            case .failure(let error):
                print("fail", error)
            }
        }
    }
    
    
    
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as! MarketTableViewCell
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    
}

extension MarketViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        
    }
    
    
}

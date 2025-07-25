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
    
    var list: [Coin] = [Coin(market: "AA", korean_name: "AA", english_name: "BB"),Coin(market: "BB", korean_name: "BB", english_name: "BB"),Coin(market: "CC", korean_name: "CC", english_name: "CC")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest()
        print("callReq 이후")
        configureHierarchy()
        configureLayout()
        configureView()
        
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
        print(#function, "첫 번째")
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: [Coin].self) { response in
            
            print(#function, "두 번째")
            switch response.result {
            case .success(let value):
                print("success", value)
                
                //list에 내용을 담고
                //테이블뷰 갱신
                self.list = value
                self.tableView.reloadData()
                
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
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as! MarketTableViewCell
        let row = list[indexPath.row]
        cell.nameLabel.text = row.coinOverview
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

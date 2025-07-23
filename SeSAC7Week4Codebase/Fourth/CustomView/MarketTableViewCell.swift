//
//  MarketTableViewCell.swift
//  SeSAC7Week4Codebase
//
//  Created by andev on 7/23/25.
//

import UIKit
import SnapKit

class MarketTableViewCell: UITableViewCell {
    
    static let identifier = "MarketTableViewCell"
    
    let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("코드 init")
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}

extension MarketTableViewCell: ViewDesignProtocol {
    func configureHierarchy() {
        //유의사항. 셀에 레이블 추가하면 보이고 레이아웃도 잘 잡히지만 잘못 추가함.
        //버튼 같은 클릭되는 요소들은 클릭이 안됨 -> 콘텐트뷰에 추가할 것
        contentView.addSubview(nameLabel)
    }
    
    func configureLayout() {
        nameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(22)
            make.centerY.equalTo(contentView)
        }
    }
    
    func configureView() {
        nameLabel.text = "비트코인"
        nameLabel.textColor = .white
    }
    
    
}

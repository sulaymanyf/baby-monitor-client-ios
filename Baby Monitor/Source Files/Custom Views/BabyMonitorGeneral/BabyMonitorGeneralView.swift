//
//  BabyMonitorGeneralView.swift
//  Baby Monitor
//

import UIKit
import RxCocoa
import RxSwift

final class BabyMonitorGeneralView: BaseView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BabyMonitorCell.self, forCellReuseIdentifier: BabyMonitorCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private(set) lazy var babyNavigationItemView = BabyNavigationItemView()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.75
        return view
    }()
    
    init(type: BabyMonitorGeneralViewType) {
        super.init()
        setup(type: type)
    }
    
    // MARK: - private functions
    private func setup(type: BabyMonitorGeneralViewType) {
        tableView.separatorStyle = .singleLine
        
        tableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        tableView.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        switch type {
        case .switchBaby:
            tableView.separatorStyle = .none
            backgroundColor = .clear
            tableView.backgroundColor = .clear
        case .activityLog, .lullaby, .settings:
            backgroundView.isHidden = true
            tableView.backgroundColor = .white
        }
        
        [backgroundView, tableView].forEach {
            addSubview($0)
            $0.addConstraints({ $0.equalSafeAreaEdges() })
        }
    }
}

extension Reactive where Base: BabyMonitorGeneralView {
    
    var switchBabiesTap: ControlEvent<Void> {
        return base.babyNavigationItemView.rx.tap
    }
}

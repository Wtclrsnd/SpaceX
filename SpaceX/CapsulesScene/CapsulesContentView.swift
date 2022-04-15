//
//  CapsulesContentView.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 13.04.2022.
//

import UIKit

final class CapsulesContentView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "capsuleBackground")
        tableView.separatorColor = .clear
        tableView.register(CapsulesTableViewCell.self, forCellReuseIdentifier: "myCell")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setUpUI()
    }

    private func setUpUI() {
        backgroundColor = .clear

        addSubview(tableView)
        tableView.frame = bounds
    }
}

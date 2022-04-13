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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        backgroundColor = .systemBackground

        addSubview(tableView)
        tableView.frame = bounds
    }
}

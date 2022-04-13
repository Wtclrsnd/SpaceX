//
//  CapsulesContentView.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 13.04.2022.
//

import UIKit

final class CapsulesContentView: UIView {
    var capsules: [Capsules.InitForm.ViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
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

extension CapsulesContentView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capsules.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = capsules[indexPath.row].capsuleSerial
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        router.moveToCapsule(data: capsules[indexPath.row])
//    }
}

//
//  CapsulesTableViewCell.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 14.04.2022.
//

import UIKit

class CapsulesTableViewCell: UITableViewCell {
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightText
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowRadius = 2
//        view.layer.shadowColor = UIColor(named: "Light Gray")?.cgColor
//        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        return view
    }()

    let itemStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    let capsuleSerial: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label
    }()

    let capsuleDetails: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .lightGray
        return label
    }()

    let capsuleDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label
    }()

    let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .lightText
        self.backgroundColor = .lightText
        contentView.addSubview(cardView)
        cardView.addSubview(itemStack)
        itemStack.addArrangedSubview(capsuleSerial)
        itemStack.addArrangedSubview(capsuleDetails)
        itemStack.addArrangedSubview(seperator)
        itemStack.addArrangedSubview(capsuleDate)

        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

        itemStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
        itemStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5).isActive = true
        itemStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5).isActive = true
        itemStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -5).isActive = true

        capsuleSerial.heightAnchor.constraint(equalToConstant: 18).isActive = true
        capsuleDetails.heightAnchor.constraint(equalToConstant: 14).isActive = true
        capsuleDate.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

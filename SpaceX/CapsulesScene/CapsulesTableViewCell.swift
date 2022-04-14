//
//  CapsulesTableViewCell.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 14.04.2022.
//

import UIKit

class CapsulesTableViewCell: UITableViewCell {
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
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemStack)
        itemStack.addArrangedSubview(capsuleSerial)
        itemStack.addArrangedSubview(capsuleDetails)
        itemStack.addArrangedSubview(seperator)
        itemStack.addArrangedSubview(capsuleDate)

        itemStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        itemStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        itemStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        itemStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

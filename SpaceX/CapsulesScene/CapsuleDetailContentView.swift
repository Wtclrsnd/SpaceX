//
//  CapsuleDetailContentView.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 13.04.2022.
//

import UIKit

final class CapsuleDetailContentView: UIView {
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()

    private lazy var serialTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.text = "Capsule Serial: "
        textField.font = .systemFont(ofSize: 28)
        return textField
    }()

    private lazy var capsuleIDLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.text = "capsuleID: "
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.text = "status: "
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    private lazy var landingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.text = "landings: "
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "details: "
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    private lazy var reuseCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.text = "reuseCount: "
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.text = "time: "
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    var model: Capsule.InitForm.ViewModel? {
        didSet {
            serialTextField.text?.append(model?.capsuleSerial ?? "")
            capsuleIDLabel.text?.append(model?.capsuleID.rawValue ?? "")
            statusLabel.text?.append(model?.status.rawValue ?? "")
            landingsLabel.text?.append(String(model?.landings ?? 0))
            detailsLabel.text?.append(model?.details ?? "")
            reuseCountLabel.text?.append(String(model?.reuseCount ?? 0))
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let string = model?.originalLaunch ?? "0"
            let date = dateFormatter.date(from: string)
            timeLabel.text?.append(dateFormatter.string(from: date ?? Date()))
        }
    }

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

        addSubview(stack)
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true

        stack.addArrangedSubview(serialTextField)
        stack.addArrangedSubview(capsuleIDLabel)
        stack.addArrangedSubview(statusLabel)
        stack.addArrangedSubview(landingsLabel)
        stack.addArrangedSubview(detailsLabel)
        stack.addArrangedSubview(reuseCountLabel)
        stack.addArrangedSubview(timeLabel)
    }
}

//
//  MissionContentView.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 14.04.2022.
//

import UIKit

class MissionContentView: UIView {
    weak var delegate: MissionViewToVCDelegate?

    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.text = "description"
        textView.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        textView.font = .systemFont(ofSize: 28)
        return textView
    }()

    var mission: Mission.InitForm.ViewModel? {
        didSet {
            descriptionTextView.text = mission?.missionDescription ?? ""
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

        addSubview(descriptionTextView)

        descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        descriptionTextView.topAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        descriptionTextView.widthAnchor.constraint(equalToConstant: self.frame.width - 30).isActive = true
    }
}

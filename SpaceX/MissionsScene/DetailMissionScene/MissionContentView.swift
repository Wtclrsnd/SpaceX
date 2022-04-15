//
//  MissionContentView.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 14.04.2022.
//

import UIKit

class MissionContentView: UIView {
    private var scrollView: UIScrollView!

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "description"
        label.font = .systemFont(ofSize: 28)
        return label
    }()

    var mission: Mission.InitForm.ViewModel? {
        didSet {
            descriptionLabel.text = mission?.missionDescription ?? ""
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

        configureScrollView()
        setUpUI()
    }

    private func setUpUI() {
        backgroundColor = .systemBackground
        scrollView.backgroundColor = .systemBackground

        scrollView.addSubview(descriptionLabel)

        descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 30).isActive = true

        scrollView.contentSize = descriptionLabel.bounds.size
    }

    private func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        scrollView.contentInsetAdjustmentBehavior = .never

        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}

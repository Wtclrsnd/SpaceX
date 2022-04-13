//
//  CapsuleViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsuleViewController: UIViewController, CapsuleDisplayLogic {
    // ui to content view
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

    private let interactor: CapsuleBusinessLogic
    private let router: CapsuleRoutingLogic

    var data: Capsules.InitForm.ViewModel?

    init(interactor: CapsuleBusinessLogic, router: CapsuleRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        setUpUI()
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground

        // view.addSubview(ContentView)
        view.addSubview(stack)
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true

        stack.addArrangedSubview(serialTextField)
        stack.addArrangedSubview(capsuleIDLabel)
        stack.addArrangedSubview(statusLabel)
        stack.addArrangedSubview(landingsLabel)
        stack.addArrangedSubview(detailsLabel)
        stack.addArrangedSubview(reuseCountLabel)

        // pass the data to public content view field (model)
        serialTextField.text?.append(data?.capsuleSerial ?? "")
        capsuleIDLabel.text?.append(data?.capsuleID.rawValue ?? "")
        statusLabel.text?.append(data?.status.rawValue ?? "")
        landingsLabel.text?.append(String(data?.landings ?? 0))
        detailsLabel.text?.append(data?.details ?? "")
        reuseCountLabel.text?.append(String(data?.reuseCount ?? 0))
    }

    // MARK: - CapsuleDisplayLogic

    func displayInitForm(_ viewModel: Capsule.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Capsule.InitForm.Request())
    }
}

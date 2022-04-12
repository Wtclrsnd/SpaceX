//
//  EventViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class EventViewController: UIViewController, EventDisplayLogic {
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

    var event: History.InitForm.Response?

    private let interactor: EventBusinessLogic
    private let router: EventRoutingLogic

    init(interactor: EventBusinessLogic, router: EventRoutingLogic) {
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
        configureScrollView()
        setUpUI()
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
        scrollView.backgroundColor = .systemBackground
        title = event?.title

        scrollView.addSubview(descriptionLabel)
        descriptionLabel.text = event?.details

        descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true

        scrollView.contentSize = descriptionLabel.bounds.size
    }

    private func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        scrollView.contentInsetAdjustmentBehavior = .never

        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }

    // MARK: - EventDisplayLogic

    func displayInitForm(_ viewModel: Event.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Event.InitForm.Request())
    }
}

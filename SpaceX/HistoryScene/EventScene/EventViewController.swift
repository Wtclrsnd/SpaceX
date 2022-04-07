//
//  EventViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class EventViewController: UIViewController, EventDisplayLogic {
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
    }

    // MARK: - EventDisplayLogic

    func displayInitForm(_ viewModel: Event.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Event.InitForm.Request())
    }
}

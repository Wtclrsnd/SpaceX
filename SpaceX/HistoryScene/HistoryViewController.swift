//
//  HistoryViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryViewController: UIViewController, HistoryDisplayLogic {
    private let interactor: HistoryBusinessLogic
    private let router: HistoryRoutingLogic

    init(interactor: HistoryBusinessLogic, router: HistoryRoutingLogic) {
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

    // MARK: - HistoryDisplayLogic

    func displayInitForm(_ viewModel: History.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(History.InitForm.Request())
    }
}

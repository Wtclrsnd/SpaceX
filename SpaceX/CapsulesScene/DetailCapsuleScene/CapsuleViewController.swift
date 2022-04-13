//
//  CapsuleViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsuleViewController: UIViewController, CapsuleDisplayLogic {
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

    override func loadView() {
        self.view = CapsuleDetailContentView()
    }

    func view() -> CapsuleDetailContentView {
        guard let view = self.view as? CapsuleDetailContentView else { return CapsuleDetailContentView() }
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        title = data?.capsuleSerial
        view().model = data
    }

    // MARK: - CapsuleDisplayLogic

    func displayInitForm(_ viewModel: Capsule.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Capsule.InitForm.Request())
    }
}

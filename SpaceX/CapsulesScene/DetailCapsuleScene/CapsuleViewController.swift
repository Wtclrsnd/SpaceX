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

    init(interactor: CapsuleBusinessLogic) {
        self.interactor = interactor
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
    }

    // MARK: - CapsuleDisplayLogic

    func displayInitForm(_ viewModel: Capsule.InitForm.ViewModel) {
        title = viewModel.capsuleSerial
        view().model = viewModel
    }

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Capsule.InitForm.Request())
    }
}

//
//  MissionViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionViewController: UIViewController, MissionDisplayLogic {
    private let interactor: MissionBusinessLogic

    init(interactor: MissionBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func view() -> MissionContentView {
        guard let view = self.view as? MissionContentView else { return MissionContentView() }
        return view
    }

    private func addObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewAndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            view().descriptionTextView.contentInset = .zero
        } else {
            view().descriptionTextView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: keyboardViewAndFrame.height - view().safeAreaInsets.bottom,
                right: 0
            )
        }

        view().descriptionTextView.scrollIndicatorInsets = view().descriptionTextView.contentInset
        let selectedRange = view().descriptionTextView.selectedRange
        view().descriptionTextView.scrollRangeToVisible(selectedRange)
    }

    override func loadView() {
        self.view = MissionContentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        addObservers()
    }

    // MARK: - MissionDisplayLogic

    func displayInitForm(_ viewModel: Mission.InitForm.ViewModel) {
        title = viewModel.missionName
        view().mission = viewModel
    }

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Mission.InitForm.Request())

        let rightItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.done,
            target: self,
            action: #selector(done)
        )
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .systemPink
    }

    @objc private func done() {
        view().endEditing(true)
    }
}

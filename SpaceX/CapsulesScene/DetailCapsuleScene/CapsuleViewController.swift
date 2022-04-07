//
//  CapsuleViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsuleViewController: UIViewController, CapsuleDisplayLogic {

	//MARK: - Properties
	private lazy var scrollView = UIScrollView()

	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fill
		stack.spacing = 10
		return stack
	}()

	private lazy var serialLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.text = "serial"
		label.font = .systemFont(ofSize: 28)
		return label
	}()

	private lazy var capsuleIDLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.text = "capsuleID"
		label.font = .systemFont(ofSize: 28)
		return label
	}()

	private lazy var statusLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.text = "status"
		label.font = .systemFont(ofSize: 28)
		return label
	}()

	private lazy var landingsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.text = "landings"
		label.font = .systemFont(ofSize: 28)
		return label
	}()

	private lazy var detailsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.text = "details"
		label.font = .systemFont(ofSize: 28)
		return label
	}()

	private lazy var reuseCountLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.text = "reuseCount"
		label.font = .systemFont(ofSize: 28)
		return label
	}()
    private let interactor: CapsuleBusinessLogic
    private let router: CapsuleRoutingLogic

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
		
	}

    // MARK: - CapsuleDisplayLogic

    func displayInitForm(_ viewModel: Capsule.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Capsule.InitForm.Request())
    }
}

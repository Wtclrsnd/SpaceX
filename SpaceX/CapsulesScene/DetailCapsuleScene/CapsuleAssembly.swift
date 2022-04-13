//
//  CapsuleAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum CapsuleAssembly {
    static func build(data: Capsules.InitForm.ViewModel) -> UIViewController {
        let presenter = CapsulePresenter()
        let interactor = CapsuleInteractor(presenter: presenter) // a data field
        let viewController = CapsuleViewController(interactor: interactor)

        presenter.view = viewController

        interactor.capsuleRaw = data

        return viewController
    }
}

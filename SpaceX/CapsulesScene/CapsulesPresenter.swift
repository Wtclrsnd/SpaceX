//
//  CapsulesPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class CapsulesPresenter: CapsulesPresentationLogic {
    weak var view: CapsulesDisplayLogic?

    func presentInitForm(_ response: Capsules.InitForm.Response) {
        view?.displayInitForm(Capsules.InitForm.ViewModel())
    }
}

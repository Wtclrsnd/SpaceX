//
//  MenuPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MenuPresenter: MenuPresentationLogic {
    weak var view: MenuDisplayLogic?

    func presentInitForm(_ response: Menu.InitForm.Response) {
        view?.displayInitForm(Menu.InitForm.ViewModel())
    }
}

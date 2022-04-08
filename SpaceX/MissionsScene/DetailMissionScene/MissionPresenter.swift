//
//  MissionPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MissionPresenter: MissionPresentationLogic {
	weak var view: MissionDisplayLogic?

	func presentInitForm(_ response: Mission.InitForm.Response) {
		view?.displayInitForm(Mission.InitForm.ViewModel())
	}
}

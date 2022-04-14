//
//  EventPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class EventPresenter: EventPresentationLogic {
    weak var view: EventDisplayLogic?

    func presentInitForm(_ response: Event.InitForm.Response) {
        let event = Event.InitForm.ViewModel(
            title: response.title,
            eventDateUTC: response.eventDateUTC,
            details: response.details
        )
        view?.displayInitForm(event)
    }
}

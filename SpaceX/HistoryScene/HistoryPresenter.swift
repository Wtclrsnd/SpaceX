//
//  HistoryPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class HistoryPresenter: HistoryPresentationLogic {
    weak var view: HistoryDisplayLogic?

    func presentInitForm(_ response: [History.InitForm.Response]) {
        var events: [History.InitForm.ViewModel] = []
        for event in response {
            events.append(
                History.InitForm.ViewModel(
                    title: event.title,
                    eventDateUTC: event.eventDateUTC,
                    details: event.details
                )
            )
        }
        view?.displayInitForm(events)
    }
}

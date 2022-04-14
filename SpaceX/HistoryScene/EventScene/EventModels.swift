//
//  EventModels.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Event {
    enum InitForm {
        struct Request {}
        struct Response {
            let title: String
            let eventDateUTC: String
            let details: String
        }
        struct ViewModel {
            let title: String
            let eventDateUTC: String
            let details: String
        }
    }
}

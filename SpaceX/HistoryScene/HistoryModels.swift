//
//  HistoryModels.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum History {
    enum InitForm {
        struct Request {}
        struct Response {
            let title: String
            let eventDateUTC: String
            let details: String
        }
        struct ViewModel {}
    }
}

struct EventData: Codable {
    let id: Int
    let title, eventDateUTC: String
    let eventDateUnix: Int
    let flightNumber: Int?
    let details: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case eventDateUTC = "event_date_utc"
        case eventDateUnix = "event_date_unix"
        case flightNumber = "flight_number"
        case details = "details"
    }
}

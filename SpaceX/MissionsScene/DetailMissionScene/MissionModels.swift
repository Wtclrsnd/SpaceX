//
//  MissionModels.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Mission {
    enum InitForm {
        struct Request {}
        struct Response {
            let missionName: String
            let missionID: String
            var missionDescription: String
        }
        struct ViewModel {
            let missionName: String
            let missionID: String
            var missionDescription: String
        }
    }
}

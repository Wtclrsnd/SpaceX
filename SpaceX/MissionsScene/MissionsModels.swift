//
//  MissionsModels.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Missions {
    enum InitForm {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }
}

struct MissionData: Codable {
	let missionName, missionID: String
	let manufacturers, payloadIDS: [String]
	let wikipedia: String
	let website: String
	let twitter: String?
	let missionDescription: String

	enum CodingKeys: String, CodingKey {
		case missionName = "mission_name"
		case missionID = "mission_id"
		case manufacturers
		case payloadIDS = "payload_ids"
		case wikipedia, website, twitter
		case missionDescription = "description"
	}
}

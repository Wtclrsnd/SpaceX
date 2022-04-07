//
//  CapsuleModels.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Capsule {
    enum InitForm {
        struct Request {}
		struct Response {}
			// MARK: - Capsule
//			struct Capsule: Codable {
//				let capsuleSerial, capsuleID, status, originalLaunch: String
//				let originalLaunchUnix: Int
//				let missions: [Mission]
//				let landings: Int
//				let type: String
//				let reuseCount: Int

//				enum CodingKeys: String, CodingKey, Decodable {
//					case capsuleSerial = "capsule_serial"
//					case capsuleID = "capsule_id"
//					case status
//					case originalLaunch = "original_launch"
//					case originalLaunchUnix = "original_launch_unix"
//					case missions, landings, type, details
//					case reuseCount = "reuse_count"
//				}

			// MARK: - Mission
//			struct Mission: Codable {
//				let name: String
//				let flight: Int
//			}
        struct ViewModel {}
	}
}

//
//  CapsulesModels.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Capsules {
    enum InitForm {
        struct Request {}
        struct Response {
            let capsuleSerial: String
            let capsuleID: CapsuleID
            let status: Status
            let originalLaunch: String?
            let originalLaunchUnix: Int?
            let landings: Int
            let details: String?
            let reuseCount: Int
        }
        struct ViewModel {}
    }

    // MARK: - Capsule
    struct CapsuleData: Codable {
        let capsuleSerial: String
        let capsuleID: CapsuleID
        let status: Status
        let originalLaunch: String?
        let originalLaunchUnix: Int?
        let missions: [Mission]
        let landings: Int
        let type: TypeEnum
        let details: String?
        let reuseCount: Int

        enum CodingKeys: String, CodingKey {
            case capsuleSerial = "capsule_serial"
            case capsuleID = "capsule_id"
            case status
            case originalLaunch = "original_launch"
            case originalLaunchUnix = "original_launch_unix"
            case missions, landings, type, details
            case reuseCount = "reuse_count"
        }
    }

    enum CapsuleID: String, Codable {
        case dragon1 = "dragon1"
        case dragon2 = "dragon2"
    }

    // MARK: - Mission
    struct Mission: Codable {
        let name: String
        let flight: Int
    }

    enum Status: String, Codable {
        case active = "active"
        case destroyed = "destroyed"
        case retired = "retired"
        case unknown = "unknown"
    }

    enum TypeEnum: String, Codable {
        case dragon10 = "Dragon 1.0"
        case dragon11 = "Dragon 1.1"
        case dragon20 = "Dragon 2.0"
    }
}

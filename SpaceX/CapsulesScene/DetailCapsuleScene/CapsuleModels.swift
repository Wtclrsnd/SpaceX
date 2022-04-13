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
        struct Response {
            let capsuleSerial: String
            let capsuleID: Capsules.CapsuleID
            let status: Capsules.Status
            let originalLaunch: String?
            let originalLaunchUnix: Int?
            let landings: Int
            let details: String?
            let reuseCount: Int
        }
        struct ViewModel {
            let capsuleSerial: String
            let capsuleID: Capsules.CapsuleID
            let status: Capsules.Status
            let originalLaunch: String?
            let originalLaunchUnix: Int?
            let landings: Int
            let details: String?
            let reuseCount: Int
        }
    }
}

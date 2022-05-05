//
//  MessageModel.swift
//  iosApp
//
//  Created by Daniel Martínez on 3/5/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let value: String
}

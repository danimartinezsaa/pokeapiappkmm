//
//  ChatViewModel.swift
//  iosApp
//
//  Created by Daniel Martínez on 3/5/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared

@MainActor
class ChatViewModel: ObservableObject {

    @Published private(set) var messages: [Message] = []
    
    private let chatService: Chat

    init() {
        self.chatService = Chat()
        
        chatService.connectChat()

        chatService.newMessage = { [unowned self] message in self.messages.append(Message(value: message)) }
    }
    
    func sendChatMessage(_ message: String) {
        chatService.sendChatMessage(message: message)
    }
}

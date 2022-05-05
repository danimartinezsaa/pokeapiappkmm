package com.example.pokeapiapp

class Chat {

    private val CHATS_URL = "ws://localhost:8080/chat"

    private val webSocketClient = WebSocketClient(CHATS_URL)
    private val messages: List<String> = mutableListOf()

    var chatState: ((String) -> Unit)? = null
    var chatMessages: ((List<String>) -> Unit)? = null
    var newMessage: ((String) -> Unit)? = null

    constructor() {
        webSocketClient.stateListener = { state -> chatState?.invoke(state.toString()) }
        webSocketClient.messageListener = { message ->
            messages.plus(message)
            chatMessages?.invoke(messages)
            newMessage?.invoke(message)
        }
    }

    fun connectChat() {
        webSocketClient.connect()
    }

    fun disconnectChat() {
        webSocketClient.disconnect()
    }

    fun sendChatMessage(message: String) {
        webSocketClient.send(message)
    }
}
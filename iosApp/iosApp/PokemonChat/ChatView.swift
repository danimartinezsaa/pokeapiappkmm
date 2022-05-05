//
//  ChatView.swift
//  iosApp
//
//  Created by Daniel Martínez on 3/5/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct StringIdentifiable: Identifiable {
    var id = UUID()
    var value: String
}

struct ChatView: View {

    @State var message: String = ""
    @StateObject private var viewModel: ChatViewModel

    init() {
        self._viewModel = StateObject(wrappedValue: ChatViewModel())
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages) { message in
                    ChatBubbleView(message: message.value)
                }
            }
            .padding(.top, 50)

            HStack {
                TextEditor(text: $message)
                    .foregroundColor(.gray)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.blue, lineWidth: 2)
                    )
                    .cornerRadius(3.0)
                Button("Send") {
                    viewModel.sendChatMessage(message)
                    message = ""
                }
                .background(.blue)
                .padding(.vertical, 0)
                .buttonStyle(.bordered)
                .tint(.white)
                .cornerRadius(10.0)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 20)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

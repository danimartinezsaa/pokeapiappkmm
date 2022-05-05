//
//  ChatBubbleView.swift
//  iosApp
//
//  Created by Daniel Martínez on 3/5/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct ChatBubbleView: View {
    
    let message: String
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Text(message)
                    .foregroundColor(.white)
            }
            .padding()
            .background(.blue)
            .cornerRadius(20)
            .padding(.trailing, 20)
        }
    }
}

struct ChatBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleView(message: "Hello!")
    }
}

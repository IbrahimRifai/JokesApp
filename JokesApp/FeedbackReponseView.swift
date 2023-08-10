//
//  FeedbackReponseView.swift
//  JokesApp
//
//  Created by Ibrahim Alrifai on 25/07/2023.
//

import SwiftUI

struct FeedbackResponseView: View {
    var isFeedbackPositive:Bool
    var body: some View {
        VStack{
            Image(isFeedbackPositive ? "Happy" : "Sad")
                .resizable()
                .scaledToFit()
            Text(isFeedbackPositive ? "Yay" : "You hate fun")
            
        }
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isFeedbackPositive: true)
    }
}

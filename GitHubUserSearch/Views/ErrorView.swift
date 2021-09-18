//
//  ErrorView.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 19/09/2021.
//

import SwiftUI

struct ErrorView: View {
    
    var message: String
    
    var body: some View {
        VStack {
            if !message.isEmpty {
                Text(message)
                    .font(.title3)
                    .padding(.top)
                    .foregroundColor(Color(.systemRed))
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "test")
    }
}

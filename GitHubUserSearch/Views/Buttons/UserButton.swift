//
//  UserButton.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 20/09/2021.
//

import SwiftUI

struct UserButton: View {
    
    var title: String
    
    var body: some View {
        
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
    
    }
}

struct UserButton_Previews: PreviewProvider {
    static var previews: some View {
        UserButton(title: "See Profile on Github")
    }
}

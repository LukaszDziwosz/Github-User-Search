//
//  XButton.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 20/09/2021.
//

import SwiftUI

struct XButton: View {
    
    var frameXY: CGFloat
    
    var body: some View {
        Image(systemName: "xmark")
            .foregroundColor(Color(.label))
            .imageScale(.large)
            .frame(width: frameXY, height: frameXY)
            .padding()
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton(frameXY: 44)
    }
}

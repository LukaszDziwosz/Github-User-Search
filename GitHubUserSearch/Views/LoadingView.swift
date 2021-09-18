//
//  LoadingView.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 18/09/2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

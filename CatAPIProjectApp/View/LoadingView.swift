//
//  LoadingView.swift
//  CatAPIProjectApp
//
//  Created by Алексей Поддубный on 28.03.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("😺").font(.system(size: 40))
            ProgressView()
            Text("Getting the cats...").foregroundColor(.gray)
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

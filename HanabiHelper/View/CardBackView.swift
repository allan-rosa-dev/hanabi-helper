//
//  CardBackView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 19/07/23.
//

import SwiftUI

struct CardBackView: View {
    var body: some View {
        ZStack {
            K.backgroundColor
                .ignoresSafeArea()
        }
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView()
    }
}

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
                .opacity(0.0)
            RoundedRectangle(cornerRadius: 20)
                .fill(.orange)
        }
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView()
    }
}

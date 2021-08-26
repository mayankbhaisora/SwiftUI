//
//  CardView.swift
//  SwipeView
//
//  Created by MayankBhaisora on 25/08/21.
//

import SwiftUI

// This is just an example view that will be displayed as a child of SwipeView
// You can use any other View as well
struct CardView: View {
    
    var color: UIColor
    
    var body: some View {
        Color(color)
            .shadow(color: .gray, radius: 12)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: .green)
    }
}

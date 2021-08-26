//
//  CardView.swift
//  ConstantineSwiftUI
//
//  Created by Biz2credit on 25/08/21.
//

import SwiftUI

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

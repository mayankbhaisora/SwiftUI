//
//  SwipeView.swift
//  SwipeView
//
//  Created by MayankBhaisora on 25/08/21.
//

import SwiftUI

struct SwipeView<T: View>: View {
    
    @State private var offset: CGFloat = 0
    @State private var index = 0
    
    // Here we pass all the child views that need to be displayed horizontally and we can swipe them.
    // T is the generic class type so that we can pass any type of View in there
    let children: [T]
    let spacing: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            return ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: VerticalAlignment.center, spacing: self.spacing) {
                    ForEach(0 ..< self.children.count) { loopIndex in
                        children[loopIndex]
                            .frame(width: geometry.size.width - spacing * 2)
                    }
                }
                .padding(spacing)
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                    })
                    .onEnded({ value in
                        if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.children.count - 1 {
                            self.index += 1
                        }
                        if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                            self.index -= 1
                        }
                        withAnimation { self.offset = -(geometry.size.width - self.spacing) * CGFloat(self.index) }
                    })
            )
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        // Card view is just an example view for previews, you can use any subclas of View.
        SwipeView<CardView>(children: [
            CardView(color: .cyan),
            CardView(color: .magenta),
            CardView(color: .yellow)
        ])
    }
}

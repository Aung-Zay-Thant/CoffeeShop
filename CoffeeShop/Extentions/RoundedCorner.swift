//
//  RoundedCorner.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

extension View{
    func cornorRadius(_ radius : CGFloat,corners : UIRectCorner)-> some
    View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius : CGFloat
    var corners : UIRectCorner
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorner(
            radius: 40, corners: [.topLeft,.topRight]
        )
    }
}

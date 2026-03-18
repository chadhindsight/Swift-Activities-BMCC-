//
//  CustomImage.swift
//  VariableImageGallery
//
//  Created by chadhindsight on 3/17/26.
//

import SwiftUI

struct CustomImage: View {
var imageName: String
var borderSize: CGFloat
    var borderColor: Color = .blue
var shadowRadius: CGFloat

    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .border(borderColor, width: borderSize)
            .shadow(radius: shadowRadius)
            .padding()
    }
}

#Preview {
    CustomImage(imageName: "faaah", borderSize: 10, borderColor:.blue, shadowRadius: 20)
}

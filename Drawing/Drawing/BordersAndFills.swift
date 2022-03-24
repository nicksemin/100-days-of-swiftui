//
//  BordersAndFills.swift
//  Drawing
//
//  Created by Nick Semin on 21.03.2022.
//

import SwiftUI

struct BordersAndFills: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 50)
    }
}

struct BordersAndFills_Previews: PreviewProvider {
    static var previews: some View {
        BordersAndFills()
    }
}

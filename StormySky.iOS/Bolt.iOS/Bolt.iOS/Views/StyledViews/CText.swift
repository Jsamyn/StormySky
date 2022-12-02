//
//  SwiftUIView.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 11/16/22.
//

import SwiftUI

struct CText: View {
    var text: String
    
    init(_ text: String){
        self.text = text
    }
    var body: some View {
        Text(text)
            .foregroundColor(Color("PrimaryDark"))
    }
}

struct CText_Previews: PreviewProvider {
    static var previews: some View {
        CText("Hello")
            .previewLayout(.sizeThatFits)
    }
}

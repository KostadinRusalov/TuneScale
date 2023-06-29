//
//  ContentView.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import SwiftUI

// READY AND WORKING
struct GuitarStringsView: View {
    var height: CGFloat
    var body: some View {
        HStack {
            Spacer()
            ForEach(0..<6) { _ in
                Rectangle()
                    .size(width: 5, height: height)
                    .frame(width: 5, height: height)
                    .foregroundColor(Color(UIColor(named: "strings")!))
                Spacer()
            }
        }
        .frame(width: 303)
    }
}

struct GuitarStringsView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarStringsView(height: 400)
            .previewDevice("iPhone 12")
    }
}

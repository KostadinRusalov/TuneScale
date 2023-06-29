//
//  SoundHoleView.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import SwiftUI

// READY AND WORKING
struct SoundHoleView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(UIColor(named: "soundHole")!), lineWidth: 12)
                .frame(width: 350, height: 350)
            Circle()
                .size(width: 303, height: 303)
                .frame(width: 303, height: 303)
                .foregroundColor(Color(UIColor(named: "soundHole")!))
            GuitarStringsView(height: 500)
        }
        .frame(width: 400, height: 500)
        .background(Color(UIColor(named: "background")!))
    }
}

struct SoundHoleView_Previews: PreviewProvider {
    static var previews: some View {
        SoundHoleView()
            .previewLayout(.fixed(width: 400, height: 500))
    }
}

//
//  FretView.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import SwiftUI

// 99% Ready Kinda working
struct FretView: View {
    @State var stop: Stop
    var showNotes: Bool
    @State private var showEditNotes = false
    
    var body: some View {
        ZStack {
            GuitarStringsView(height: 100)
            ZStack {
                ForEach(stop.guitarNotes) { note in
                    ZStack {
                        Circle()
                            .size(width: 45, height: 45)
                            .frame(width: 45, height: 45)
                            .foregroundColor(Color(UIColor(named: "frets")!))
                        Text(typeOf(note))
                            .font(.title2)
                            .foregroundColor(Color(UIColor(named: "text")!))
                    }
                    .offset(x: moveTo(note.guitarString))
                }
            }
        }
    }
    
    func moveTo(_ string: GuitarString) -> CGFloat {
        switch string {
        case .e: return 110
        case .b: return 66
        case .g: return 22
        case .D: return -22
        case .A: return -66
        case .E: return -110
        }
    }
    
    func typeOf(_ note: GuitarNote) ->  String {
        showNotes ? "\(note)" : "\(note.fret)"
    }
    
    func editNotesButton() { showEditNotes = true }
}

struct FretView_Previews: PreviewProvider {
    static var previews: some View {
        FretView(stop: Stop([(.E, 2), (.b, 4)]), showNotes: false)
            .previewLayout(.fixed(width: 303, height: 100))

    }
}

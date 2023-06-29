//
//  GuitarGriffView.swift
//  TuneScale
//
//  Created by Kostadin on 15.06.21.
//

import SwiftUI

struct GriffView: View {
    @State private var showNotes = false
    @State private var editNotes = false
    @State var song: Song
    var griffHeight: CGFloat { CGFloat(song.stops.count * 108 + 200); }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    ZStack(alignment: .bottom) {
                        GuitarStringsView(height: griffHeight)
                        LazyVStack {
                            ForEach(song.stops) { stop in
                                FretView(stop: stop, showNotes: showNotes)
                            }
                            SoundHoleView()
                        }
                    }
                }
                .background(Color(UIColor(named: "background")!))
                .ignoresSafeArea()
                .navigationTitle("\(song.name)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Edit", action: editNotesButton)
                        .popover(isPresented: $editNotes) {
                            EditStopsView(song: song)
                        }
                    }
                }
        }
    }
    
    func showNotesButton() { showNotes = !showNotes }
    func editNotesButton() { editNotes = !editNotes }

    func getGriffHeight() {
        if song.stops.count < 10 {
            return
        }
    }
}

struct GriffView_Previews: PreviewProvider {
    @State static private var song = songs[0]
    static var previews: some View {
        NavigationView {
            GriffView(song: song)
        }
        .previewDevice("iPhone 12")
    }
}

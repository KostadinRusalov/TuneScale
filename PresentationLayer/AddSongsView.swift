//
//  AddSongsView.swift
//  TuneScale
//
//  Created by Kostadin on 16.06.21.
//

import SwiftUI

struct AddSongsView: View {
    @State private var songName = ""
    @State private var guitarString = GuitarString.e
    @State private var fret = 0
    @State private var hasCapo = false
    @State private var capo = 0
    @State private var guitarNotes = [GuitarNote]()
    @State private var stops = [Stop]()
    @State private var createStop = false
    @Binding var songs: [Song]
    var body: some View {
        VStack {
            Spacer()
            GroupBox {
                Button("Add Song", action: addSong)
                TextField("Name", text: $songName)
                VStack {
                    Toggle(isOn: $hasCapo) {
                        Text("Capo")
                    }
                    if hasCapo {
                        Stepper(value: $capo, in: 0...10) {
                            Text("Capo: \(capo)")
                        }
                    }
                }
                
                Spacer()
                HStack {
                    Text("String:")
                    Spacer()
                }
                Picker("String", selection: $guitarString) {
                    Text("e").tag(GuitarString.e)
                    Text("b").tag(GuitarString.b)
                    Text("g").tag(GuitarString.g)
                    Text("D").tag(GuitarString.D)
                    Text("A").tag(GuitarString.A)
                    Text("E").tag(GuitarString.E)
                }
                Stepper(value: $fret, in: 0...21) {
                    Text("Fret: \(fret)")
                }
                Button(action: addNote) {
                    Label(createStop ? "Add stop" : "Add note", systemImage: "plus")
                }
            }
            List {
                ForEach(stops) { stop in
                    Text("String: \(stop.guitarNotes[0].guitarString.description)\t fret: \(stop.guitarNotes[0].fret)")
                }
                .onDelete(perform: removeNotes)
            }
        }
        .padding()
    }
    func addNote() {
        withAnimation {
            stops.append(Stop(guitarString, fret))
            fret = 0
        }
    }
    func removeNotes(at offsets: IndexSet) {
        stops.remove(atOffsets: offsets)
    }
    func addSong() {
        guard !songName.isEmpty else { return }
        songs.append(Song(songName, capo: capo, stops))
    }
}

//struct AddSongsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSongsView(songs: $songs)
//            .previewDevice("iPhone 12")
//    }
//}

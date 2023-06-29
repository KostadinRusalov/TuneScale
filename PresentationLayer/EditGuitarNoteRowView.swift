//
//  EditStopsView.swift
//  TuneScale
//
//  Created by Kostadin on 19.06.21.
//

import SwiftUI

struct EditGuitarNoteRowView: View {
   // @State var guitarString: GuitarString
    // @State var fret: Int
    @State var stop: Stop
    //@Binding var guitarNote: GuitarNote
    @Binding var newStop: Stop
    var body: some View {
        VStack {
            ForEach(stop.guitarNotes.indices) { index in
                HStack {
                    Text("String")
                    Picker(selection: $stop.guitarNotes[index].guitarString, label:
                            Text(".\(stop.guitarNotes[index].guitarString.description)")) {
                        Text("e").tag(GuitarString.e)
                        Text("b").tag(GuitarString.b)
                        Text("g").tag(GuitarString.g)
                        Text("D").tag(GuitarString.D)
                        Text("A").tag(GuitarString.A)
                        Text("E").tag(GuitarString.E)
                    }
                    .pickerStyle(MenuPickerStyle())
                    Stepper(value: $stop.guitarNotes[index].fret , in: 0...21) {
                        Text("fret \(stop.guitarNotes[index].fret)")
                    }
                    Button("Save", action: save)

                }
            }
        }
    .padding()
    }
    
    func save() {
        newStop = stop
    }
}

struct EditGuitarNoteRowView_Previews: PreviewProvider {
    static private var guitarString = GuitarString.A
    static private var fret = 4
    @State static private var guitarNote = GuitarNote(.A, 4)
    @State static private var stop = Stop([(.A, 3), (.b, 3)])
    static var previews: some View {
        EditGuitarNoteRowView(stop: stop, newStop: $stop)
    }
}

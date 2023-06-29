//
//  Stop.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import Foundation

struct Stop: Identifiable {
    var id = UUID()
    var guitarNotes: [GuitarNote]
    var notes: [Note] { getNotes() }
    
    init(_ guitarNotes: [(GuitarString, Int)]) {
        var notes = [GuitarNote]()
        for note in guitarNotes {
            notes.append(GuitarNote(note.0, note.1))
        }
        self.init(notes)
    }
    
    init(_ string: GuitarString, _ fret: Int) {
        self.init([GuitarNote(string, fret)])
    }
    
    init(_ guitarNote: GuitarNote) {
        self.init([guitarNote])
    }
    
    init(_ guitarNotes: [GuitarNote]) {
        self.guitarNotes = guitarNotes
    }
    
    private func getNotes() -> [Note] {
        var notes = [Note]()
        for guitarNote in guitarNotes {
            notes.append(Note(guitarNote.tone, guitarNote.index))
        }
        return notes
    }
}

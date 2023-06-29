//
//  Song.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import Foundation

struct Song: Identifiable {
    var id = UUID()
    var name: String
    var stops: [Stop]
    var notes: [Note] { getNotes() }
    var capo: Int
    
    init(_ name: String, _ stops: [Stop]) {
        self.init(name, capo: 0, stops)
    }

    init(_ name: String, capo: Int, _ stops: [Stop]) {
        self.name = name
        self.capo = capo
        self.stops = stops
    }
    
    private func getNotes() -> [Note] {
        var notes = [Note]()
        if capo == 0 {
            for stop in stops {
                notes += stop.notes
            }
        } else {
            for stop in stops {
                for note in stop.notes {
                    let newToneRawValue = note.tone.rawValue + capo
                    let newTone = Note.Tone(rawValue: newToneRawValue % Note.Tone.count)!
                    let newIndex = newToneRawValue < 12 ? note.index : note.index + 1
                    let newNote = Note(newTone, newIndex)
                    notes.append(newNote)
                }
            }
        }
        return notes
    }
}


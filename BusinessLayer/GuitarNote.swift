//
//  GuitarNote.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import Foundation

class GuitarNote: Note {
    var guitarString: GuitarString
    var fret: Int
    
    static var mute: GuitarNote { GuitarNote(.E, -1) }

    init(_ string: GuitarString, _ fret: Int) {
        self.guitarString = string
        self.fret = fret

        if fret == -1 { super.init(.x, -1) }
        else {
            let toneFret = string.note.tone.rawValue + fret
            let tone = Note.Tone(rawValue: toneFret % Note.Tone.count)!
            let index = toneFret < 12 ? string.note.index : string.note.index + 1
            
            super.init(tone, index)
        }
    }
    
    func getVariations() -> [GuitarNote] { getHigherVariations() + [self] + getLowerVariations() }
    
    private func getHigherVariations() -> [GuitarNote] {
        var higherVariations = [GuitarNote]()
        var note = self
        while let distance = note.guitarString.highDistance {
            let fret = note.fret - distance
            guard fret >= 0 else { break }
            let higherString = GuitarString(rawValue: note.guitarString.rawValue - 1)!
            let variation = GuitarNote(higherString, fret)
            higherVariations.append(variation)
            note = variation
        }
        return higherVariations
    }
    
    private func getLowerVariations() -> [GuitarNote] {
        var lowerVariations = [GuitarNote]()
        var note = self
        while let distance = note.guitarString.lowDistance {
            let fret = distance + note.fret
            guard fret <= 20 else { break }
            let lowerString = GuitarString(rawValue: note.guitarString.rawValue + 1)!
            let variation = GuitarNote(lowerString, fret)
            lowerVariations.append(variation)
            note = variation
        }
        return lowerVariations
    }
}

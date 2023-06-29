//
//  GuitarString.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import Foundation

enum GuitarString: Int, CustomStringConvertible {
    case e = 1, b, g, D, A, E
    
    var note: Note {
        switch self {
        case .e: return Note(.e)
        case .b: return Note(.b, 3)
        case .g: return Note(.g, 3)
        case .D: return Note(.d, 3)
        case .A: return Note(.a, 2)
        case .E: return Note(.e, 2)
        }
    }
    
    var description: String {
        switch self {
        case .e: return "e"
        case .b: return "b"
        case .g: return "g"
        case .D: return "D"
        case .A: return "A"
        case .E: return "E"
        }
    }
    
    var lowDistance: Int? { lowDistance(self) }
    var highDistance: Int? { highDistance(self) }

    private func lowDistance(_ string: GuitarString) -> Int? {
        guard let lowerString = GuitarString(rawValue: string.rawValue + 1) else { return nil }
        let distance = (Note.Tone.count - (lowerString.note.tone.rawValue - string.note.tone.rawValue)) % Note.Tone.count
        return distance
    }
    
    private func highDistance(_ string: GuitarString) -> Int? {
        guard let higherString = GuitarString(rawValue: string.rawValue - 1) else { return nil }
        let distance = (Note.Tone.count - (string.note.tone.rawValue - higherString.note.tone.rawValue)) % Note.Tone.count
        return distance
    }
}

//
//  Note.swift
//  TuneScale
//
//  Created by Kostadin on 13.06.21.
//

import Foundation

class Note: Identifiable, CustomStringConvertible {
    var id = UUID()
    var tone: Tone
    var index: Int
    var description: String { getDescription() }
    
    init(_ tone: Tone, _ index: Int) {
        self.tone = tone
        self.index = tone == .x ? -1 : index
    }
    
    convenience init(_ tone: Tone) {
        self.init(tone, 4)
    }

    private func getDescription() -> String {
        tone == .x ? "X" : "\(tone)\(index)"
    }
    
    enum Tone: Int, CustomStringConvertible {
        case x = -1
        case c, cSharp, d , dSharp, e, f, fSharp, g, gSharp, a, aSharp, b
        
        static var count = 12
        
        var description: String {
            switch self {
            case .x: return "X"
            case .a: return "a"
            case .aSharp: return "a#"
            case .b: return "b"
            case .c: return "c"
            case .cSharp: return "c#"
            case .d: return "d"
            case .dSharp: return "d#"
            case .e: return "e"
            case .f: return "f"
            case .fSharp: return "f#"
            case .g: return "g"
            case .gSharp: return "g#"
            }
        }
    }
}

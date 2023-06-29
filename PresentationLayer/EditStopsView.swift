//
//  EditStopsView.swift
//  TuneScale
//
//  Created by Kostadin on 20.06.21.
//

import SwiftUI

struct EditStopsView: View {
    @State var song: Song
    var body: some View {
        ScrollView {
            ForEach(song.stops.indices) { index in
                EditGuitarNoteRowView(stop: song.stops[index], newStop: $song.stops[index])
            }
        }
    }
}

struct EditStopsView_Previews: PreviewProvider {
    static var previews: some View {
        EditStopsView(song: songs[0])
            .previewDevice("iPhone 12")
    }
}

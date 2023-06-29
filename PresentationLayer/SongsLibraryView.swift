//
//  SongsLibraryView.swift
//  TuneScale
//
//  Created by Kostadin on 15.06.21.
//

import SwiftUI

struct SongsLibraryView: View {
    @State var songs: [Song]
    @State private var showAddSongsView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(songs) { song in
                    NavigationLink( destination: GriffView(song: song)) {
                        VStack(alignment: .leading) {
                            Text(song.name)
                                .font(.headline)
                            Text("\(song.notes.count) notes")
                        }
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("Songs")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button("Add", action: showAddSong)
                        .popover(isPresented: $showAddSongsView) {
                            AddSongsView(songs: $songs)
                        }
                    EditButton()
                }
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        songs.remove(atOffsets: offsets)
    }
    func showAddSong() { showAddSongsView = !showAddSongsView }
}

struct SongsLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        SongsLibraryView(songs: songs)
            .previewDevice("iPhone 12")
    }
}

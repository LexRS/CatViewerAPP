//
//  BreedListView.swift
//  CatAPIProjectApp
//
//  Created by Алексей Поддубный on 28.03.2022.
//

import SwiftUI

struct BreedListView: View {
    var breeds = [Breed]()
    
    @State private var searchText: String = ""
    
    var filteredBreeds: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter { breed in
                breed.name.contains(searchText)
            }
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                }
            }
                .listStyle(PlainListStyle())
                .navigationTitle("Cats are amazing")
                .searchable(text: $searchText)
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}

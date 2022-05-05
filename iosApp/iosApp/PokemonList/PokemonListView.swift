//
//  PokemonListView.swift
//  iosApp
//
//  Created by Daniel Martínez on 3/5/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct PokemonListView: View {
    
    @StateObject private var viewModel: PokemonListViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: PokemonListViewModel(pokemons: Pokemons()))
    }
    
    var body: some View {
        
        NavigationView {
            switch viewModel.state {
            case .success(data: let data):
                List {
                    ForEach(data, id: \.id) { item in Text(item.name)}
                }
                .navigationBarTitle("Pokemons")
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.getPokemons()
        }
        .alert("Error", isPresented: $viewModel.hasError, presenting: viewModel.state) { detail in
            Button("Retry") {
                Task {
                    await viewModel.getPokemons()
                }
            }
            
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

//
//  ContentViewModel.swift
//  iosApp
//
//  Created by Daniel Martínez on 6/4/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared

@MainActor
class ContentViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success(data: [PokemonListModel])
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .na
    @Published var hasError: Bool = false
    
    private let pokemons: Pokemons
    
    init(pokemons: Pokemons) {
        self.pokemons = pokemons
    }

    func getPokemons() async {
        self.state = .loading
        self.hasError = false
        do {
            let pokemons = try await pokemons.getPokemons(number: 20)
            self.state = .success(data: pokemons.toPokemonListModel())
        } catch {
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}

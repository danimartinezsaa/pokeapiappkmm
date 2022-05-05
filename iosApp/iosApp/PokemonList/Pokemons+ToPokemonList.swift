//
//  Pokemons+ToPokemonList.swift
//  iosApp
//
//  Created by Daniel Martínez on 7/4/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared

extension Array where Element: Pokemon {
    func toPokemonListModel() -> [PokemonListModel] {
        self.map { PokemonListModel(name: $0.name, url: $0.url, id: UUID().uuidString) }
    }
}

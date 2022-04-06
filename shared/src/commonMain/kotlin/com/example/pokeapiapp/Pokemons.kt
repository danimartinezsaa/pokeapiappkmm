package com.example.pokeapiapp

import io.ktor.client.*
import io.ktor.client.features.json.*
import io.ktor.client.features.json.serializer.*
import io.ktor.client.request.*
import kotlinx.serialization.Serializable

@Serializable
data class PokemonsDTO(val count: Int, val next: String, val previous: String?, val results: List<Pokemon>)
@Serializable
data class Pokemon(val name: String, val url: String)

class Pokemons {

    private val httpClient = HttpClient() {
        install(JsonFeature) {
            serializer = KotlinxSerializer()
        }
    }

    @Throws(Exception::class)
    suspend fun getPokemons(number: Number): List<Pokemon> {
        val response: PokemonsDTO = httpClient.get("https://pokeapi.co/api/v2/pokemon?limit=$number&offset=0")
        return response.results
    }
}
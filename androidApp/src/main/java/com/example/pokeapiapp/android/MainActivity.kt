package com.example.pokeapiapp.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.pokeapiapp.Pokemon
import com.example.pokeapiapp.Pokemons
import kotlinx.coroutines.*
import java.lang.NullPointerException

class MainActivity : AppCompatActivity() {

    lateinit var recyclerView: RecyclerView

    private val pokemonsAdapter by lazy {
        PokemonsAdapter()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView = findViewById(R.id.pokemonList)
        recyclerView.setHasFixedSize(true)

        val layoutManager = LinearLayoutManager(baseContext)
        recyclerView.layoutManager = layoutManager

        recyclerView.adapter = pokemonsAdapter

        GlobalScope.async {
            withContext(Dispatchers.Main) {
                try {
                    val pokemons = Pokemons().getPokemons(20).map { it.name }.toTypedArray()
                    pokemonsAdapter.setData(pokemons)
                } catch (error: Error) {
                    Log.d("Error: ", "$error")
                }
            }
        }
    }
}

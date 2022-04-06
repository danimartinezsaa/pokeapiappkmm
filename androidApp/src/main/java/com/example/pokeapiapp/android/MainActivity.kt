package com.example.pokeapiapp.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.pokeapiapp.Greeting
import android.widget.TextView
import com.example.pokeapiapp.Pokemon
import com.example.pokeapiapp.Pokemons

fun greet(): String {
    return Greeting().greeting()
}

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val tv: TextView = findViewById(R.id.text_view)
        tv.text = greet()
    }
}

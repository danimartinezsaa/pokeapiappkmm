package com.example.pokeapiapp

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}
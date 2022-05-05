package com.example.pokeapiapp.android

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class PokemonsAdapter(): RecyclerView.Adapter<PokemonsAdapter.ViewHolder>() {

    private var dataSet: Array<String> = emptyArray()

    class ViewHolder(var textView: TextView) : RecyclerView.ViewHolder(textView)

    @SuppressLint("ResourceType")
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val v = LayoutInflater.from(parent.context)
            .inflate(R.layout.pokemon_list_cell, parent, false) as TextView

        return ViewHolder(v)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.textView.text = dataSet[position]
    }

    override fun getItemCount() = dataSet.size

    fun setData(newData: Array<String>) {
        dataSet = newData
        notifyDataSetChanged()
    }
}

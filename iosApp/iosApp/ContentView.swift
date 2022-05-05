import SwiftUI
import shared

struct ContentView: View {
    
    var body: some View {
        TabView {
            PokemonListView()
                .tabItem {
                    Label("Pokemon List", systemImage: "list.dash")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

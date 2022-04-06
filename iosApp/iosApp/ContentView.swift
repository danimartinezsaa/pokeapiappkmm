import SwiftUI
import shared

struct ContentView: View {
    
    @StateObject private var viewModel: ContentViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: ContentViewModel(pokemons: Pokemons()))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

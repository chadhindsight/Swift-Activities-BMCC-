import SwiftUI

struct Pokemon: Identifiable {
    let id: UUID
    let imageName: String
    let name: String
    let hp: Int
    let attackName: String
    let damage: Int
    let attackDescription: String
    let type: String
    let pokemonDescription: String
}

let pokemonData = [
    Pokemon(
        id: UUID(),
        imageName: "Abra",
        name: "Abra",
        hp: 40,
        attackName: "Psyshock",
        damage: 20,
        attackDescription: "Abra releases a small psychic shock at its opponent.",
        type: "Psychic",
        pokemonDescription: "Abra sleeps most of the day and can teleport away when it senses danger."
    ),
    
    Pokemon(
        id: UUID(),
        imageName: "bulbasaur",
        name: "Bulbasaur",
        hp: 60,
        attackName: "Vine Whip",
        damage: 25,
        attackDescription: "Bulbasaur lashes the opponent with slender vines.",
        type: "Grass/Poison",
        pokemonDescription: "A strange seed was planted on its back at birth and grows with it."
    ),
    
    Pokemon(
        id: UUID(),
        imageName: "charmander",
        name: "Charmander",
        hp: 55,
        attackName: "Ember",
        damage: 30,
        attackDescription: "Charmander breathes small flames toward its opponent.",
        type: "Fire",
        pokemonDescription: "The flame on its tail shows the strength of its life force."
    ),
    
    Pokemon(
        id: UUID(),
        imageName: "pidgey",
        name: "Pidgey",
        hp: 50,
        attackName: "Gust",
        damage: 20,
        attackDescription: "Pidgey beats its wings to whip up a gust of wind.",
        type: "Normal/Flying",
        pokemonDescription: "A common sight in forests and woods. It flaps its wings at ground level to kick up sand."
    ),
    
    Pokemon(
        id: UUID(),
        imageName: "Pikachu",
        name: "Pikachu",
        hp: 60,
        attackName: "Thunder Shock",
        damage: 35,
        attackDescription: "Pikachu releases stored electricity from its cheeks.",
        type: "Electric",
        pokemonDescription: "Whenever Pikachu comes across something new, it blasts it with a jolt of electricity."
    ),
    
    Pokemon(
        id: UUID(),
        imageName: "Raichu",
        name: "Raichu",
        hp: 80,
        attackName: "Thunderbolt",
        damage: 50,
        attackDescription: "Raichu unleashes a powerful bolt of electricity.",
        type: "Electric",
        pokemonDescription: "Its long tail serves as a ground to protect itself from its own high voltage power."
    )
]

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            ScrollView{
                ForEach(pokemonData){
                    pokemon in PokemonCard(imageName: pokemon.imageName, name: pokemon.name, hp: pokemon.hp, attackName: pokemon.attackName, damage: pokemon.damage, attackDescription: pokemon.attackDescription, type: pokemon.type, pokemonDescription: pokemon.pokemonDescription)
                        
                }

            }
                        
        }
        .padding()
    }
}



#Preview {
    ContentView()
}

import Foundation

class Pessoa {
    var nome: String
    var veiculo: Carro?
    
    init(nome: String, veiculo: Carro?) {
        self.nome = nome
        self.veiculo = veiculo
        print("\(nome) está sendo inicializado")
    }
    
    deinit {
        print("\(nome) está sendo liberado da memória")
    }
}

class Carro {
    var nome: String
    // precisa ser weak ou unowned para nao criar leaks
    // para testar o leak, retirar o "weak" e deixar apenas "var" para ser uma referência strong
    weak var proprietario: Pessoa?
    
    init(nome: String, proprietario: Pessoa?) {
        self.nome = nome
        self.proprietario = proprietario
        print("\(nome) está sendo inicializado")
    }
    
    deinit {
        print("\(nome) está sendo liberado da memória")
    }
}

do {
    let victor = Pessoa(nome: "Décio", veiculo: nil)
    let fusca = Carro(nome: "Fusca", proprietario: nil)
    
    victor.veiculo = fusca
    fusca.proprietario = victor
}

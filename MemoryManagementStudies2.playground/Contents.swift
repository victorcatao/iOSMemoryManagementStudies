import Foundation

// MARK: - CelestialBody
class CelestialBody {
    var name: String
    
    public init(_ name: String) {
        self.name = name
        print("init name: \(name)")
    }
    
    deinit {
        print("deinit name: \(name)")
    }
}

// MARK: - Star
class Star: CelestialBody {
    var planets: [Planet]
    init(_ name: String, planets: [Planet]) {
        self.planets = planets
        super.init(name)
        self.planets.forEach { $0.system = self }
    }
}

// MARK: - Planet
class Planet: CelestialBody {
    weak var system: Star? // if system isn't declared as weak, leak happens. Must be weak/unowned
}

do {
    let names = ["Mercury", "Venus", "Earth", "Mars", "Jupiter"]
    let planets = names.map(Planet.init)
    let sun = Star("Sun", planets: planets)
    print(sun.name, "is alive!")
}
print("Finish!")

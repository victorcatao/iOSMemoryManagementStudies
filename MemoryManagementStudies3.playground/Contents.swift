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
    var planets: [Planet] = []
}

// MARK: - Planet
class Planet: CelestialBody {
    unowned let system: Star // must be onowned or weak (if optional)
    init(_ name: String, system: Star) {
        self.system = system
        super.init(name)
    }
}

do {
    let sun = Star("Sun")
    let earth = Planet("Earth", system: sun) // CIRCULAR REFERENCE
    sun.planets.append(earth)
    print(sun.name, "is alive!")
}
print("Finish!")

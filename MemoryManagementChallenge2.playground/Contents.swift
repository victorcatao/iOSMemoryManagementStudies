import Foundation

// MARK: - WWDCGreeting
class WWDCGreeting {
    let who: String
    init(who: String) {
        self.who = who
    }
    
    deinit {
        print("\(who) went away")
    }
    
    lazy var greetingMarker: () -> String = { [weak self] in
        guard let self = self else {
            return "Ops, weak self is nil"
        }
        return "Hello \(self.who)"
    }
}

// MARK: - Studies
do {
    let me = WWDCGreeting(who: "Victor")
    print(me.greetingMarker())
}
print("Finish!")

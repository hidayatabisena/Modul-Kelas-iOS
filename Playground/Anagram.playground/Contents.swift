import UIKit

func isAnagram(_ s: String, _ t: String) -> Bool {
    let lowercaseS = s.lowercased()
    let lowercaseT = t.lowercased()
    
    let cortageOfS = lowercaseS.map { ($0, 1)}
    let cortageOfT = lowercaseT.map { ($0, 1)}
    
    let setOfS = Dictionary(cortageOfS) { key, char in key + 1 }
    let setOfT = Dictionary(cortageOfT) { key, char in key + 1 }
    return setOfS == setOfT
}

isAnagram("Supermassive Black Hole", "Bulkier Chasmovers Ale")

// shorter version
func isAnagramShorterVersion(_ s: String, _ t: String) -> Bool {
    let lowercaseS = s.lowercased()
    let lowercaseT = t.lowercased()
    
    let leftS = Dictionary(grouping: lowercaseS, by: { $0 })
        .mapValues { $0.count }
    let rightT = Dictionary(grouping: lowercaseT, by: { $0 }).mapValues { $0.count }
    
    return leftS == rightT
}

print(isAnagramShorterVersion("Supermassive Black Hole", "Bulkier Chassmoves Pale"))


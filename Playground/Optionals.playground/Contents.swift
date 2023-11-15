import UIKit

//var name: String? = "Wendy Red Velvet"
//
//let message = name != nil ? "Nilai name tidak nil dan nilainya adalah \(name ?? "")" : "Nilai name adalah nil"
//
//print(message)

var name: String?

let message = "Nilai name " + (name ?? "adalah nil")

print(message)


//if let unwrappedName = name {
//    print("Nilai tidak nil dan nilainya adalah \(unwrappedName)")
//} else {
//    print("Nilai adalah nil")
//}


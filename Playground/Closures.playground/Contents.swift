import UIKit

// Closures are self-contained blocks of functionality that can be passed around and used in your code
struct Country {
    let name: String
    let population: Int
}

let countries = [
    Country(name: "Somalia", population: 91),
    Country(name: "Peru", population: 95),
    Country(name: "India", population: 85),
    Country(name: "Singapore", population: 38),
    Country(name: "Swiss", population: 42),
    Country(name: "Kanada", population: 35),
    Country(name: "Indonesia", population: 240)
]

var topCountryPopulationFilter: (Country) -> Bool = { country in
    return country.population > 80
}

let topCountryPopulation = countries.filter(topCountryPopulationFilter)

for topCountry in topCountryPopulation {
    print(topCountry.name)
}

// Trailing Closure Syntax
let topCountryPopulation2 = countries.filter { country in
    return country.population > 70
}

// shorthand looks nice and clean
let topCountryPopulation3 = countries.filter { $0.population > 90 }
let topCountryRanking = topCountryPopulation3.sorted { $0.population > $1.population }

// escaping -> penjelasan komprehensif https://www.codingem.com/escaping-in-swift/

/*
func login(request: LoginRequest, completion: @escaping (Result<AccessToken, Error>) -> Void) {
    let fullUrl = "\(BASE_URL)/api/v1/auth/login"
    sessionManager.request(fullUrl, method: .post, parameters: request)
        .validate()
        .responseDecodable(of: AccessToken.self) { response in
            switch response.result {
            case .success(let accessToken):
                completion(.success(accessToken))
            case .failure(let error):
                completion(.failure(error))
            }
        }
}
*/

import UIKit

// Array
// ordered list
var myFavoriteMovies = ["Batman","The Equalizer","Taken",5,true] as [Any]

// as -> casting
// any -> any object

//index
myFavoriteMovies[0]
myFavoriteMovies[1]
myFavoriteMovies[2]
myFavoriteMovies[3]
myFavoriteMovies[4]


var myStringArray = ["Test6","Test2","Test1","Test4"]

myStringArray[0].uppercased()

myStringArray.count

myStringArray[myStringArray.count - 2]

myStringArray.last

myStringArray.sort()


var myNumberArray = [1,2,3,4,5,6,7,1,2,3]
myNumberArray.append(8)
myNumberArray.last

myNumberArray[0] = 15
myNumberArray[0]

//Set
// Unordered collection, unique elements, didn't have index, don't have duplicate values
var mySet: Set = [1,2,3,4,5,1,2]
var myStringSet: Set = ["a","b","c","a"]

var myInternetArray = [1,2,3,1,2,5,6,2,1]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

var mySet1: Set = [1,2,3]
var mySet2: Set = [3,4,5]

var mySet3 = mySet1.union(mySet2)
print(mySet3)

// Dictionary
// key-value pairing
var myFavoriteDirectors = [
    "Kill Bill" : "Quentin Tarantino",
    "Avatar" : "James Cameron",
    "The Dark Knight": "Christopher Nolan"
]

myFavoriteDirectors["Kill Bill"]
myFavoriteDirectors["The Dark Knight"]

myFavoriteDirectors["Kill Bill"] = "Quentin Tarantino"

myFavoriteDirectors["Seven Samurai"] = "Akira Kurisowa"
print(myFavoriteDirectors)

var myDictionary = ["Run" : 100, "Swim" : 200, "Basketball" : 300]
myDictionary["Run"]








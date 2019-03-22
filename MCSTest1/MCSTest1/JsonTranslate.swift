import UIKit

func stuff(){//Declared function that is suposed to complete ritual of connecting JSON to 
let exampleJSONFileURL = Bundle.main.url(forResource: "got", withExtension: "json")!
let jsonObject = Decodable.Decode
print(jsonObject)
let dictionaryJSON = jsonObject as! [String: Any]
}

struct episodes: Codable {
    let name: String
    let season: String
    let number: String
}


struct Embeded: Codable {
    let episodes: [String]
}

let gotJSONFileURL = Bundle.main.url(forResource: "got", withExtension: "json")!
let jsonGotData = try! Data(contentsOf: gotJSONFileURL)


func stuff()//I tried to declare top data in function :/
struct Got: Decodable {
    let _embeded: String
}

let decodedGot = try? JSONDecoder().decode(Got.self, from: jsonGotData)
print(decodedGot as Any)



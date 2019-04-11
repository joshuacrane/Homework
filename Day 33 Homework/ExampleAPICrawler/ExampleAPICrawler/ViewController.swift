//
//  ViewController.swift
//  ExampleAPICrawler
//
//  Created by Joshua Crane on 4/10/19.
//  Copyright © 2019 Joshua Crane. All rights reserved.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!// Declares Table View in ViewController
    
    var baseUrl: String? = "https://pokeapi.co/api/v2"// Connects ViewController to PokeAPI
    var initialDictionary = [String: Any]() {//Declares Dictionary as a potantial type of API
        didSet {
            self.useDictionary = true
        }
    }
    var initialArray = [Any]() {//Declares Array as a potantial type of API
        didSet {
            self.useDictionary = false
        }
    }
    var useDictionary = false//Sets Dictionary as false for above argument
    var dictionaryKeys: [String] {
        return initialDictionary.keys.sorted(by: <)
    }
    
    override func viewDidLoad() {//Runs when code is first Activated and only runs once
        super.viewDidLoad()
        
        tableView.dataSource = self//sets data source extension as self (Bellow)
        tableView.delegate = self//sets delegate extension as self (Bellow)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")//Declares Cells?
        guard let unwrappedUrlString = baseUrl,
            let unwrappedUrl = URL(string: unwrappedUrlString) else {
                return }
        URLSession.shared.dataTask(with: unwrappedUrl) { (data, _, _) in// What is URL Session?
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with:// Changes code from JSON                                                           to Swift
                    data, options: []) else {return}
            if let jsonArray = jsonObject as? [Any] {
                self.initialArray = jsonArray
            } else if let jsonDictionary = jsonObject as? [String: Any] {
                self.initialDictionary = jsonDictionary
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()//Re-activates URLSession because on default it is Paused
    }
}

extension ViewController: UITableViewDataSource {// Manages Data?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard useDictionary else {return initialArray.count}
        return initialDictionary.count  //return 0 Default Value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
    if self.useDictionary {
        let key = dictionaryKeys[indexPath.row]
        cell.textLabel?.text = key
        //1. string, arrays, dictionaries, numbers, booleans, null
        //Dictionary types above
        
        let value = initialDictionary[key]
        let stringToShow: String
        if let stringValue = value as? String {
            stringToShow = stringValue
        } else if let intValue = value as? Int {
            stringToShow = String(intValue)
        } else if value is NSNull {
            stringToShow = "no value"
        } else if let arrayValue = value as? [Any] {
            stringToShow = "Elements in the Array: \(arrayValue.count)"
        }else if let dictionaryValue = value as? [String: Any] {
            stringToShow = "Elements in the Dictionary: \(dictionaryValue)"
        }else if let boolValue = value as? Bool {
            stringToShow = String(boolValue)
        } else {
            stringToShow = "Invalid Json"
        }
        cell.detailTextLabel?.text = stringToShow
    } else {
        //Array types String and Array?
        if let stringValue = initialArray[indexPath.row] as?
            String {
                cell.textLabel?.text = stringValue
        } else {
                cell.textLabel?.text = "Array element at index \(indexPath.row)"
        }
    }
        return cell
    }
}

extension ViewController: UITableViewDelegate {//Manages Data as Cells Change?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if useDictionary {//Dictionary types Dictionary only?
            if let tappedUrl = initialDictionary[dictionaryKeys[indexPath.row]] as? String {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                if tappedUrl.contains("https://") {
                
                vc.baseUrl = tappedUrl
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                } else { return }
            } else if let tappedArray = initialDictionary[dictionaryKeys[indexPath.row]] as? [Any] {//Dictionary?
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.baseUrl = nil
                vc.initialArray = tappedArray
                self.navigationController?.pushViewController(vc, animated: true)
            } else if let tappedDictionary = initialDictionary[dictionaryKeys[indexPath.row]] as? [String: Any] {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.baseUrl = nil
                vc.initialDictionary = tappedDictionary
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {//Array types Array, Array2, and Dictionary... weird.... String Need to be Declared?
            let value = initialArray[indexPath.row]//Array?
            if let stringValue = value as? String {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.baseUrl = stringValue//string...
                self.navigationController?.pushViewController(vc, animated: true)
            } else if let arrayValue = value as? [Any] {//Also Array?
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.baseUrl = nil
                vc.initialArray = arrayValue//array...
                self.navigationController?.pushViewController(vc, animated: true)
            } else if let dictionaryValue = value as? [String: Any] {//Dictionary?
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.baseUrl = nil
                vc.initialDictionary = dictionaryValue//dictionary...
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}



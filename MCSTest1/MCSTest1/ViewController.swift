//
//  ViewController.swift
//  MCSTest1
//
//  Created by Joshua Crane on 3/22/19.
//  Copyright © 2019 Joshua Crane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var season: UILabel!
    
    @IBOutlet var tableView: UITableView!

//Potential Answer to problem?

  /*  var dataSource: [TestModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dataSource = getJSON()
        
    }
    
    func getJSON() -> [TestModel] {
        let url = Bundle.main.url(forResource: "test", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let objects = try! JSONDecoder().decode(TestModel.self, from: data)
        return [objects]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataSource[indexPath.row].key
        return cell!
    }
    
}*/



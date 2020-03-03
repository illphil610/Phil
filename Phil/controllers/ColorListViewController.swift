//
//  ColorListViewController.swift
//  Phil
//
//  Created by Phil Cappelli on 3/3/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController {
    
    @IBOutlet weak var colorTableView: UITableView! {
        didSet {
            colorTableView.delegate = self
            colorTableView.dataSource = self
            colorTableView.register(
                UITableViewCell.self, forCellReuseIdentifier: "cell"
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let index = colorTableView.indexPathForSelectedRow else { return }
        
        colorTableView.deselectRow(at: index, animated: true)
    }

}

extension ColorListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Color.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = Color.allValues[indexPath.row].rawValue
        cell.textLabel?.textColor = Color(rawValue: Color.allValues[indexPath.row].rawValue)?.create
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(
            ColorViewController(with: Color.allValues[indexPath.row].rawValue), animated: true
        )
    }
    
}

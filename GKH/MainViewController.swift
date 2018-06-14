//
//  ViewController.swift
//  GKH
//
//  Created by Максим Годовиков on 09/06/2018.
//  Copyright © 2018 mGodovikov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let NIB_CLIENT = UINib(nibName: "CellClient", bundle: nil)
    private let IDENTIFIER_CLIENT = "IDENTIFIER_CLIENT"
    
    @IBOutlet weak var tableView: UITableView!
    private var tarif = Tarif()
    private let clients = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 10
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NIB_CLIENT, forCellReuseIdentifier: IDENTIFIER_CLIENT)
    }
}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "client"{
            let clientViewController = segue.destination as! ClientViewController
            clientViewController.addClient = {(newClient) -> Void in
                self.clients.add(newClient)
                self.tableView.reloadData()
            }
            
        } else if segue.identifier == "tarif"{
            let tarifViewController = segue.destination as! TarifViewController
            tarifViewController.tarif = self.tarif
            tarifViewController.update = {(newTarif) -> Void in
                self.tarif = newTarif
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let client = clients[indexPath.row] as! ClientData
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_CLIENT, for: indexPath) as! CellClient
        cell.setClientMoney(clientMoney: ClientMoney(clientData: client, tarif: tarif))
        return cell
    }
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



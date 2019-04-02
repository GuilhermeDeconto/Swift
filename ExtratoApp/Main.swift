//
//  Main.swift
//  ExtratoApp
//
//  Created by Guilherme Deconto on 4/2/19.
//  Copyright © 2019 Guilherme Deconto. All rights reserved.
//

import UIKit

class Main: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var available: UILabel!
    @IBOutlet weak var limit: UILabel!
    @IBOutlet weak var used: UILabel!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var index: IndexPath?
    var modelData: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Extratos"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadData()
        
    }
    
    func loadData(){
        if modelData != nil {
            user_name?.text = modelData?.name
            available?.text = modelData?.limits.available
            limit?.text = modelData?.limits.total
            used?.text = modelData?.limits.expent
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if let data = self.modelData {
                return data.installments_due.count
            }
        }
        else {
            if let data = self.modelData {
                return data.installments_overdue.count
            }
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tbCell", for: indexPath) as? Cell else {return UITableViewCell.init()}
        var installment = Model.Installments()
        if indexPath.section == 0 {
            installment = (self.modelData?.installments_due[indexPath.row])!
        } else {
            installment = (self.modelData?.installments_overdue[indexPath.row])!
        }
        cell.lbDate.text = installment.past_due
        cell.lbCarnet.text = installment.carnet
        cell.lbInstallment.text = installment.installment
        cell.lbTotalValue.text = installment.value
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath
        
        var installment = Model.Installments()
        if indexPath.section == 0 {
            installment = (self.modelData?.installments_due[indexPath.row])!
        } else {
            installment = (self.modelData?.installments_overdue[indexPath.row])!
        }
        sendAlert(m: installment.detail.toString())
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func sendAlert(m: String?){
        let alert = UIAlertController(title: "Atenção", message: m, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

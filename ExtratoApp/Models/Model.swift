//
//  model.swift
//  ExtratoApp
//
//  Created by Guilherme Deconto on 4/1/19.
//  Copyright © 2019 Guilherme Deconto. All rights reserved.
//
import Foundation
import ObjectMapper

class Model: NSObject, Mappable {
    
    var name: String = ""
    var total_overdue: String = ""
    var total_due: String = ""
    var installments_due: [Installments] = []
    var installments_overdue: [Installments] = []
    var limits: Limits = Limits()
    
    override init() {
        
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        total_overdue <- map["total_overdue"]
        total_due <- map["total_due"]
        installments_due <- map["installments_due"]
        installments_overdue <- map["insModelents_overdue"]
        limits <- map["limits"]
    }
    
    class Limits: NSObject, Mappable{
        var total_due: String = ""
        var total: String = ""
        var expent: String = ""
        var available: String = ""
        
        override init() {
            
        }
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            total_due <- map["total_due"]
            total <- map["total"]
            expent <- map["expent"]
            available <- map["available"]
        }
        
    }
    
    class Installments: NSObject, Mappable {
        var past_due: String = ""
        var carnet: String = ""
        var installment: String = ""
        var value: String = ""
        var detail: Detail = Detail()
        
        override init() {
            
        }
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            past_due <- map["past_due"]
            carnet <- map["carnet"]
            installment <- map["installment"]
            value <- map["value"]
            detail <- map["detail"]
        }
        
        class Detail: NSObject, Mappable{
            var overdue_days: String = ""
            var overdue_date: String = ""
            var original_value: String = ""
            var value_diff: String = ""
            var total_value: String = ""
            var store: String = ""
            
            override init() {
                
            }
            
            required init?(map: Map) {
                
            }
            
            func mapping(map: Map) {
                overdue_days <- map["overdue_days"]
                overdue_date <- map["overdue_date"]
                original_value <- map["original_value"]
                value_diff <- map["value_diff"]
                total_value <- map["total_value"]
                store <- map["store"]
            }
            
            func toString() -> String{
                return "Valor Original: "+original_value+"\nData de atraso: "+overdue_date+"\nDias atrasados: "+overdue_days+"\nLoja: "+store+"\nTotal: "+total_value
            }
        }
    }
    
    
}

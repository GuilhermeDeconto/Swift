//
//  Service.swift
//  ExtratoApp
//
//  Created by Guilherme Deconto on 4/1/19.
//  Copyright © 2019 Guilherme Deconto. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class Service{
    static var Url: String = "https://www.icoded.com.br/api/extract.json"

    class func getData(_ pwd: String, success : @escaping(_ model : Model) -> Void, failure : @escaping(_ error : String) -> Void) {

        
        Url = Url+"?pwd="+pwd
            Alamofire.request(Url)
                .responseJSON { (body) in
                    if(body.response?.statusCode == 200){
                        guard let result = body.result.value! as? [String: Any], let json = result["data"] as? [String: Any] else {
                            failure("Erro ao logar")
                            return
                        }
                        
                        guard let model = Mapper<Model>().map(JSON: ((json as? [String: Any])!)) else {
                            failure("Error")
                            return
                        }
                        
                        //guard let data = model else {return}
                        
                        success(model)
                    }else{
                        failure ("Senha incorreta")
                        return
                    }
            }
        
   }
}


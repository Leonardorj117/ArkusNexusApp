//
//  RequestModel.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import Foundation

struct RequestModel{
    
    var baseUrl:URLBase = .mocky
    var httpMethod:HTTPMethod = .GET
    
    func getURL() -> String{
        return self.baseUrl.rawValue
    }
    
    enum HTTPMethod:String{
        case GET
        case POST
        case DELETE
    }
    
    
    enum URLBase:String{
        case mocky = "https://www.mocky.io/v2/5bf3ce193100008900619966"
        case empty = ""
    }
}

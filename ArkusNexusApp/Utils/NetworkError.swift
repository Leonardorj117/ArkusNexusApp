//
//  NetworkError.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import Foundation

enum NetworkError:String,Error{
    case invalidURL
    case serializationFailed
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "ocurrio un error al tratar de consultar el Api:"
    case jsonDecoder = "Error al intentar extraer datos del json"
    case generic
}

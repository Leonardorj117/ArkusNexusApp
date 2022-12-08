//
//  PlaceDataModel.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import Foundation

struct PlaceDataModel:Decodable{
    let PlaceId:String?
    let PlaceName:String?
    let Address:String?
    let Category:String?
    let IsOpenNow:String?
    let Latitude:Double?
    let Longitude:Double?
    let Thumbnail:String?
    let Rating:Float?
    let IsPetFriendly:Bool?
    let AddressLine1:String?
    let AddressLine2:String?
    let PhoneNumber:String?
    let Site:String?
}

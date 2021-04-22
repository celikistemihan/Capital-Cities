//
//  Capital.swift
//  Project16
//
//  Created by İstemihan Çelik on 8.04.2021.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    //Project:16 Challenge:3
    var wikiInfo: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, wikiInfo: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        //Project:16 Challenge:3
        self.wikiInfo = wikiInfo
    }
}

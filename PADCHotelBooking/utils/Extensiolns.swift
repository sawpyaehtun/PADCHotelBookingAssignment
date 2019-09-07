//
//  Extensiolns.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 05/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    struct MyTheme {
        static var purple: UIColor  { return UIColor(named: "mainThemePurple")! }
        static var lightGray: UIColor  { return UIColor(named: "lightGray")! }
    }
    
}

extension UITableView {
    func registerForCell(strID : String) {
        register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
    }
}


extension UICollectionView {
    func registerForCell(strID : String) {
        register(UINib(nibName: strID, bundle: nil), forCellWithReuseIdentifier: strID)
    }
}

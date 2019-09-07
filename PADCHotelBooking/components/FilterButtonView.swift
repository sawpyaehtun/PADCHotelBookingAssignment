//
//  FilterButtonView.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import UIKit

class FilterButtonView: CardView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height / 2
    }
}

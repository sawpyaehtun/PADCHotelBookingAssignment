//
//  SearchDataView.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class SearchDataView: UIView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var imgNavigation: UIImageView!
    
    var id : Int?
    var dataArray : [String] = []
    var multipleDataArray : [Any] = []
    var selectedIndex = -1
    var multipleStringSelectedIndex = [-1,-1,-1,-1]
    var pickerTitle = ""
    var minimumDate: Date?
    var maximumDate: Date?
    @IBInspectable var selectedDate: Date?
    @IBInspectable var datePickerMode: UIDatePicker.Mode = .date
    
    @IBInspectable var labelTitle : String = "lbl Title" {
        didSet{
            lblTitle.text = labelTitle
        }
    }
    
    @IBInspectable var labelValue : String = "lbl Title" {
        didSet{
            lblValue.text = labelValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    func commonInitialization() {
        let view = Bundle.main.loadNibNamed(String(describing: SearchDataView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
        let tapGestureRecongniser = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecongniser)
        self.imgNavigation.isHidden = true
    }
    
    @objc func didTap(){
        switch id {
        case 0:
            pickerTitle = "Location"
            dataArray = ["Dhaka","Yangon","Mandalay","London"]
            self.showNormalPicker()
        case 1:
            pickerTitle = "Check In"
            showDatePicker()
        case 2:
            pickerTitle = "Check Out"
            showDatePicker()
        case 3:
            pickerTitle = "Count"
            multipleDataArray = [["00","01","02","03","04","05","06","07","08","09","10"],["Adults"],["00","01","02","03","04","05","06","07","08","09","10"],["Child"]]
            showCountPicker()
        case 4:
            pickerTitle = "Rooms"
            dataArray = ["01","02","03","04","05","06","07","08","09","10"]
            self.showNormalPicker()
        default:
            pickerTitle = ""
        }
    }
    
    private func showDatePicker(){
        ActionSheetPickerWireframe.showDatePicker(pickerTitle, selectedDate: selectedDate ?? Date(), minimumDate: minimumDate, maximumDate: maximumDate, datePickerMode: datePickerMode, doneBlock: { (picker, date, origin) in
            self.selectedDate = date as? Date ?? self.selectedDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM, yyyy"
            let selectedDate = date as! Date
            self.lblValue.text = dateFormatter.string(from: selectedDate)
            
            self.superview?.endEditing(true)
        }, sender: self)
    }
    
    private func showNormalPicker(){
        ActionSheetPickerWireframe.showPicker(pickerTitle, displayDataArray: dataArray, initialSelection: selectedIndex > 0 ? selectedIndex : 0, doneBlock: { (picker, index, string) in
            if index < self.dataArray.count {
                self.lblValue.text = self.dataArray[index]
            } else {
                self.lblValue.text = string as? String ?? ""
            }
            self.selectedIndex = index
            self.endEditing(true)
        }, sender: self)
    }
    
    private func showCountPicker(){
        ActionSheetPickerWireframe.showMyMultipleStringPicker(pickerTitle, displayDataArray: multipleDataArray, initialSelection: multipleStringSelectedIndex[0] > 0 ? multipleStringSelectedIndex : [0,0,0,0], doneBlock: { (picker, indexArray, valueArray) in
            let firstIndex = indexArray![0] as! Int
            let secondIndex = indexArray![1] as! Int
            let thirdIndex = indexArray![2] as! Int
            let fourthIndex = indexArray![3] as! Int
            
            let adultNumberArray = self.multipleDataArray[0] as! [String]
            let adultUnitArray = self.multipleDataArray[1] as! [String]
            let childNumberArray = self.multipleDataArray[2] as! [String]
            let childUnitArray = self.multipleDataArray[3] as! [String]
            
            let values = valueArray as! [String]
            
            if firstIndex < adultNumberArray.count && secondIndex < adultUnitArray.count && thirdIndex < childNumberArray.count && fourthIndex < childUnitArray.count {
                let numberOfadult = Int(values[0]) == 0 ? "" : "\(values[0]) \(values[1])"
                let numberOfChild = Int(values[2]) == 0 ? "" : "\(values[2]) \(values[3])"
                self.lblValue.text = "\(numberOfadult) \(numberOfChild)"
            }
            
            self.multipleStringSelectedIndex = indexArray as! [Int]
            self.endEditing(true)
        }, sender: self)
    }
}

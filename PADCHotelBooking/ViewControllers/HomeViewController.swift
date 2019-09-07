//
//  ViewController.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 04/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var categoryViewNearBy: CategoryView!
    @IBOutlet weak var categoryViewPopular: CategoryView!
    @IBOutlet weak var categoryViewAll: CategoryView!
    @IBOutlet weak var hotelTableView: UITableView!
    @IBOutlet weak var viewLocationPicker: UIView!
    @IBOutlet weak var lblLocation: UILabel!
    
    let locationDataArray = ["Dhaka","Yangon","Mandalay","London"]
    var selectedIndex: Int = -1
    
    var allCategoriesVeiw : [CategoryView]!
    var hotelImage = #imageLiteral(resourceName: "hotelone")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
        
    }

    private func setUpUIs(){
        setUpProfileImage()
        setUpCategoriesBar()
        setUpTableView()
        setUpLocationPicker()
    }
    
    private func setUpLocationPicker(){
        viewLocationPicker.isUserInteractionEnabled = true
        let tapGestureRecongniser = UITapGestureRecognizer(target: self, action: #selector(didTapViewLocaitionPicker))
        viewLocationPicker.addGestureRecognizer(tapGestureRecongniser)
    }
    
    private func setUpTableView(){
        hotelTableView.delegate  = self
        hotelTableView.dataSource = self
        hotelTableView.registerForCell(strID: String(describing: HotelTableViewCell.self))
        hotelTableView.separatorStyle = .none
    }
    
    private func setUpProfileImage(){
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
    }
    
    private func setUpCategoriesBar(){
        allCategoriesVeiw = [categoryViewNearBy,categoryViewPopular,categoryViewAll]
        
        for i in 0 ..< allCategoriesVeiw.count{
            let categoryView = allCategoriesVeiw[i]
            categoryView.id = i
            
            let tapGestureRecongniser = UITapGestureRecognizer(target: self, action:
                #selector(didSelectedCategoryView(sender:)))
            categoryView.isUserInteractionEnabled = true
            categoryView.addGestureRecognizer(tapGestureRecongniser)
            
            switch i {
                case 0 :
                    categoryView.lblCategory.text = "Near By"
                    categoryView.didSelectedOrNot(isSelected: true)
                case 1 :
                    categoryView.lblCategory.text = "Popular"
                    categoryView.didSelectedOrNot(isSelected: false)
                case 2 :
                    categoryView.lblCategory.text = "All"
                    categoryView.didSelectedOrNot(isSelected: false)
                default :
                    break
            }
        }
    }
    
    private func reloadData(id : Int){
        switch id {
        case 0 :
            hotelImage = #imageLiteral(resourceName: "hotelone")
        case 1 :
           hotelImage = #imageLiteral(resourceName: "hotelThree")
        case 2 :
            hotelImage = #imageLiteral(resourceName: "hotelTwo")
        default :
            break
        }
        
        hotelTableView.reloadData()
    }
    
    @objc func didSelectedCategoryView(sender : UITapGestureRecognizer){
        let categoryViiew = sender.view as! CategoryView
        let id = categoryViiew.id
        reloadData(id: id!)
        allCategoriesVeiw.forEach { cv in
            if cv.id == id {
                cv.didSelectedOrNot(isSelected: true)
            } else {
                cv.didSelectedOrNot(isSelected: false)
            }
        }
    }
    
    @objc func didTapViewLocaitionPicker(){
        
        let pickerTitle = "Location"
        
        ActionSheetPickerWireframe.showPicker(pickerTitle, displayDataArray: locationDataArray, initialSelection: selectedIndex > 0 ? selectedIndex : 0, doneBlock: { (picker, index, string) in
            if index < self.locationDataArray.count {
                self.lblLocation.text = self.locationDataArray[index]
            } else {
                self.lblLocation.text = string as? String ?? ""
            }
            self.selectedIndex = index
            self.view.endEditing(true)
        }, sender: lblLocation)
    }

}

extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HotelTableViewCell.self), for: indexPath) as! HotelTableViewCell
        cell.hotelImage = hotelImage
        return cell
    }
    
    
}

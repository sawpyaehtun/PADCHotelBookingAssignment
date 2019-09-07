//
//  SearchViewController.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 04/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import FittedSheets

class SearchViewController: UIViewController {

    @IBOutlet weak var viewFilter: FilterButtonView!
    @IBOutlet weak var hotelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
    }
    
    private func setUpUIs(){
        setUpFilterBtnView()
        setUpTableView()
    }
    
    private func setUpTableView(){
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        hotelTableView.registerForCell(strID: String(describing: FilterTableViewCell.self))
        hotelTableView.registerForCell(strID: String(describing: ForCollectionViewTableViewCell.self))
        hotelTableView.separatorStyle = .none
    }
    
    private func setUpFilterBtnView(){
        viewFilter.layer.cornerRadius = viewFilter.frame.height / 2
        let tapGestureRecongniser = UITapGestureRecognizer(target: self, action: #selector(didTapBtnFilterView))
        viewFilter.isUserInteractionEnabled = true
        viewFilter.addGestureRecognizer(tapGestureRecongniser)
    }
    
    @objc func didTapBtnFilterView(){
        let controller = FilterBottomSheetViewController.init()
        let sheetController = SheetViewController(controller: controller, sizes: [SheetSize.fixed(640)])
        sheetController.overlayColor = UIColor.white.withAlphaComponent(0.7)
        sheetController.topCornersRadius = 15
        self.present(sheetController, animated: false, completion: nil)
    }
    
}

extension SearchViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FilterTableViewCell.self), for: indexPath) as! FilterTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ForCollectionViewTableViewCell.self), for: indexPath) as! ForCollectionViewTableViewCell
            cell.title = "TOP SEARCHES"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ForCollectionViewTableViewCell.self), for: indexPath) as! ForCollectionViewTableViewCell
            cell.title = "RECENT SEARCHES"
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

extension SearchViewController : UITableViewDelegate{
    
}

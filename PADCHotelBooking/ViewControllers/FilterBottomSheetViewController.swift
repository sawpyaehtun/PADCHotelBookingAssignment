//
//  FilterBottomSheetViewController.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 04/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class FilterBottomSheetViewController: UIViewController {
    
    @IBOutlet weak var ratingViewNone: RatingView!
    @IBOutlet weak var ratingViewOne: RatingView!
    @IBOutlet weak var ratingViewTwo: RatingView!
    @IBOutlet weak var ratingViewThree: RatingView!
    @IBOutlet weak var ratingViewFour: RatingView!
    @IBOutlet weak var ratingViewFive: RatingView!
    @IBOutlet weak var imgDownArrow: UIImageView!
    @IBOutlet weak var viewWithDoubleControlSlider: UIView!
    @IBOutlet weak var viewSorting: CardView!
    @IBOutlet weak var lblSortingTitle: UILabel!
    @IBOutlet weak var lblSortingValue: UILabel!
    
    var allRatingVeiw : [RatingView]!
    var sorting = ["Price":"$$<$$$","Rating":"1 Star < 5 Stars"]
    var sortingTitles : [String] {
        return sorting.keys.sorted()
    }
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpUI()
    }
    
    private func setUpUI() {
        setUpRatingViewUI()
        setUpDoubleControlSlider()
        setUpSortingPicker()
    }
    
    private func setUpSortingPicker(){
        let tapGestureRecogniser  = UITapGestureRecognizer(target: self, action: #selector(didTapSortingPicker))
        viewSorting.isUserInteractionEnabled = true
        viewSorting.addGestureRecognizer(tapGestureRecogniser)
    }
    
    private func  setUpDoubleControlSlider(){
        let rangeSlider = RangeSlider(frame: .zero)
        viewWithDoubleControlSlider.addSubview(rangeSlider)
        let margin: CGFloat = 20
        let width = viewWithDoubleControlSlider.bounds.width - 2 * margin
        let height: CGFloat = 10
        rangeSlider.frame = CGRect(x: 0, y: 0,
                                   width: width, height: height)
        rangeSlider.center = CGPoint(x: viewWithDoubleControlSlider.frame.size.width  / 2,
                                     y: viewWithDoubleControlSlider.frame.size.height / 2)
    }
    
    private func setUpRatingViewUI(){
        allRatingVeiw = [ratingViewNone,ratingViewOne,ratingViewTwo,ratingViewThree,ratingViewFour,ratingViewFive]
        
        for i in 0 ..< allRatingVeiw.count{
            
            let ratingView = allRatingVeiw[i]
            ratingView.id = i
            if i == 0 {
                ratingView.lblNumber.text = "NONE"
                ratingView.imgStar.isHidden = true
            } else {
                ratingView.lblNumber.text = String(i)
            }
            
            ratingView.isUserInteractionEnabled = true
            let tapGestureRecongniser = UITapGestureRecognizer(target: self, action:
                #selector(didSelectedRatingView(sender:)))
            ratingView.addGestureRecognizer(tapGestureRecongniser)
        }
    }
    
    @objc func didTapSortingPicker(){
        
        let pickerTitle = "Sorted By"
        
        ActionSheetPickerWireframe.showPicker(pickerTitle, displayDataArray: sortingTitles, initialSelection: selectedIndex > 0 ? selectedIndex : 0, doneBlock: { (picker, index, string) in
            if index < self.sortingTitles.count {
                self.lblSortingTitle.text = self.self.sortingTitles[index]
                self.lblSortingValue.text = self.sorting[self.sortingTitles[index]]
            } else {
                self.lblSortingTitle.text = string as? String ?? ""
                self.lblSortingValue.text = string as? String ?? ""
            }
            self.selectedIndex = index
            self.view.endEditing(true)
        }, sender: viewSorting)
    }
    
    @objc func didSelectedRatingView(sender : UITapGestureRecognizer){
        let ratingView = sender.view as! RatingView
        let id = ratingView.id
        
        allRatingVeiw.forEach { rv in
            if rv.id == id {
                rv.didSelectedOrNot(isSelected: true)
            } else {
                rv.didSelectedOrNot(isSelected: false)
            }
        }
    }
    
    @IBAction func didTapBtnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

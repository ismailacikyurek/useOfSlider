//
//  ViewController.swift
//  sliderKullanimi
//
//  Created by İSMAİL AÇIKYÜREK on 4.08.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var sliderCollection: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    var timer : Timer?
    var currentIndex = 0
    
    let imgArray = ["ankara","bolu","bursa","diyarbakır","istanbul"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCollection.delegate = self
        sliderCollection.dataSource = self
        pageView.numberOfPages = imgArray.count
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(cityToIndex), userInfo: nil, repeats: true)
    }
    @objc func cityToIndex() {
        if currentIndex == imgArray.count-1 {
            currentIndex = -1
        } else {
            currentIndex += 1
            sliderCollection.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            pageView.currentPage = currentIndex
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
        cell.photo.image = UIImage(named: imgArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: sliderCollection.frame.width, height: sliderCollection.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }


}


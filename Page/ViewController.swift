//
//  ViewController.swift
//  Page
//
//  Created by 王冊 on 2021/4/23.
//

import UIKit

class ViewController: UIViewController {

    let names = ["日本","越南","泰國","新加坡"]
    let cartoons = ["熊本熊","女子","象","魚尾獅"]
    
    var begin: Int = 0

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var image2View: UIImageView!
    
    //定義要同步改變的內容：圖片、、Page Controll、Segmented Controll
    func sync() {
        if begin == 4 {
            begin = 0
        } else if begin == -1 {
            begin = 3
        }
        imageView.image = UIImage(named: names[begin])
        pageControl.currentPage = begin
        segmentControl.selectedSegmentIndex = begin
        image2View.image = UIImage(named: cartoons[begin])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sync()
    }
    
    //點點改變圖片
    @IBAction func changePage(_ sender: UIPageControl) {
        begin = pageControl.currentPage
        sync()
    }
    
   //改變國旗
    @IBAction func changeSegement(_ sender: UISegmentedControl) {
        begin = segmentControl.selectedSegmentIndex
        sync()
    }
    
    //往右箭頭
    @IBAction func LButton(_ sender: UIButton) {
        begin -= 1
        sync()
    }
    
    //往左箭頭
    @IBAction func RButton(_ sender: UIButton) {
        // begin = begin + 1 等同於 begin += 1
        begin += 1
        sync()
//        if begin == 0 {
//            begin = begin + 1
//        } else if begin == 1 {
//            begin = begin + 1
//        } else if begin == 2 {
//            begin = begin + 1
//        } else {
//            begin = begin - 3
//        }
//
//        sync()
    }
    
    //左右滑(手勢)
    @IBAction func swipeChangePage(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            begin += 1
        } else if sender.direction == .right {
            begin -= 1
        }
        sync()
    }
}



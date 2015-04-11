//
//  CustomScrollViewController.swift
//  ios8sample
//
//  Created by Joey Serquina on 11/28/14.
//  Copyright (c) 2014 sample. All rights reserved.
//

import UIKit
import Realm

class CustomScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var customScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageFromLocale()
        customScroll.panGestureRecognizer.delaysTouchesBegan = customScroll.delaysContentTouches
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageFromLocale(){
        
        for obj in ImageBackgrounds.allObjects(){
            
            if let obj = obj as? ImageBackgrounds {
                let image = UIImage(data: obj.realmImageData)
                pageImages.append(image!)
            }
        }
        
        
        let pageCount = pageImages.count
        println("COUNT NG OBJECTS> \(pageImages.count)")
        
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        
        for index in 0..<pageCount {
            pageViews.append(nil)
        
        
//        frame.origin.x = self.customScroll.frame.size.width * CGFloat(index)
//        frame.size = self.customScroll.frame.size
//        self.customScroll.pagingEnabled = true
//            
            
            
        }
        
        let pagesScrollViewSize =  customScroll.frame.size
        customScroll.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
//        self.customScroll.contentSize = CGSizeMake(self.customScroll.frame.size.width * CGFloat(pageCount), self.customScroll.frame.size.height)
//
        loadVisiblePages()
    }
    
    func loadPage(page: Int){
        if page < 0 || page >= pageImages.count{
         return
        }
        
        if let pageView = pageViews[page]{
            
        }
        else {
            var frame = customScroll.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 10.0
            frame = CGRectInset(frame, 25.0, 0.0)
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            customScroll.addSubview(newPageView)
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int){
        if page < 0 || page >= pageImages.count{
            
            return
        }
        
        if let pageView = pageViews[page]{
        pageView.removeFromSuperview()
        pageViews[page] = nil
        }
    }
    
    
    func loadVisiblePages(){
        let pageWidth = customScroll.frame.size.width
        let page = Int(floor((customScroll.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        //pageControl >Update!
        pageControl.currentPage =  page
        
        //Loading Pages
        
        let firstPage = page - 1
        let lastPage = page + 1
        
        //Purge anything before the first PAGE
        
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        //PurgePage In the Range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        //Purge Page anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        loadVisiblePages()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

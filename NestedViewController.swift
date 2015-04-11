//
//  NestedViewController.swift
//  ios8sample
//
//  Created by Joey Serquina on 3/20/15.
//  Copyright (c) 2015 sample. All rights reserved.
//

import UIKit
import Realm

class NestedViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet var imagesAllCount: UILabel!
    @IBOutlet var imageCurrentCount: UILabel!
    @IBOutlet var pickedImage: UIImageView!
    var categoryForwardedBuffer:NSString!
    var imageArray:NSMutableArray = NSMutableArray()
    var forwardedString:NSString!
    @IBOutlet var nestedCollection:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("FORWARD STRING!!!! >>>> \(forwardedString)")
        // Do any additional setup after loading the view.
        self.loadLocalData()
        nestedCollection.panGestureRecognizer.delaysTouchesBegan = nestedCollection.delaysContentTouches
        
        self.imagesAllCount.text = "\(self.imageArray.count) images"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:NestedCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("nestedcell", forIndexPath: indexPath) as NestedCollectionViewCell
        
        let receiveImage:UIImage = imageArray.objectAtIndex(indexPath.row) as UIImage
        cell.cellimage.image = receiveImage
        
        return cell as UICollectionViewCell
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return self.imageArray.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        let getImage:UIImage = imageArray[indexPath.row] as UIImage
        pickedImage.image = getImage
        
        
        
        let imageIndex = indexPath.row + 1
        self.imageCurrentCount.text = "image \(imageIndex)"
        
        println("CLICKED!!")
        
    }
    
    
    
    func loadLocalData(){
        
        let categoryNumber = categoryForwardedBuffer
        let rideName = forwardedString
        println("LOADED LOCAL DATA! > > > > > >>  > > > > > > > > > > > >\(rideName)")

            for obj in ZamperlaRealmDatabase.allObjects()
            {   if let obj = obj as? ZamperlaRealmDatabase
                {
                    if(rideName == obj.ZamperlaRideName)
                    {
                        println("MATCH!!!!!")
                        let image = UIImage(data: obj.ZamperlaData)
                        self.imageArray.addObject(image!)
                        self.nestedCollection.reloadData()
                    }
                }
            }
            
        

  
        
        
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

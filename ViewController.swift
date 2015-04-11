//
//  ViewController.swift
//  ios8sample
//
//  Created by Joey Serquina on 10/21/14.
//  Copyright (c) 2014 sample. All rights reserved.
//

import UIKit
import Realm
import Parse


class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var viewButton : UIButton!
    @IBOutlet var viewControllerBackground : UIImageView!
    @IBOutlet var zamperlaLogo: UIImageView!
    @IBOutlet var rideNameLabel: UILabel!
    var productsID:NSMutableArray = NSMutableArray()
    var imageName:NSString =  NSString()
    var buffering: UIImage = UIImage()
    var bufferingIndex: Int = Int()



@IBAction func viewBtn(sender: AnyObject) {
    
    println(self.imageName)
    }
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mySegue") {
            
            let vc = segue.destinationViewController as SecondViewController
            vc.newImageBuffer = buffering
            
            vc.imageNameHolder = imageName
            
        }
    }
    
   
    @IBOutlet var zapcollection: UICollectionView!
    var ImageArray: NSMutableArray = NSMutableArray()
    
    
    class Zamperla_Images : PFObject, PFSubclassing {
        
        override class func load() {
            self.registerSubclass()
        }
        class func parseClassName() -> String! {
            return "Zamperla_Images"
        }
    }
    
    class Zamperla_Sketches : PFObject, PFSubclassing {
        
        override class func load() {
            self.registerSubclass()
        }
        class func parseClassName() -> String! {
            return "Zamperla_Sketches"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = (NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains:.UserDomainMask)[0] as NSURL)
        println(url)

        loadLocalData()
         zapcollection.panGestureRecognizer.delaysTouchesBegan = zapcollection.delaysContentTouches
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.ImageArray.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:ZAPCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellzap", forIndexPath: indexPath) as ZAPCollectionViewCell
        
     //   cell.backgroundColor = UIColor.blackColor()
       // collectionView.backgroundColor = UIColor.blueColor()
        
        let receiveImage: UIImage = ImageArray.objectAtIndex(indexPath.row) as UIImage
        cell.cellimage.image = receiveImage
        return cell as UICollectionViewCell
    }
    
    
    
    
    
func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){

//    for obj in KiddieRideRealm.allObjects()
//    {if let obj = obj as? KiddieRideRealm
//      { if (obj.kiddieID == String(productsID[indexPath.row] as NSString))
//            {
//                self.buffering = UIImage(data: obj.kiddieData)!
//                self.rideNameLabel.text = obj.kiddieName
//                self.imageName = obj.kiddieName
//            }
//      }
//     else
//      {
//      }
//    }
    
    
    let viewKiddie = self.storyboard!.instantiateViewControllerWithIdentifier("CustomPage2ndViewController") as CustomPage2ndViewController
    
    viewKiddie.bufferIndex = indexPath.row
    self.navigationController!.pushViewController(viewKiddie, animated: true)
    
    
    println("ClICKED")
    
}
    
    
    func loadLocalData()
    {
        for obj in KiddieRideRealm.allObjects()
        {if let obj = obj as? KiddieRideRealm
         {  let image = UIImage(data: obj.kiddieData)
            self.ImageArray.addObject(image!)
            self.productsID.addObject(obj.kiddieID)
            self.zapcollection.reloadData()
         }
         else
         {
         }
        }
    }
  
    
}


//
//  AddImagesViewController.swift
//  FruitsDiet
//
//  Created by Kamil Kuliński on 22.04.2016.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit

class AddImagesViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    var actions : [Fruit]?
    
    let identifier = "CellIdentifier"
    let headerViewIdentifier = "HeaderView"
    var imagePickerController: UIImagePickerController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = true
        
        navigationItem.leftBarButtonItem = navigationItem.backBarButtonItem
        navigationItem.rightBarButtonItem = editButtonItem()
        toolBar.hidden = false
        actions = [Fruit]()
        presentPhotoPickerAlertController()
        
    }
    
    
    func reloadData(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    
    // MARK:- Highlight
    
    func highlightCell(indexPath : NSIndexPath, flag: Bool) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FruitCell
        
        let fruit = actions![indexPath.row]
        fruit.checked = !fruit.checked!
        
        if fruit.checked! {
            cell.tickImageView.hidden = false
        } else {
            cell.tickImageView.hidden = true
        }
    }
    @IBAction func addNextTapped(sender: AnyObject) {
        presentPhotoPickerAlertController()
    }
    
    //MARK: - Image
    ////////////////////////////////////////////////////////////////////////////
    
    func presentPhotoPickerAlertController() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            
            if (UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) == false) {
                
                self.openImagePickerForSource(.Camera)
                return
            }
            
            let takePhotoAction = UIAlertAction(title: "Take photo", style: .Default) { (action) -> Void in
                
                self.openImagePickerForSource(.Camera)
                return
            }
            
            alertController.addAction(takePhotoAction)
        }
        
        if (UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)) {
            
            if (UIImagePickerController.isSourceTypeAvailable(.Camera) == false) {
                
                self.openImagePickerForSource(.PhotoLibrary)
                
                return
            }
            
            let selectPhotoAction = UIAlertAction(title: "Select photo", style: .Default) { (action) -> Void in
                
                self.openImagePickerForSource(.PhotoLibrary)
                
                return
            }
            
            alertController.addAction(selectPhotoAction)
        }
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func openImagePickerForSource(sourceType: UIImagePickerControllerSourceType) {
        
        imagePickerController = UIImagePickerController()
        
        imagePickerController!.delegate = self
        imagePickerController!.allowsEditing = true
        imagePickerController!.sourceType = sourceType
        
        presentViewController(imagePickerController!, animated: true, completion: nil)
    }
    
    ////////////////////////////////////////////////////////////////////////////
    
    //MARK: - UIImagePickerControllerDelegate
    ////////////////////////////////////////////////////////////////////////////
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            let action = Fruit.init(name: "", checked: false, image: selectedImage)
            
            actions?.append(action)
            
            reloadData()
        }
        
        imagePickerController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        let importAlert: UIAlertController = UIAlertController(title: "Success", message: "New Action created", preferredStyle: UIAlertControllerStyle.Alert)
        let reportAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            self.navigationController?.popToRootViewControllerAnimated(true)
            
        }
        importAlert.addAction(reportAction)
        self.presentViewController(importAlert, animated: true, completion: nil)
        
    }
    
}

// MARK:- UICollectionView DataSource

extension AddImagesViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (actions?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier,forIndexPath:indexPath) as! FruitCell
        
        let fruit = actions![indexPath.row]
        
        if fruit.checked! {
            cell.tickImageView.hidden = false
        } else {
            cell.tickImageView.hidden = true
        }
        
        cell.imageView.image = fruit.image
        
        return cell
    }

}

// MARK:- UICollectionViewDelegate Methods

extension AddImagesViewController : UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        highlightCell(indexPath, flag: true)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        highlightCell(indexPath, flag: false)
    }
}

extension AddImagesViewController: UICollectionViewDelegateFlowLayout {
    // MARK:- UICollectioViewDelegateFlowLayout methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        // http://stackoverflow.com/questions/28872001/uicollectionview-cell-spacing-based-on-device-sceen-size
        
        let length = (UIScreen.mainScreen().bounds.width-15)/2
        return CGSizeMake(length,length);
    }
}


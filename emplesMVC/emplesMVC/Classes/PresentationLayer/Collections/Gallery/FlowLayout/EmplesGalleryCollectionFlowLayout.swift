//
//  EmplesGalleryCollectionFlowLayout.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGalleryCollectionFlowLayout : UICollectionViewFlowLayout {
    
    static let kGallerySwipeVelocity:CGFloat = 0.5
    static let kGalleryLineSpacing:CGFloat = 24.0
    
    override func prepare() {
        super.prepare()
        
        self.itemSize = self.customItemSize
        self.minimumLineSpacing = EmplesGalleryCollectionFlowLayout.kGalleryLineSpacing
        self.scrollDirection = .horizontal
        
        let horizontalInset = (self.collectionView!.frame.size.width - self.itemSize.width)/2
        self.sectionInset = UIEdgeInsets(top:0.0, left:horizontalInset, bottom:0.0, right:horizontalInset)
        
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let rawPageValue = self.collectionView!.contentOffset.x / self.pageWidth
        let currentPage = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue)
        let nextPage = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue)
        
        let pannedLessThanAPage = fabs(1 + currentPage - rawPageValue) > 0.5
        let swiped = fabs(velocity.x) > EmplesGalleryCollectionFlowLayout.kGallerySwipeVelocity
        var offset = proposedContentOffset
        if pannedLessThanAPage && swiped {
            offset.x = nextPage * self.pageWidth
        } else {
            offset.x = round(rawPageValue) * self.pageWidth
        }
        return proposedContentOffset
    }
    
    var customItemSize: CGSize {
        get {
            if self.collectionView!.frame.size.width < self.collectionView!.frame.size.height {
                return CGSize(width:self.collectionView!.frame.size.width -
                    4*EmplesGalleryCollectionFlowLayout.kGalleryLineSpacing,
                              height:self.collectionView!.frame.size.height * 0.6)
            } else {
                return CGSize(width:self.collectionView!.frame.size.width -
                    8*EmplesGalleryCollectionFlowLayout.kGalleryLineSpacing,
                              height:self.collectionView!.frame.size.height * 0.9)
            }
        }
    }
    
    private var pageWidth: CGFloat {
        get {
            return self.customItemSize.width + EmplesGalleryCollectionFlowLayout.kGalleryLineSpacing
        }
    }
}
    


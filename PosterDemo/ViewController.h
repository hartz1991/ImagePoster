//
//  ViewController.h
//  PosterDemo
//
//  Created by Cools on 12/12/17.
//  Copyright © 2017 Cools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    
//    __weak IBOutlet UIView *collageFrame;
    __weak IBOutlet NSLayoutConstraint *scroll1LeadingConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll1TopConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll1WidthConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll1HeightConstraint;
    
    __weak IBOutlet NSLayoutConstraint *scroll2LeadingConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll2TopConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll2WidthConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll2HeightConstraint;
    
    __weak IBOutlet NSLayoutConstraint *scroll3LeadingConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll3TopConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll3WidthConstraint;
    __weak IBOutlet NSLayoutConstraint *scroll3HeightConstraint;
    IBOutlet UIScrollView *scroll1;
    IBOutlet UIScrollView *scroll2;
    IBOutlet UIScrollView *scroll3;
    
    IBOutlet UIImageView *MainImage;
}
@property (weak, nonatomic) IBOutlet UIView *collageFrame;
@end


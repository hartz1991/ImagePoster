//
//  ViewController.m
//  PosterDemo
//
//  Created by Cools on 12/12/17.
//  Copyright © 2017 Cools. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+vImageScaling.h"
#import "UIImage+Resize.h"

@interface ViewController ()
{
    UIImageView *zoomedImage;
    NSArray *img1Array;
    NSArray *img2Array;
    NSArray *img3Array;
    
    NSMutableArray *frameArray1;
    NSMutableArray *frameArray2;
    NSMutableArray *frameArray3;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    img1Array = [NSArray arrayWithObjects:@"baby1.jpg", nil];
    img2Array = [NSArray arrayWithObjects:@"baby1.jpg",@"baby2.jpg", nil];
    img3Array = [NSArray arrayWithObjects:@"baby1.jpg",@"baby2.jpg",@"buda.jpg", nil];
    
    frameArray1 = [NSMutableArray arrayWithObjects: @[@{@"scrolls": @[@{@"x":@"3.47", @"y":@"5.43", @"width": @"2.12", @"height":@"1.44"}]}],nil];
    
    frameArray2 = [NSMutableArray arrayWithObjects: @[@{@"scrolls": @[@{@"x":@"4", @"y":@"3.75", @"width": @"3.60", @"height":@"2.14"},
                                                                      @{@"x":@"1.64", @"y":@"4.58", @"width": @"2.82", @"height":@"1.76"}
                                                                      ]}],nil];
    
    frameArray3 = [NSMutableArray arrayWithObjects: @[@{@"scrolls": @[@{@"x":@"15.15", @"y":@"31.25", @"width": @"3.70", @"height":@"2.07"},
                                                                      @{@"x":@"2.82", @"y":@"31.25", @"width": @"3.70", @"height":@"2.07"},
                                                                      @{@"x":@"1.56", @"y":@"31.25", @"width": @"3.70", @"height":@"2.07"}]}],nil];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    scroll1 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/3.47, MainImage.frame.origin.y + (MainImage.frame.size.height/5.43), MainImage.frame.size.width/2.11, MainImage.frame.size.height/1.44)];
//    MainImage.image = [UIImage imageNamed:@"one9.png"];
    [_collageFrame layoutIfNeeded];
    
    [self loadImage:img1Array withMainImage:@"one9.png" withFrameArray:frameArray1];
//    MainImage.image = [UIImage imageNamed:@"one9.png"];
//
//    if (self.view.frame.size.height == 812)
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/5.43);
//    }
//    else
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/5.43);
//    }
//
//    scroll1HeightConstraint.constant = MainImage.frame.size.height/1.44;
//    scroll1LeadingConstraint.constant = MainImage.frame.size.width/3.47;
//    scroll1WidthConstraint.constant = MainImage.frame.size.width/2.11;
//
//    [scroll2 setHidden:YES];
//    [scroll3 setHidden:YES];
    

//    img2.frame = CGRectMake(MainImage.frame.size.width/1.64, MainImage.frame.origin.y + (MainImage.frame.size.height/4.58), MainImage.frame.size.width/2.82, MainImage.frame.size.height/1.76);
    
}

-(void)loadImage:(NSArray*)imgArray withMainImage:(NSString*)imgStrName withFrameArray:(NSMutableArray*)frameArray
{
    NSArray *dict = [frameArray objectAtIndex: 0];
    NSArray *templ_array = [dict[0] objectForKey:@"scrolls"];
    for (int i=0; i<imgArray.count; i++)
    {
        NSDictionary *d = [templ_array objectAtIndex:i];
        UIImageView *mainImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _collageFrame.frame.size.width, _collageFrame.frame.size.height)];
        mainImage.image = [UIImage imageNamed:imgStrName];
        //    [_collageFrame addSubview:mainImage];
        
        
        
        CGRect frame;
        
        float x = mainImage.frame.size.width/[[d objectForKey:@"x"] floatValue];
        float y = mainImage.frame.origin.y + (mainImage.frame.size.height/[[d objectForKey:@"y"] floatValue]);
        
        float width = mainImage.frame.size.width/[[d objectForKey:@"width"] floatValue];
        float height = mainImage.frame.size.height/[[d objectForKey:@"height"] floatValue];
        
        frame = CGRectMake(x, y, width, height);
        
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
        scroll.backgroundColor = [UIColor clearColor];
        scroll.layer.borderColor= [UIColor whiteColor].CGColor;//_currentColor.CGColor;
        
        
        [_collageFrame addSubview:scroll];
        [_collageFrame addSubview:mainImage];
        [self tuneScroll:scroll withContentSize:CGSizeMake(width, height) withScrollIndex:i withImgArray:imgArray[i]];
    }
    
    
    
}

- (IBAction)btnSingleAction:(id)sender {
//    MainImage.image = [UIImage imageNamed:@"one9.png"];
////    scroll1 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/3.47, MainImage.frame.origin.y + (MainImage.frame.size.height/5.43), MainImage.frame.size.width/2.11, MainImage.frame.size.height/1.44)];
//
//
//    if (self.view.frame.size.height == 812)
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/5.43);
//    }
//    else
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/5.43);
//    }
//
//    scroll1HeightConstraint.constant = MainImage.frame.size.height/1.44;
//    scroll1LeadingConstraint.constant = MainImage.frame.size.width/3.47;
//    scroll1WidthConstraint.constant = MainImage.frame.size.width/2.11;
//
//    [scroll2 setHidden:YES];
//    [scroll3 setHidden:YES];
    zoomedImage = nil;
    [self deleteUIImageView];
    [self deleteScrolls];
    [self deleteMainUIImageView];
//    [self loadImage:img1Array withMainImage:@"one9.png"];
    [self loadImage:img1Array withMainImage:@"one9.png" withFrameArray:frameArray1];
}

- (IBAction)btnDoubleAction:(id)sender {
//    MainImage.image = [UIImage imageNamed:@"two1.png"];
////    scroll1 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/4, MainImage.frame.origin.y + (MainImage.frame.size.height/3.75), MainImage.frame.size.width/3.60, MainImage.frame.size.height/2.14)];
//
//
//    if (self.view.frame.size.height == 812)
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/3.75);
//        scroll2TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/4.58);
//    }
//    else
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/3.75);
//        scroll2TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/4.58);
//    }
//
//
//    scroll1HeightConstraint.constant = MainImage.frame.size.height/2.14;
//    scroll1LeadingConstraint.constant = MainImage.frame.size.width/4;
//    scroll1WidthConstraint.constant = MainImage.frame.size.width/3.60;
//
//
//    scroll2HeightConstraint.constant = MainImage.frame.size.height/1.76;
//    scroll2LeadingConstraint.constant = MainImage.frame.size.width/1.64;
//    scroll2WidthConstraint.constant = MainImage.frame.size.width/2.82;
//
////    scroll2 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/1.64, MainImage.frame.origin.y + (MainImage.frame.size.height/4.58), MainImage.frame.size.width/2.82, MainImage.frame.size.height/1.76)];
//    [scroll2 setHidden:NO];
//    [scroll3 setHidden:YES];
    zoomedImage = nil;
    [self deleteUIImageView];
    [self deleteScrolls];
    [self deleteMainUIImageView];
//    [self loadImage:img1Array withMainImage:@"two1.png"];
    [self loadImage:img2Array withMainImage:@"two1.png" withFrameArray:frameArray2];
}

- (IBAction)btnTripleAction:(id)sender {
    MainImage.image = [UIImage imageNamed:@"three4.png"];
//    scroll1 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/15.15, MainImage.frame.origin.y + (MainImage.frame.size.height/31.25), MainImage.frame.size.width/3.70, MainImage.frame.size.height/2.07)];
//
//    scroll2 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/2.82, MainImage.frame.origin.y + (MainImage.frame.size.height/31.25), MainImage.frame.size.width/3.70, MainImage.frame.size.height/2.07)];
//
//    scroll3 = [[UIScrollView alloc] initWithFrame:CGRectMake(MainImage.frame.size.width/1.56, MainImage.frame.origin.y + (MainImage.frame.size.height/31.25), MainImage.frame.size.width/3.70, MainImage.frame.size.height/2.07)];
    
//    if (self.view.frame.size.height == 812)
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/31.25);
//        scroll2TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/31.25);
//        scroll3TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/31.25);
//    }
//    else
//    {
//        scroll1TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/31.25);
//        scroll2TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/31.25);
//        scroll3TopConstraint.constant = MainImage.frame.origin.y + (MainImage.frame.size.height/31.25);
//    }
//
//    scroll1HeightConstraint.constant = MainImage.frame.size.height/2.07;
//    scroll1LeadingConstraint.constant = MainImage.frame.size.width/15.15;
//    scroll1WidthConstraint.constant = MainImage.frame.size.width/3.70;
//
//
//    scroll2HeightConstraint.constant = MainImage.frame.size.height/2.07;
//    scroll2LeadingConstraint.constant = MainImage.frame.size.width/2.82;
//    scroll2WidthConstraint.constant = MainImage.frame.size.width/3.70;
//
//
//    scroll3HeightConstraint.constant = MainImage.frame.size.height/2.07;
//    scroll3LeadingConstraint.constant = MainImage.frame.size.width/1.56;
//    scroll3WidthConstraint.constant = MainImage.frame.size.width/3.70;
//
//
//    [scroll2 setHidden:NO];
//    [scroll3 setHidden:NO];
    
    zoomedImage = nil;
    [self deleteUIImageView];
    [self deleteScrolls];
    [self deleteMainUIImageView];
    [self loadImage:img3Array withMainImage:@"three4.png" withFrameArray:frameArray3];
}

-(void) deleteScrolls{
    for (id i in _collageFrame.subviews){
        if( [i isKindOfClass:[UIScrollView class]]){
            [i removeFromSuperview];
        }
    }
}

-(void) deleteMainUIImageView{
    for (id i in _collageFrame.subviews){
        if( [i isKindOfClass:[UIImageView class]]){
            [i removeFromSuperview];
        }
    }
}

-(void) deleteUIImageView{
    for (id i in _collageFrame.subviews){
        if( [i isKindOfClass:[UIScrollView class]]){
            UIScrollView *scroll = (UIScrollView *)i;
            for (UIScrollView *y in scroll.subviews){
                if( [y isKindOfClass:[UIImageView class]]){
                    [y removeFromSuperview];
                }
            }
        }
    }
}

- (void)view:(UIView*)view setCenter:(CGPoint)centerPoint withScrollview:(UIScrollView*)scrollView
{
    CGRect vf = view.frame;
    CGPoint co = scrollView.contentOffset;
    
    CGFloat x = centerPoint.x - vf.size.width / 2.0;
    CGFloat y = centerPoint.y - vf.size.height / 2.0;
    
    if(x < 0)
    {
        co.x = -x;
        vf.origin.x = 0.0;
    }
    else
    {
        vf.origin.x = x;
    }
    if(y < 0)
    {
        co.y = -y;
        vf.origin.y = 0.0;
    }
    else
    {
        vf.origin.y = y;
    }
    
    view.frame = vf;
    scrollView.contentOffset = co;
}

-(void)tuneScroll: (UIScrollView *)scroll withContentSize: (CGSize) size withScrollIndex: (NSInteger) index withImgArray:(NSString*)imgName
{
    float biggestSide = (size.height>size.width)? size.height : size.width;
    
    UIImage *img = [UIImage imageNamed:imgName];
    
//    UIImage *scaleImg = [self scaleToSize:CGSizeMake(biggestSide, biggestSide) withImage:img];
//    img = [img vImageScaledImageWithSize:CGSizeMake(img.size.width, img.size.height)];
    
//    img = [img resizedImageWithContentMode:UIViewContentModeScaleAspectFit bounds:CGSizeMake(size.width, size.height) interpolationQuality:kCGInterpolationHigh];
    
    UIImage *scaleImg = [img vImageScaledImageWithSize:CGSizeMake(size.width, size.height) contentMode:UIViewContentModeScaleAspectFill];
    
//    img = [img resizedImage:CGSizeMake(biggestSide, biggestSide) interpolationQuality:kCGInterpolationHigh];
    
    
    
//    scroll.contentSize = CGSizeMake(biggestSide, biggestSide);
    
    scroll.contentSize=CGSizeMake(scaleImg.size.width, scaleImg.size.height);
    
    
    CGRect frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), scroll.contentSize};
    UIImageView *imView = [[UIImageView alloc] initWithFrame: frame];
    [imView setImage:scaleImg];
    [imView sizeToFit];
//    [imView setContentMode:UIViewContentModeCenter];
    scroll.tag = index;
    imView.tag = index;
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(scroll.bounds),
                                      CGRectGetMidY(scroll.bounds));
    [self view:imView setCenter:centerPoint withScrollview:scroll];
//    imView.clipsToBounds = YES;
    
    
//    [self tuneZoomImageView:imView];
//    zoomedImage = imView;
    
    scroll.delegate = self;
    scroll.layer.borderWidth = 0.0f;
    
//    UIPinchGestureRecognizer *pinchTouch = [[UIPinchGestureRecognizer alloc]
//                                            initWithTarget:self
//                                            action:@selector(zoomImageInCollage:)];
//    pinchTouch.delegate = self;
//    [scroll addGestureRecognizer:pinchTouch];
    scroll.userInteractionEnabled = YES;
//    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
//    doubleTapRecognizer.numberOfTapsRequired = 2;
//    doubleTapRecognizer.numberOfTouchesRequired = 1;
//    [scroll addGestureRecognizer:doubleTapRecognizer];

    
//    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewSingleTapped:)];
//    singleTapRecognizer.numberOfTouchesRequired = 2;
//    [scroll addGestureRecognizer:singleTapRecognizer];
    
    
    CGFloat scaleWidth = scroll.frame.size.width / scroll.contentSize.width;
    CGFloat scaleHeight = scroll.frame.size.height / scroll.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    
    scroll.minimumZoomScale = 1.0f;
    scroll.zoomScale = minScale;
    scroll.maximumZoomScale = 6.0f;
    [scroll addSubview:imView];
}
/*
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    NSLog(@"Scroll identity is %d",recognizer.view.tag);
//    UIScrollView *scroll = (UIScrollView *) recognizer.view;
//    for (id y in scroll.subviews){
//        if( [y isKindOfClass:[UIImageView class]]){
//            UIImageView *imgView = y;
//            if (imgView.tag!=0){
//                zoomedImage = imgView;
//            }
//        }
//    }
    
    
    CGPoint locationPointInView = [recognizer locationInView: _collageFrame];
    //    CGPoint locationPointInSuperView = [gesture locationInView:self.view];
    for (UIView *i in _collageFrame.subviews){
        
        if([i isKindOfClass:[UIScrollView class]]){
            UIScrollView *scroll = (UIScrollView *)i;
            scroll.userInteractionEnabled = YES;
            CGRect frameRelativeToParent = [scroll convertRect:scroll.bounds toView:_collageFrame];
            if (CGRectContainsPoint( frameRelativeToParent , locationPointInView)){
                for (UIScrollView *y in scroll.subviews){
                    if( [y isKindOfClass:[UIImageView class]]){
                        UIImageView *img = (UIImageView*)y;
                        
                        CGPoint scrollPointInView = [recognizer locationInView: scroll];
                        CGRect frameRelativeToParent1 = [img convertRect:img.bounds toView:scroll];
                        if (CGRectContainsPoint(frameRelativeToParent1 , scrollPointInView)){
                            zoomedImage = img;
                            CGPoint pointInView = [recognizer locationInView:zoomedImage];
                            
                            CGFloat newZoomScale = scroll.zoomScale * 1.5f;
                            newZoomScale = MIN(newZoomScale, scroll.maximumZoomScale);
                            
                            CGSize scrollViewSize = scroll.bounds.size;
                            
                            CGFloat w = scrollViewSize.width / newZoomScale;
                            CGFloat h = scrollViewSize.height / newZoomScale;
                            CGFloat x = pointInView.x - (w / 2.0f);
                            CGFloat y = pointInView.y - (h / 2.0f);
                            
                            CGRect rectToZoomTo = CGRectMake(x, y, w, h);
                            
                            // 4
                            [scroll zoomToRect:rectToZoomTo animated:YES];
                        }
                    }
                }
            }
        }
    }
    
}
*/
/*
- (void)scrollViewSingleTapped:(UITapGestureRecognizer*)recognizer {
    NSLog(@"Scroll identity is %d",recognizer.view.tag);
    //    UIScrollView *scroll = (UIScrollView *) recognizer.view;
    //    for (id y in scroll.subviews){
    //        if( [y isKindOfClass:[UIImageView class]]){
    //            UIImageView *imgView = y;
    //            if (imgView.tag!=0){
    //                zoomedImage = imgView;
    //            }
    //        }
    //    }
    
    
    CGPoint locationPointInView = [recognizer locationInView: _collageFrame];
    //    CGPoint locationPointInSuperView = [gesture locationInView:self.view];
    for (UIView *i in _collageFrame.subviews){
        
        if([i isKindOfClass:[UIScrollView class]]){
            UIScrollView *scroll = (UIScrollView *)i;
            scroll.userInteractionEnabled = YES;
            CGRect frameRelativeToParent = [scroll convertRect:scroll.bounds toView:_collageFrame];
            if (CGRectContainsPoint( frameRelativeToParent , locationPointInView)){
                for (UIScrollView *y in scroll.subviews){
                    if( [y isKindOfClass:[UIImageView class]]){
                        UIImageView *img = (UIImageView*)y;
                        
                        CGPoint scrollPointInView = [recognizer locationInView: scroll];
                        CGRect frameRelativeToParent1 = [img convertRect:img.bounds toView:scroll];
                        if (CGRectContainsPoint(frameRelativeToParent1 , scrollPointInView)){
                            zoomedImage = img;
                        }
                    }
                }
            }
        }
    }
    
}
*/

/*
-(void) tuneZoomImageView: (UIImageView *)imageView {
    
    [imageView setUserInteractionEnabled:YES];
    //        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImageInCollage:)];
    //        pan.delegate = self;
    //        [imageView addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinchTouch = [[UIPinchGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(zoomImageInCollage:)];
    pinchTouch.delegate = self;
    [imageView addGestureRecognizer:pinchTouch];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bringSubviewToFront:)];
//    tap.delegate = self;
//    [imageView addGestureRecognizer: tap];
//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseFromLibrary:)];
//    doubleTap.numberOfTapsRequired = 2;
//    [imageView addGestureRecognizer:doubleTap];
//    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//    imageView.layer.borderWidth = 5.0f;
}
*/
/*
-(void) zoomImageInCollage: (UIPinchGestureRecognizer *) gesture{
    
    CGPoint locationPointInView = [gesture locationInView: _collageFrame];
    //    CGPoint locationPointInSuperView = [gesture locationInView:self.view];
    
    
    if (gesture.scale >1.0f && gesture.scale < 2.5f) {
        CGAffineTransform transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
        for (UIView *i in _collageFrame.subviews){
            
            if([i isKindOfClass:[UIScrollView class]]){
                UIScrollView *scroll = (UIScrollView *)i;
                scroll.userInteractionEnabled = YES;
                CGRect frameRelativeToParent = [scroll convertRect:scroll.bounds toView:_collageFrame];
                if (CGRectContainsPoint( frameRelativeToParent , locationPointInView)){
                    for (UIScrollView *y in scroll.subviews){
                        if( [y isKindOfClass:[UIImageView class]]){
                            UIImageView *img = (UIImageView*)y;
                            
                            CGPoint scrollPointInView = [gesture locationInView: scroll];
                            CGRect frameRelativeToParent1 = [img convertRect:img.bounds toView:scroll];
                            if (CGRectContainsPoint(frameRelativeToParent1 , scrollPointInView)){
                                zoomedImage = img;
////                                NSLog(@"Tag: %ld",(long)_movingImage.tag);
//                                zoomedImage.transform = transform;
//                                [self viewForZoomingInScrollView:scroll];
                                
                                CGPoint pointInView = [gesture locationInView:zoomedImage];
                                
                                CGFloat newZoomScale = scroll.zoomScale * 1.5f;
                                newZoomScale = MIN(newZoomScale, scroll.maximumZoomScale);
                                
                                CGSize scrollViewSize = scroll.bounds.size;
                                
                                CGFloat w = scrollViewSize.width / newZoomScale;
                                CGFloat h = scrollViewSize.height / newZoomScale;
                                CGFloat x = pointInView.x - (w / 2.0f);
                                CGFloat y = pointInView.y - (h / 2.0f);
                                
                                CGRect rectToZoomTo = CGRectMake(x, y, w, h);
                                
                                // 4
                                [scroll zoomToRect:rectToZoomTo animated:YES];
                            }
                        }
                    }
                }
            }
        }
    }
}
*/
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
//    CGRect visibleRect = CGRectApplyAffineTransform(scrollView.bounds, CGAffineTransformMakeScale(1.0 / scrollView.zoomScale, 1.0 / scrollView.zoomScale));
//    CGRect visibleRect;
//    visibleRect.origin = scrollView.contentOffset;
//    visibleRect.size = scrollView.contentSize;
    for (UIScrollView *y in scrollView.subviews){
        if( [y isKindOfClass:[UIImageView class]]){
            UIImageView *img = (UIImageView*)y;
            CGPoint scrollPointInView = CGPointMake(scrollView.frame.origin.x, scrollView.frame.origin.y);
            CGRect frameRelativeToParent1 = [img convertRect:img.frame toView:scrollView];
            NSLog(@"scrollPointInView : %f",scrollPointInView);
            NSLog(@"frameRelativeToParent1 : %f",frameRelativeToParent1);
//            CGRectContainsPoint(frameRelativeToParent1 , scrollPointInView) ||
            if (CGRectContainsPoint(frameRelativeToParent1 , scrollPointInView)){
                zoomedImage = img;
                return zoomedImage;
            }
        }
    }
    return nil;
}

//- (CGRect)zoomRectForScrollView:(UIScrollView *)scrollView withScale:(float)scale withCenter:(CGPoint)center {
//
//
//
//    CGRect zoomRect;
//
//
//
//    // The zoom rect is in the content view's coordinates.
//
//    // At a zoom scale of 1.0, it would be the size of the
//
//    // imageScrollView's bounds.
//
//    // As the zoom scale decreases, so more content is visible,
//
//    // the size of the rect grows.
//
//    zoomRect.size.height = scrollView.frame.size.height / scale;
//
//    zoomRect.size.width  = scrollView.frame.size.width  / scale;
//
//
//
//    // choose an origin so as to get the right center.
//
//    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
//
//    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
//
//
//
//    return zoomRect;
//
//}

@end

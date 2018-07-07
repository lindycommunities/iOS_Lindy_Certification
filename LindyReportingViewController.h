//
//  LindyReportingViewController.h
//  LendiProperty
//
//  Created by Vinay D on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LindyReportingViewController : UIViewController
{
    IBOutlet UIButton *LindyReporting_btn;
    
    IBOutlet UIButton *LindyCertificates_btn;
    
    IBOutlet UIImageView *Bg_image;
}

@property(nonatomic,retain) IBOutlet UIButton *LindyReporting_btn;

@property(nonatomic,retain) IBOutlet UIButton *LindyCertificates_btn;

@property(nonatomic,retain) IBOutlet UIImageView *Bg_image;

-(IBAction)LindyReportingView;

-(IBAction)LindyCertificates;

-(void)Portrait;

-(void)Landscape;


@end

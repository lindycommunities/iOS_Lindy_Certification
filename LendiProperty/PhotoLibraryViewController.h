//
//  PhotoLibraryViewController.h
//  LendiProperty
//
//  Created by Dipti Yerawar on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJSON.h"
#import "SpinnerModal_iPad.h"
#import "ImageScrrenViewController.h"

@interface PhotoLibraryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate>
{
    
    IBOutlet UITableView *photo_tab;
    

    NSMutableData *webData;
    
    SpinnerModal_iPad *spinnerView;
   
    NSMutableArray *ImageDisplay,*Datearr,*FileNamearr,*Notesarr;
    
    int minval,maxval;
}

-(IBAction)NextBtnClick:(id)sender;

-(IBAction)PreviousBtnClick:(id)sender;

-(void)GetImagesWithMaxValue:(int)_mval WithMinValue:(int)_miVal;

-(void) stopSpinner;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain) IBOutlet UITableView *photo_tab;

@end

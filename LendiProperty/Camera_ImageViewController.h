//
//  Camera_ImageViewController.h
//  LendiProperty
//
//  Created by Vinay D on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LendiPropertyAppDelegate.h"

#import "LindyPropertyReportingViewController.h"

#import "SpinnerModal_iPad.h"

#import "LindyPropertyReportingViewController.h"

@interface Camera_ImageViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
{
    IBOutlet UIImageView *Camera_ImageView;
    
    IBOutlet UITextField *FileName_txt; 
    
    IBOutlet UIButton *Done_btn;
    
    IBOutlet UIScrollView *Scroll_Imag;
        
    IBOutlet UITextView *Notes_txt;
    
    LendiPropertyAppDelegate *app;
  
    UIImagePickerController *imagePicker;
    
    IBOutlet UIImageView *ImageVie;
    
    UIPopoverController *popover;
    
    NSMutableArray *Imagearr,*ImageArray_temp;
    
    NSMutableDictionary *Cameradic;
    
    int phototype,no;
    
    SpinnerModal_iPad *spinnerView;
    
    NSData *imageData;
    
    UIImage *temp_img;

}

- (id)initWithMutableArray:(NSMutableArray *)_arr;

- (IBAction)Donebtn_click;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

- (void) stopSpinner;

- (UIImage *)fixOrientation;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain)IBOutlet UIImageView *Camera_ImageView;

@property(nonatomic,retain)IBOutlet UITextField *FileName_txt;

@property(nonatomic,retain)IBOutlet UIButton *Done_btn;

@property(nonatomic,retain)IBOutlet UITextView *Notes_txt;

@property(nonatomic,retain)IBOutlet UIScrollView *Scroll_Imag;

@end

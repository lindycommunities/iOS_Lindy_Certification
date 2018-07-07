//
//  InclemnetWeatherReportController.h
//  LendiProperty
//
//  Created by Vinay D on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Camera_ImageViewController.h"
#import "LendiPropertyAppDelegate.h"
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "SpinnerModal_iPad.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"


@interface InclemnetWeatherReportController : UIViewController <UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIPopoverControllerDelegate, UINavigationControllerDelegate,NSURLConnectionDelegate>

{
       
    IBOutlet UIDatePicker *date_picker;
    
    IBOutlet UIView *Date_view,*pikerview;
    
    IBOutlet UIButton *Dateselect_btn,*SelectTime_btn,*SelectEndTime_btn,*SignDate_btn,*Attachphoto_btn;
    
    IBOutlet UITextField *PropertyM_txt,*Contractor_txt,*MaintainacesS_txt,*Phone_txt,*Phone1_txt,*Phone2_txt,*SignDate_txt,*ActionTaken_txt,*Sign_txt,*Date_txt,*STime_txt,*EndTime_txt,*Employee_txt,*Initales_txt;
    
    IBOutlet UIScrollView *Scroll_view;
    
    IBOutlet UIToolbar *ViewToolBar;
    
    IBOutlet UIPickerView *Propertypicker;
    
    IBOutlet UIImageView *ImageVie;
  
    UIBarButtonItem *Savebtn;
       
    SpinnerModal_iPad *spinnerView;
    
    UIImagePickerController *imagePicker;
    
    UIPopoverController *popover;
    
    UIImageView *photo1;
    
    NSMutableArray *Imagearr,*ImageArray_temp,*PikerArray,*propertyid;
    
    NSData *imageData;
    
    LendiPropertyAppDelegate *app;
     
    NSMutableData *webData;
    
    NSMutableDictionary *Cameradic;
    
    int phototype;
       
    NSString *chk_str,*Time_str,*get_reprtid;
    
    BOOL chek_view,messagechek,propertycheck,isPropertyChanged;
    
    UIImage *temp_img,*cameraimage;
    
    ParserClass *Obj_Parse;
       
    
}

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain) IBOutlet UIScrollView *Scroll_view;

@property (nonatomic, retain) UIPopoverController *popoverController;

@property(nonatomic,retain) IBOutlet UITextField *Date_txt,*EndTime_txt,*Sign_txt;

@property(nonatomic,retain) IBOutlet UIDatePicker *date_picker;

@property(nonatomic,retain) IBOutlet UIView *Date_view,*pikerview;

@property(nonatomic,retain) IBOutlet UIPickerView *Propertypicker;

@property(nonatomic,retain) IBOutlet UIButton *Dateselect_btn,*SelectTime_btn,*SelectEndTime_btn,*SignDate_btn,*Attachphoto_btn;

@property(nonatomic,retain) IBOutlet UITextField *PropertyM_txt,*Contractor_txt,*MaintainacesS_txt,*Phone_txt,*Phone1_txt,*Phone2_txt,*SignDate_txt,*Employee_txt,*Initales_txt,*ActionTaken_txt;

@property(nonatomic,retain) IBOutlet UIToolbar *ViewToolBar;

- (IBAction)DateSelect_btn;

- (IBAction)Donebtn_clcik;

- (IBAction)TimeSelect_btn;

- (IBAction)EndTimeSelect;

- (IBAction)SingDateSelect;

- (IBAction)AttachPhoto;

- (IBAction)PropertyDoneclcik;

- (IBAction)PropertyDoneclcik;

- (void)DatePickerView;

- (void)Getimage;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

- (void) stopSpinner;

- (void)ImageUpload;

- (UIImage *)fixOrientation;

- (void)disabeleview;

- (void)enableview;

- (void)LoadUserProperty;

@end

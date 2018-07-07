//
//  IncidentReportViewController.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "SpinnerModal_iPad.h"
#import "Spinner_iPad_Landscape.h"
#import "SBJSON.h"
#import "ASIFormDataRequest.h"
#import "LendiPropertyAppDelegate.h"


@interface IncidentReportViewController : UIViewController  <UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,NSURLConnectionDelegate,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>
{
    
    IBOutlet UITextField *txtProperty,*txtResidentName,*txtAPT,*txtPhone,*txtPreparedBy,*txtWitness,*txtAddress,*txtPhone1,*txtPhone2,*txtPhone3,*txtPhone4,*txtPhone5;
    
    IBOutlet UITextView *txtViewDesc;
    
    IBOutlet UIScrollView *scrView;
    
    IBOutlet UIImageView *ImageVie;

    IBOutlet UIButton *attachphotobtn;
    
    IBOutlet UILabel *Propertylbl;
      
    UIBarButtonItem *btnNext;
    
    UIImage *temp_img;
    
    UIViewController *viewControllerTest;
    
    UILabel *lblHeaderTest;
    
    UITableView *tblViewTest;
    
    UIButton *close_btn;
    
    UIPopoverController *popView;
    
    UIImagePickerController *imagePicker;
     
    NSMutableArray *Imagearr,*PikerArray,*ImageArray_temp,*propertyid;
    
    NSMutableData *webData;
    
     NSMutableDictionary *Cameradic;
    
    NSData *image_Data;
    
    NSString *get_reportid;
    
    int phototype,no;
    
    BOOL messagechek,hidedata,propertycheck,isPropertyChanged;

    ParserClass *objParser;
    
    LendiPropertyAppDelegate *app;
    
    SpinnerModal_iPad *spinnerView;

   

}
@property (nonatomic, retain) IBOutlet UITextField *txtProperty,*txtResidentName,*txtAPT,*txtPhone,*txtPreparedBy,*txtWitness,*txtAddress,*txtPhone1,*txtPhone2,*txtPhone3,*txtPhone4,*txtPhone5;

@property (nonatomic, retain) IBOutlet UITextView *txtViewDesc;

@property (nonatomic, retain) IBOutlet UIScrollView *scrView;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic, retain) IBOutlet UIButton *attachphotobtn;

@property (nonatomic, retain) IBOutlet UILabel *Propertylbl;

- (IBAction) Attachphoto;

- (IBAction) PropertyClick;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

- (void) stopSpinner;

- (void) postmessage;

- (void) ImageUpload;

- (UIImage *)fixOrientation;

- (void) LoadUserProperty;

- (void) OpenPOP;

@end

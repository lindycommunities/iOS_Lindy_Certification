//
//  LindyPropertyReportingViewController.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "IncidentReportViewController.h"
#import "PropertyManagerViewController.h"
#import "SpinnerModal_iPad.h"
#import "Spinner_iPad_Landscape.h"
#import "Camera_ImageViewController.h"
#import "LendiPropertyAppDelegate.h"
#import "InclemnetWeatherReportController.h"
#import "LeasingAgentReportController.h"
#import "DailyActivityCheklistViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "InclemnetWeatherViewReportController.h"
#import "AlertMessageViewController.h"
#import "InclemnetWeatherReportController.h"
#import "ELCAlbumPickerController.h"
#import "ELCAlbumPickerController.h"
#import "PhotoLibraryViewController.h"
#import "ApartmentInspectionViewController.h"

@interface LindyPropertyReportingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate,UITextFieldDelegate,UITextViewDelegate,NSURLConnectionDelegate,UIActionSheetDelegate,UIPopoverControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UILabel *lblHeader,*DateMessageLabel,*FirstMessageLabel,*SecondMessageLabel;
    
    IBOutlet UITableView *tblView;
    
    IBOutlet UITextView *txtView;
    
    IBOutlet UITextField *txtProperty,*txtDate,*txtdate1,*txtdate2;
    
    IBOutlet UIImageView *imgView;
    
    IBOutlet UIButton *CreateNewReportebtn,*ViewReportbtn,*PhotoAlbumbtn,*Sendmsgbtn,*SendAlertbtn;

    IBOutlet UIButton *viewalertbtn;
    
    UIButton *close_btn;
    
    NSArray *arrName;
    
    UIPopoverController *popView;
    
    MFMailComposeViewController *mailViewController;
    
    UIAlertView *alt;
    
    UIViewController *viewControllerTest;
    
    UITableView *tblViewTest;
    
    UILabel *lblHeaderTest;
    
    NSArray *arrNameTest;
    
    UIBarButtonItem *Logout_btn;

    IncidentReportViewController *objIncidentVC;
    
    PropertyManagerViewController *objPropManVC;
  
    SpinnerModal_iPad *spinnerView;
    
    Spinner_iPad_Landscape *spinnerlandscape;

    //  InclemnetWeatherViewReportController
       
    LeasingAgentReportController *LeaseProperty_Obj;
    
    DailyActivityCheklistViewController *DailyAct_obj;
    
    NSMutableData *webData;
    
    NSMutableDictionary *Cameradic;
    
    bool IsWork,LandScapebool,Portiatebool; 
    
    NSString *messageanddate,*Finalstr;
    
    UIImage *temp_img;
    
    NSData *imageData;
    
    UIImagePickerController *imagePicker;
    
    IBOutlet UIImageView *ImageVie;
    
    UIPopoverController *popover;
    
    UIImageView *photo1;
    
    NSMutableArray *Imagearr,*ImageArray_temp;
    
    int phototype,no;
    
    
    LendiPropertyAppDelegate *app;
}

//-(void)Getimage;

@property (nonatomic,retain) IBOutlet UILabel *lblHeader,*DateMessageLabel,*FirstMessageLabel,
*SecondMessageLabel;

@property (nonatomic, retain) IBOutlet UITableView *tblView;

@property (nonatomic, retain) IBOutlet UITextView *txtView;

@property (nonatomic, retain) IBOutlet UITextField *txtProperty,*txtDate,*txtdate1,*txtdate2;

@property (nonatomic, retain) IBOutlet UIImageView *imgView;

@property (nonatomic, retain)  IBOutlet UIButton *CreateNewReportebtn,*ViewReportbtn,*PhotoAlbumbtn,*Sendmsgbtn,*SendAlertbtn,*viewalertbtn;

@property(nonatomic,retain) IBOutlet UIImageView *ImageVie;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;



-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinnerforlandscape;

-(void) openPOP:(int)_tag;

-(void) openNextVC:(int)_vcTag;

-(void) showViewController:(int)_int;

-(void) openMail;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void) rotatingPotrait;

-(void) rotatingLandscape;

-(IBAction)clickCreateNewReport:(id)sender;

-(IBAction)clickViewReport:(id)sender;

-(IBAction)clickPhotoAlbum:(id)sender;

-(IBAction)clickSendMessage:(id)sender;

-(IBAction)clickSendAlert:(id)sender;

-(IBAction)vieAlertServices:(id)sender;

- (UIImage *)fixOrientation;

@end

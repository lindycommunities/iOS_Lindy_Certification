//
//  ApartmentInspectionViewController.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpinnerModal_iPad.h"
#import "SBJSON.h"
#import "ParserClass.h"
#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import "Camera_ImageViewController.h"
#import "LendiPropertyAppDelegate.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "SpinnerModal_iPad.h"
#import "ASIFormDataRequest.h"


@interface ApartmentInspectionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSURLConnectionDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>

{
    
    IBOutlet UITextView *DecspText;
    
    IBOutlet UITableView *SelectedTableView,*DamageTypeTableView,*DamageCostTableView;
    
    IBOutlet UIButton *chekbox1,*chekbox2,*chekbox3,*chekbox4,*chekbox5,*chekbox6,*chekbox7,*chekbox8;
    
    IBOutlet UILabel *ActivityLbl,*Buildinglb,*Roomtypelbl,*DamageTypelbl,*DamageCostlbl;
    
    IBOutlet UITextField *Unitno_txt,*Residentname_txt;
    
    IBOutlet UILabel *Total_lbl;
    
          
    UIImagePickerController *imagePicker;
    
    UIViewController *viewControllerTest;
    
    UILabel *lblHeaderTest;
    
    UITableView *tblViewTest;
      
    UIButton *close_btn;
    
    UIPopoverController *popView;
    
    UIImage *temp_img;
    
    SpinnerModal_iPad *spinnerView;
    
    ParserClass *objParser;
    
    NSData *imageData;
    
    NSMutableDictionary *Cameradic;
    
    NSMutableData *webData;
    
    NSMutableArray *ActivitesArray,*PikerArray,*ImageArray_temp,*PropertyID,*ActivitesIDArray;
    
    NSMutableArray *RoomtypeArray,*DamageTypeArray,*PaintingCostArray,*CarpetCostArray,*LockArray;
    
    NSMutableArray *FailuerToreturnArray,*BathroomArray,*KitchenArray,*DoorsArray;
    
    NSMutableArray *MiscellaneousArray,*DamageTypeSelectedArray,*DamageCostSelectedArray;
    
    NSString *Reportid,*SelectedDamageType,*SelectedDamageCost;
    
    BOOL propertycheck,submitdata,activityload,messagechek,InsertingDamageDetails,getthereportid;
    
    int tag,oldindex,arrayval;
    
    int lastTotal;
    
    bool chkBox1,chkBox2,chkBox3,chkBox4,chkBox5,chkBox6,chkBox7,chkBox8;
    
    NSIndexPath *checkedIndexPath,*TablesecondIndexpath;
    
}

- (IBAction) AttachPhoto;

- (IBAction) ActivityClcick;

- (IBAction) BuildingClick;

- (IBAction) CheckBoxBtnClick:(id)sender;

- (IBAction) RoomTypeBtnClick:(id)sender;

- (IBAction) DamageTypeBtnClick:(id)sender;

- (void) SetAllArray;

- (void) LoadActivites;

- (void) LoadUserProperty;

- (void) Getimage;

- (void) ImageUpload;

- (void) postmessage;

- (UIImage *) fixOrientation;

- (void) OpenPOP;

- (void) stopSpinner;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

- (void)AddTheDamageDetailsWithTheDamageType:(NSString *)_damageType AnWithDamageCost:(NSString *)_damageCost;

@property (nonatomic,retain)IBOutlet UILabel *Total_lbl;

@property (nonatomic,retain)NSIndexPath *checkedIndexPath,*TablesecondIndexpath;

@property (nonatomic,retain) IBOutlet UITableView *SelectedTableView,*DamageTypeTableView,*DamageCostTableView;

@property (nonatomic,retain) IBOutlet UIView *DamageViewPopup;

@property (nonatomic,retain) IBOutlet UIButton *chekbox1,*chekbox2,*chekbox3,*chekbox4;

@property (nonatomic,retain) IBOutlet UIButton *chekbox5,*chekbox6,*chekbox7,*chekbox8;

@property (nonatomic,retain) IBOutlet UITextField *Unitno_txt,*Residentname_txt;

@property (nonatomic,retain) IBOutlet UITextView *DecspText;

@property (nonatomic,retain) IBOutlet UILabel *ActivityLbl,*Buildinglb,*Roomtypelbl;

@property (nonatomic,retain) IBOutlet UILabel*DamageTypelbl,*DamageCostlbl;

@property (nonatomic,retain) IBOutlet UIScrollView *ScrollView;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;


@end

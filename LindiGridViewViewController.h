//
//  LindiGridViewViewController.h
//  LindiCertification
//
//  Created by Sudip Deshpande on 07/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spinner_iPad_Landscape.h"
#import "DatePickerViewController.h"

@interface LindiGridViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,WsCompleteDelegate,DatePickerViewControllerDelegate>

{
    NSDictionary *jsonResultObject;
    
    IBOutlet UITableView *Tblview;
    NSString *Cert_Type;
    Spinner_iPad_Landscape *spinnerlandscape;
    IBOutlet UIScrollView *Scrollview;

    IBOutlet UIView *ViewUpdateInspection;
    IBOutlet UITextField *TxtInspectionDate;
    IBOutlet UIButton *BtnCheck;
    int check;
    
    NSDateFormatter * dateofbirthformat;
    NSDateFormatter * dateofbirthformat1;
    NSString *DOBYYMMDD,*certificateID,*flag;

    IBOutlet UILabel *LblTotalRecords;

}
- (IBAction)ShowDatePicker:(id)sender;
@property(nonatomic,retain)NSDictionary *jsonResultObject;
@property(nonatomic,retain)NSString *Cert_Type,*DOBYYMMDD,*certificateID,*flag;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;

- (IBAction)HideInspectionBox:(id)sender;
- (IBAction)UpdateInspection:(id)sender;
- (IBAction)ToggleCheck:(id)sender;

-(IBAction)back:(id)sender;
@end

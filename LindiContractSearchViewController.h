//
//  LindiSearchViewController.h
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownView.h"
#import "VisibleFormViewController.h"
@interface LindiContractSearchViewController : VisibleFormViewController<WsCompleteDelegate,DropDownViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *arrbuildingid,*arrbuilding,*arrtypeid,*arrtype,*arrcontractorid,*arrcontractor;
    IBOutlet UILabel *LblBuilding;
    IBOutlet UIButton *BtnBuilding;
    IBOutlet UILabel *LblCertificate;
    IBOutlet UILabel *LblContractor;
    NSDictionary *jsonResultObject;
    NSString *strflag;
    NSString *id1,*id2,*id3;
    DropDownView *dropDown;
    IBOutlet UITextField *TxtContractName;

    IBOutlet UILabel *LblBuildingNo;
    IBOutlet UITextField *TxtMeterNo;
    IBOutlet UITextField *TxtAccountNO;
    IBOutlet UILabel *LblContracttype;
    IBOutlet UISegmentedControl *segfullyExcecuted;
    IBOutlet UISegmentedControl *segisLindy;
    NSString *isLindy,*fullyExcecuted;
}
-(IBAction)back:(id)sender;
@property(nonatomic,retain)NSMutableArray *arrbuilding,*arrtype,*arrtypeid,*arrcontractorid,*arrcontractor,*arrbuildingid,*arrcontracttype;
- (IBAction)Building:(id)sender;
@property(nonatomic,retain)NSDictionary *jsonResultObject;
- (IBAction)Certificate:(id)sender;
- (IBAction)Contractor:(id)sender;
- (IBAction)Search:(id)sender;
- (IBAction)SelectContracttype:(id)sender;
- (IBAction)SelectBuildingno:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)segisLindyBtnTapped:(id)sender;
- (IBAction)segfullyExcecutedBtnTapped:(id)sender;
@property(nonatomic,retain)NSString *isLindy,*fullyExcecuted;

@end

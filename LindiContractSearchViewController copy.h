//
//  LindiSearchViewController.h
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownView.h"

@interface LindiContractSearchViewController : UIViewController<WsCompleteDelegate,DropDownViewDelegate>
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

}
-(IBAction)back:(id)sender;
@property(nonatomic,retain)NSMutableArray *arrbuilding,*arrtype,*arrtypeid,*arrcontractorid,*arrcontractor,*arrbuildingid;
- (IBAction)Building:(id)sender;
@property(nonatomic,retain)NSDictionary *jsonResultObject;
- (IBAction)Certificate:(id)sender;
- (IBAction)Contractor:(id)sender;
- (IBAction)Search:(id)sender;

@end

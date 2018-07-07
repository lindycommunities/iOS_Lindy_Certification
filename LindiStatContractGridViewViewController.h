//
//  LindiGridViewViewController.h
//  LindiCertification
//
//  Created by Sudip Deshpande on 07/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spinner_iPad_Landscape.h"
#import "DropDownView.h"

@interface LindiStatContractGridViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,WsCompleteDelegate,DropDownViewDelegate>

{
    NSDictionary *jsonResultObject;
    
    IBOutlet UITableView *Tblview;
    NSString *Cert_Type;
    Spinner_iPad_Landscape *spinnerlandscape;
    DropDownView *dropDown;

    IBOutlet UIScrollView *Scrolview;

    IBOutlet UILabel *LblStatus;
    NSString *strflag;
    NSString *id1,*id2;
    NSMutableArray *valuesContracts;


    IBOutlet UILabel *LblExpiredContract;
    IBOutlet UILabel *LblActiveContract;
    IBOutlet UIView *ViewRedColor;
    IBOutlet UIView *ViewGreenColor;
    IBOutlet UILabel *LblBuildingName;
    IBOutlet UILabel *LblContractType;
    GlobalJSONParser *json;
}
@property(nonatomic,retain)NSMutableArray *arrbuilding,*arrtype,*arrtypeid,*arrcontractorid,*arrcontractor,*arrbuildingid,*arrcontracttype;

@property(nonatomic,retain)NSDictionary *jsonResultObject;
@property(nonatomic,retain)NSString *Cert_Type,*StrStatus;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;
- (IBAction)Search:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)SelectBuilding:(id)sender;
- (IBAction)SelectContractType:(id)sender;


-(IBAction)back:(id)sender;
@end

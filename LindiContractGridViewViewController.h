//
//  LindiGridViewViewController.h
//  LindiCertification
//
//  Created by Sudip Deshpande on 07/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spinner_iPad_Landscape.h"

@interface LindiContractGridViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,WsCompleteDelegate>

{
    NSDictionary *jsonResultObject;
    
    IBOutlet UITableView *Tblview;
    NSString *Cert_Type;
    Spinner_iPad_Landscape *spinnerlandscape;
    IBOutlet UIScrollView *Scrolview;

    IBOutlet UILabel *LblStatus;
    IBOutlet UILabel *LblTotalRecords;

}
@property(nonatomic,retain)NSDictionary *jsonResultObject;
@property(nonatomic,retain)NSString *Cert_Type,*StrStatus;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;


-(IBAction)back:(id)sender;
@end

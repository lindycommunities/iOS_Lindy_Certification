//
//  RankingViewController.h
//  Toofani Jokes
//
//  Created by S S D on 27/04/16.
//  Copyright © 2016 ToofaniJokes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spinner_iPad_Landscape.h"
#import "DropDownView.h"

@interface LeasingAgentListViewController : UIViewController<WsCompleteDelegate,UITableViewDelegate,UITableViewDataSource,DropDownViewDelegate>
{
    Spinner_iPad_Landscape *spinnerlandscape;
    GlobalJSONParser *json;
    IBOutlet UITableView *TableView;
    IBOutlet UILabel *LblCommunity;
    DropDownView *dropDown;
    NSString *strflag;

}
- (IBAction)Back:(id)sender;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;
@property (nonatomic, retain) NSDictionary *TotalData;
@property(nonatomic,retain)NSMutableArray *arrbuilding,*arrbuildingid;
@property(nonatomic,retain)NSString *buildingid;

- (IBAction)FilterData:(id)sender;

@end

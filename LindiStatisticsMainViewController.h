//
//  LindiMainViewController.h
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spinner_iPad_Landscape.h"

@interface LindiStatisticsMainViewController : UIViewController<WsCompleteDelegate>
{
    NSDictionary *jsonResultObject;

    NSMutableArray *valuesContracts,*ValuesCertificates;
}
-(IBAction)click:(id)sender;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;
@property(nonatomic,retain)NSDictionary *jsonResultObject;
- (IBAction)StatCert:(id)sender;
- (IBAction)StatContract:(id)sender;

@end

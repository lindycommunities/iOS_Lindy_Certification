//
//  MenuTableViewCell.m
//  Toofani Jokes
//
//  Created by S S D on 18/02/16.
//  Copyright © 2016 ToofaniJokes. All rights reserved.
//


#import "LeasingAgentTableViewCell.h"

@implementation LeasingAgentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self setNeedsLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)dealloc {
//    [_LblLindyComminity release];
//    [_LblApartmentName release];
//    [_LblAdjustmentCategory release];
//    [_LblApartmentNo release];
//    [_LblAdjustmentRate release];
//    [_BtnEidt release];
//    [super dealloc];
//}
@end

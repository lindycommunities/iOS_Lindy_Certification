//
//  NetworkConnection.h
//  Demo
//
//  Created by Training Macvin on 1/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConnection : NSObject 
{
	BOOL isReachable;
}
@property (nonatomic, readonly) BOOL isReachable;

//-(id)initNetworkStatus;

-(id)initConnection;


@end

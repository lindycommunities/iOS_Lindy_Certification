//
//  NetworkConnection.m
//  Demo
//
//  Created by Training Macvin on 1/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ReachabilityNet.h"
#import "NetworkConnection.h"


@implementation NetworkConnection

@synthesize isReachable;

//-(id)initNetworkStatus
//{
//	self==[super init];
//	[[Reachability sharedReachability] setHostName:@"www.google.com"];
//	
//	NetworkStatus internetStatus = [[Reachability sharedReachability] remoteHostStatus];
//	
//	if ((internetStatus != ReachableViaWiFiNetwork) && (internetStatus != ReachableViaCarrierDataNetwork))
//	{
//		//UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You require an internet connection via WiFi or cellular network for location finding to work." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//		//		[myAlert show];
//		//		[myAlert release];
//		
//		isReachable= NO;
//	}
//	else {
//		isReachable= YES;
//	}
//	return self;
//}
//


-(id)initConnection
{
	self==[super init];
	[[ReachabilityNet sharedReachability] setHostName:@"www.google.com"];//www.google.com"];
	
	NetworkStatus internetStatus = [[ReachabilityNet sharedReachability] remoteHostStatus];
	
	if ((internetStatus != ReachableViaWiFiNetwork) && (internetStatus != ReachableViaCarrierDataNetwork))
	{
		//UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You require an internet connection via WiFi or cellular network for location finding to work." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		//		[myAlert show];
		//		[myAlert release];
		
		isReachable= NO;
	}
	else {
		isReachable= YES;
	}
	return self;
	
	
}

@end

//
//  GDYViewController.m
//  GDYSDK
//
//  Created by Dayao on 10/09/2018.
//  Copyright (c) 2018 Dayao. All rights reserved.
//

#import "GDYViewController.h"

// import 'GDYSDK' 使用
//#import <GDYSDK/GDYSDK.h>
#import <GDYSDK/GDYSDKSystemMgr.h>


@interface GDYViewController ()

@end

@implementation GDYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *udid =  [GDYSDKSystemMgr getDeviceUDIDValueString];
    NSString *carrierStr = [GDYSDKSystemMgr getDeviceCarrierName];
    NSString *model = [GDYSDKSystemMgr getDeviceModel];
    NSString *osVersion = [GDYSDKSystemMgr getDeviceOSVersion];
    NSString *wifiName = [GDYSDKSystemMgr getDeviceWifiName];
    NSString *wifiMac = [GDYSDKSystemMgr getDeviceWifiMac];
    NSString *ipAddress = [GDYSDKSystemMgr getDeviceIPAddress:NO];
    
    NSLog(@"log-test");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

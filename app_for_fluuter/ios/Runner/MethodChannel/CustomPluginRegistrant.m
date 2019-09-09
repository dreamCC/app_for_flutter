//
//  CustomPluginRegistrant.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/8/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "CustomPluginRegistrant.h"
#import "CustomPluginManager.h"

@implementation CustomPluginRegistrant

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {

    [CustomPluginManager registerWithRegistrar:[registry registrarForPlugin:@"CustomPluginManager"]];

}

@end

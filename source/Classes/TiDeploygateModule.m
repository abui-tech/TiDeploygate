/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiDeploygateModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiDeploygateModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"08fdf712-667c-450f-a974-558dc26e5e99";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.deploygate";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)setup:(id)args
{
    ENSURE_UI_THREAD(setup, args);
    ENSURE_ARG_COUNT(args, 3);
    
    NSString* author = [TiUtils stringValue:[args objectAtIndex:0]];
    NSString* key = [TiUtils stringValue:[args objectAtIndex:1]];
    Boolean userInfomationEnabled = [TiUtils boolValue:[args objectAtIndex:2]] ? YES : NO;
    
    NSLog(@"[INFO] author: %@, key: %@", author, key);
    [[DeployGateSDK sharedInstance] launchApplicationWithAuthor:author key:key userInfomationEnabled:userInfomationEnabled];
}

-(void)remoteLog:(id)args
{
    ENSURE_UI_THREAD(remoteLog, args);
    ENSURE_ARG_COUNT(args, 1);
    
    NSString* message = [TiUtils stringValue:[args objectAtIndex:0]];
    DGSLog(@"[LOG]: %@: %s [Line %d]", message, __PRETTY_FUNCTION__, __LINE__);
}

-(void)recieveURLScheme:(id)args
{
    ENSURE_UI_THREAD(recieveURLScheme, args);
    ENSURE_ARG_COUNT(args, 1);
    
    NSString* url = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[INFO] url: %s", url);
    
    [[DeployGateSDK sharedInstance] handleOpenUrl:[NSURL URLWithString:url] sourceApplication:@"com.apple.mobilesafari" annotation:nil];
}

-(void)userAuthorization:(id)args
{
    ENSURE_UI_THREAD(userAuthorization, args);
    return [[DeployGateSDK sharedInstance] userAuthorization];
}

@end

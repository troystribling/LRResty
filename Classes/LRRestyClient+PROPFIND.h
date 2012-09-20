//
//  LRRestyClient+PROPFIND.h
//  LRResty
//
//  Created by Troy Stribling on 9/20/12.
//
//

#import "LRRestyClient.h"
#import "LRRestyTypes.h"

@class LRRestyRequest;

@interface LRRestyClient (PROPFIND)

#pragma mark -
#pragma mark Blocks API

/**
 Performs a PROPFIND request on URL resource with block response handling.
 @param urlString   The URL resource to delete.
 @param payload     object containing request payload.
 @param block       The response handler.
 @returns The request object.
 */
- (LRRestyRequest *)propfind:(NSString *)urlString payload:(NSDictionary *)payload withBlock:(LRRestyResponseBlock)block;

/**
 Performs a PROPFIND request on URL resource with block response handling.
 @param urlString   The URL resource to delete.
 @param payload     object containing request payload.
 @param headers     A dictionary of HTTP request headers.
 @param block       The response handler.
 @returns The request object.
 */
- (LRRestyRequest *)propfind:(NSString *)urlString payload:(NSDictionary *)payload headers:(NSDictionary *)headers withBlock:(LRRestyResponseBlock)block;

#pragma mark -
#pragma mark Synchronous API

/**
 Performs a *synchronous* PROPFIND request on URL, blocking the calling thread.
 @param urlString   The URL to request.
 @param payload     object containing request payload.
 @returns The response to the request.
 */
- (LRRestyResponse *)propfind:(NSString *)urlString payload:(NSDictionary *)payload;

/**
 Performs a *synchronous* PROPFIND request on URL, blocking the calling thread.
 @param urlString   The URL to request.
 @param payload     object containing request payload.
 @param headers     A dictionary of HTTP request headers.
 @returns The response to the request.
 */
- (LRRestyResponse *)propfind:(NSString *)urlString payload:(NSDictionary *)payload headers:(NSDictionary *)headers;

@end

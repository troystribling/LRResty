//
//  LRRestyClient+OPTIONS.h
//  LRResty
//
//  Created by Troy Stribling on 9/20/12.
//
//

#import "LRRestyClient.h"
#import "LRRestyTypes.h"

@class LRRestyRequest;

@interface LRRestyClient (OPTIONS)

#pragma mark -
#pragma mark Blocks API

/**
 Performs a OPTIONS request on URL resource with block response handling.
 @param urlString   The URL resource to delete.
 @param block       The response handler.
 @returns The request object.
 */
- (LRRestyRequest *)options:(NSString *)urlString withBlock:(LRRestyResponseBlock)block;

/**
 Performs a OPTIONS request on URL resource with block response handling.
 @param urlString   The URL resource to delete.
 @param headers     A dictionary of HTTP request headers.
 @param block       The response handler.
 @returns The request object.
 */
- (LRRestyRequest *)options:(NSString *)urlString headers:(NSDictionary *)headers withBlock:(LRRestyResponseBlock)block;

#pragma mark -
#pragma mark Synchronous API

/**
 Performs a *synchronous* OPTIONS request on URL resource, blocking the calling thread.
 @param urlString   The URL resource to delete.
 @returns The response to the request.
 */
- (LRRestyResponse *)options:(NSString *)urlString;

/**
 Performs a *synchronous* OPTIONS request on URL, blocking the calling thread.
 @param urlString   The URL to request.
 @param parameters  A dictionary of query string parameters.
 @param headers     A dictionary of HTTP request headers.
 @returns The response to the request.
 */
- (LRRestyResponse *)options:(NSString *)urlString headers:(NSDictionary *)headers;


@end

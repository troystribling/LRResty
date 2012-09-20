//
//  LRRestyClient+OPTIONS.m
//  LRResty
//
//  Created by Troy Stribling on 9/20/12.
//
//

#import "LRRestyClient+OPTIONS.h"
#import "LRRestyClientProxyDelegate.h"
#import "LRRestyClientBlockDelegate.h"
#import "LRRestyClientStreamingDelegate.h"
#import "LRSynchronousProxy.h"

@implementation LRRestyClient (OPTIONS)

#pragma mark -
#pragma mark Blocks API

- (LRRestyRequest *)options:(NSString *)urlString withBlock:(LRRestyResponseBlock)block;
{
    return [self options:urlString headers:nil withBlock:block];
}

- (LRRestyRequest *)options:(NSString *)urlString headers:(NSDictionary *)headers withBlock:(LRRestyResponseBlock)block;
{
    return [HTTPClient OPTIONS:[NSURL URLWithString:urlString] headers:headers delegate:[LRRestyClientBlockDelegate delegateWithBlock:block]];
}

#pragma mark -
#pragma mark Synchronous API

- (LRRestyResponse *)options:(NSString *)urlString;
{
    return [self performAsynchronousBlockWithTimeout:globalTimeoutInterval andReturnResultWhenReady:^(id *result, dispatch_semaphore_t semaphore)
            {
                [self options:urlString withBlock:^(LRRestyResponse *response) {
                    LRSYNCHRONOUS_PROXY_NOTIFY_CONDITION(result, [response retain], semaphore);
                }];
            }];
}

- (LRRestyResponse *)options:(NSString *)urlString headers:(NSDictionary *)headers;
{
    return [self performAsynchronousBlockAndReturnResultWhenReady:^(id *result, dispatch_semaphore_t semaphore)
            {
                [self options:urlString headers:headers withBlock:^(LRRestyResponse *response) {
                    LRSYNCHRONOUS_PROXY_NOTIFY_CONDITION(result, [response retain], semaphore);
                }];
            }];
}

@end

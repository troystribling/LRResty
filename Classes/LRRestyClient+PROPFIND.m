//
//  LRRestyClient+PROPFIND.m
//  LRResty
//
//  Created by Troy Stribling on 9/20/12.
//
//

#import "LRRestyClient+PROPFIND.h"
#import "LRRestyClientBlockDelegate.h"
#import "LRRestyClientProxyDelegate.h"
#import "LRSynchronousProxy.h"

@implementation LRRestyClient (PROPFIND)

#pragma mark -
#pragma mark Blocks API
- (LRRestyRequest *)propfind:(NSString *)urlString payload:(NSDictionary *)payload withBlock:(LRRestyResponseBlock)block;
{
    return [self propfind:urlString payload:payload headers:nil withBlock:block];
}

- (LRRestyRequest *)propfind:(NSString *)urlString payload:(NSDictionary *)payload headers:(NSDictionary *)headers withBlock:(LRRestyResponseBlock)block;
{
    return [HTTPClient PROPFIND:[NSURL URLWithString:urlString] payload:payload headers:headers delegate:[LRRestyClientBlockDelegate delegateWithBlock:block]];
}

#pragma mark -
#pragma mark Synchronous API
- (LRRestyRequest *)propfind:(NSString *)urlString payload:(NSDictionary *)payload;
{
    return [self performAsynchronousBlockWithTimeout:globalTimeoutInterval + 1 andReturnResultWhenReady:^(id *result, dispatch_semaphore_t semaphore)
            {
                [self propfind:urlString payload:payload withBlock:^(LRRestyResponse *response) {
                    LRSYNCHRONOUS_PROXY_NOTIFY_CONDITION(result, [response retain], semaphore);
                }];
            }];
}

- (LRRestyRequest *)propfind:(NSString *)urlString payload:(NSDictionary *)payload headers:(NSDictionary *)headers;
{
    return [self performAsynchronousBlockAndReturnResultWhenReady:^(id *result, dispatch_semaphore_t semaphore)
            {
                [self propfind:urlString payload:payload headers:headers withBlock:^(LRRestyResponse *response) {
                    LRSYNCHRONOUS_PROXY_NOTIFY_CONDITION(result, [response retain], semaphore);
                }];
            }];
}

@end

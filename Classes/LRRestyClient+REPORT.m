//
//  LRRestyClient+REPORT.m
//  LRResty
//
//  Created by Troy Stribling on 9/20/12.
//
//

#import "LRRestyClient+REPORT.h"
#import "LRRestyClientBlockDelegate.h"
#import "LRRestyClientProxyDelegate.h"
#import "LRSynchronousProxy.h"

@implementation LRRestyClient (REPORT)

#pragma mark -
#pragma mark Blocks API
- (LRRestyRequest *)report:(NSString *)urlString payload:(id)payload withBlock:(LRRestyResponseBlock)block;
{
    return [self report:urlString payload:payload headers:nil withBlock:block];
}

- (LRRestyRequest *)report:(NSString *)urlString payload:(id)payload headers:(NSDictionary *)headers withBlock:(LRRestyResponseBlock)block;
{
    return [HTTPClient REPORT:[NSURL URLWithString:urlString] payload:payload headers:headers delegate:[LRRestyClientBlockDelegate delegateWithBlock:block]];
}

#pragma mark -
#pragma mark Synchronous API
- (LRRestyRequest *)report:(NSString *)urlString payload:(NSDictionary *)payload;
{
    return [self performAsynchronousBlockWithTimeout:globalTimeoutInterval + 1 andReturnResultWhenReady:^(id *result, dispatch_semaphore_t semaphore)
            {
                [self report:urlString payload:payload withBlock:^(LRRestyResponse *response) {
                    LRSYNCHRONOUS_PROXY_NOTIFY_CONDITION(result, [response retain], semaphore);
                }];
            }];
}

- (LRRestyRequest *)report:(NSString *)urlString payload:(NSDictionary *)payload headers:(NSDictionary *)headers;
{
    return [self performAsynchronousBlockAndReturnResultWhenReady:^(id *result, dispatch_semaphore_t semaphore)
            {
                [self report:urlString payload:payload headers:headers withBlock:^(LRRestyResponse *response) {
                    LRSYNCHRONOUS_PROXY_NOTIFY_CONDITION(result, [response retain], semaphore);
                }];
            }];
}

@end

//
// ERTWebService.h
// ExchangeRates
//

#import <Foundation/Foundation.h>

@class ERTWebResponse;
@class ERTWebRequestInfo;
@class AFHTTPRequestOperation;

static NSString * const HTTPMethodGET = @"GET";
static NSString * const HTTPMethodPOST = @"POST";
static NSString * const HTTPMethodPATCH = @"PATCH";
static NSString * const HTTPMethodPUT = @"PUT";
static NSString * const HTTPMethodDELETE = @"DELETE";

typedef void (^ERTWebServiceCompletion)(NSError *error, id result);

@protocol ERTWebRequestModifier <NSObject>

@required

- (void)modifyRequest:(NSMutableURLRequest *)request;

@end


@interface ERTWebService : NSObject

+ (instancetype)defaultWebService;

- (void)sendRequestWithRequestInfo:(ERTWebRequestInfo *)requestInfo
                        completion:(ERTWebServiceCompletion)completion;

@end

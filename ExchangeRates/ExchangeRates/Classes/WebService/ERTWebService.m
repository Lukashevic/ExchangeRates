//
// ERTWebService.m
// ExchangeRates
//

#import "ERTWebService.h"
#import "ERTWebRequestInfo.h"
#import "AFHTTPRequestOperationManager.h"

NSString * const ERTAppDomen = @"com.ExchangeRates.app";
NSString * const ERTBaseUrl = @"http://api.fixer.io";

@implementation ERTWebService {
  NSString *baseUrlString;
  AFHTTPRequestOperationManager *_manager;
  BOOL isReachable;
}

- (id)init {

  self = [super init];
  
  if (self) {
    isReachable = YES;
    baseUrlString = ERTBaseUrl;
  }

  return self;
}

// TODO: update to URLSessionManager
- (AFHTTPRequestOperationManager *)manager {

  if (!_manager) {
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _manager.requestSerializer.timeoutInterval = 800;
    _manager.securityPolicy.allowInvalidCertificates = YES;
    
    [_manager.reachabilityManager startMonitoring];
    [_manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      switch (status) {
        case AFNetworkReachabilityStatusUnknown: {
          isReachable = NO;
          break;
        }
        case AFNetworkReachabilityStatusNotReachable: {
          isReachable = NO;
          break;
        }
        case AFNetworkReachabilityStatusReachableViaWWAN: {
          isReachable = YES;
          break;
        }
        case AFNetworkReachabilityStatusReachableViaWiFi: {
          isReachable = YES;
          break;
        }
        default: {
          break;
        }
      }
    }];
  }

  return _manager;
}

#pragma mark -

+ (instancetype)defaultWebService {
  static dispatch_once_t pred;
  static id sharedObject;\
  dispatch_once(&pred, ^{
    sharedObject = ([ERTWebService new]);
  });
  return sharedObject;
}

- (void)sendRequestWithRequestInfo:(ERTWebRequestInfo *)requestInfo
                        completion:(ERTWebServiceCompletion)completion {

  [self sendRequestWithRequestInfo:requestInfo completion:completion];
}

- (BOOL)isReachable {
  
  return NO;
}


- (NSURLRequest*)requestWithRequestInfo:(ERTWebRequestInfo*)requestInfo {

  NSURL *url = [self manager].baseURL;

  if (requestInfo.path) {
    url = [NSURL URLWithString:[url.absoluteString stringByAppendingPathComponent:requestInfo.path]];
  }

  AFHTTPRequestSerializer *serializer = [self manager].requestSerializer;

  NSDictionary *parameters = (requestInfo.parameters.count > 0) ? requestInfo.parameters : nil;

  NSMutableURLRequest *request = [serializer requestWithMethod:requestInfo.httpMethod
                                                     URLString:url.absoluteString
                                                    parameters:parameters
                                                         error:nil];
  
  DDLogInfo(@"\n\n%@ %@\n%@\n",
            requestInfo.httpMethod,
            url,
            [self jsonStringWithParameters:parameters]);

  return request;
}

- (void)sendRequestWithMethod:(NSString *)httpMethod
                         path:(NSString *)path
                   parameters:(NSDictionary *)parameters
                   completion:(ERTWebServiceCompletion)completion {

  ERTWebRequestInfo *requestInfo = [ERTWebRequestInfo requestWithHttpMethod:httpMethod
                                                                       path:path
                                                                 parameters:parameters];

  [self sendRequestWithRequestInfo:requestInfo
                        completion:completion];
}

- (NSString *)jsonStringWithParameters:(NSDictionary *)parameters {

  if (!parameters) {
    return @"";
  }

  NSData *data = [NSJSONSerialization dataWithJSONObject:parameters
                                                 options:NSJSONWritingPrettyPrinted
                                                   error:nil];
  NSString *string = [[NSString alloc]
          initWithBytes:data.bytes
                 length:data.length
               encoding:NSUTF8StringEncoding];
  return string;
}

- (NSString *)prettyJsonStringWithString:(NSString *)jsonString {

  NSData *jsonData = [NSData dataWithBytes:jsonString.UTF8String
                                    length:jsonString.length];
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:0
                                                         error:nil];

  return [self jsonStringWithParameters:dict];
}

- (NSError *)connectionError {
  
  NSString * message = NSLocalizedStringFromTable(@"reachability_error", @"WebServiceErrors", nil);
  NSString * reason = NSLocalizedStringFromTable(@"reachability_error_title", @"WebServiceErrors", nil);
  NSError * error = [[NSError alloc] initWithDomain:ERTAppDomen
                                               code:0
                                           userInfo:@{NSLocalizedDescriptionKey : message,
                                                      NSLocalizedFailureReasonErrorKey : reason}];
  return error;
}

@end
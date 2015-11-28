//
// ERTWebService.m
// ExchangeRates
//

#import "ERTWebService.h"
#import "ERTWebRequestInfo.h"
#import "AFHTTPRequestOperationManager.h"

NSString * const ERTAppDomen = @"com.exchangerates.app";
NSString * const ERTBaseUrl = @"http://api.fixer.io/latest";

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
- (void)postReachableNotification {
  if (!isReachable) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [[NSNotificationCenter defaultCenter] postNotificationName:ERTReachabilityStatusReachableNotification
                                                          object:nil];
    });
  }
}

- (AFHTTPRequestOperationManager *)manager {

  if (!_manager) {
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString] ;
    _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _manager.requestSerializer.timeoutInterval = 800;
    _manager.securityPolicy.allowInvalidCertificates = YES;
    
    [_manager.reachabilityManager startMonitoring];
    
    __weak ERTWebService * weakSelf = self;
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
          [weakSelf postReachableNotification];
          isReachable = YES;
          break;
        }
        case AFNetworkReachabilityStatusReachableViaWiFi: {
          [weakSelf postReachableNotification];
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

  if (!isReachable) {
    if (completion) {
      completion([self connectionError], nil);
    }
    return;
  }
  
  void (^successBlock)(AFHTTPRequestOperation *, id) =
  ^(AFHTTPRequestOperation *operation, id responseObject) {
    
        DDLogInfo(@"\nsuccess response : %@\n",
                  [self prettyJsonStringWithString:operation.responseString]);
    
    if (completion) {
      completion(nil, operation.responseObject);
    }
  };
  
  void (^failureBlock)(AFHTTPRequestOperation *, NSError *) =
  ^(AFHTTPRequestOperation *operation, NSError *error) {
    
    DDLogInfo(@"\nfailure response : %@\n %@\n",
              [self prettyJsonStringWithString:operation.responseString],
              error);
    
    if (completion) {
      completion(error, nil);
    }
  };
  
  AFHTTPRequestOperation *operation =
    [[self manager] HTTPRequestOperationWithRequest:[self requestWithRequestInfo:requestInfo]
                                            success:successBlock
                                            failure:failureBlock];
  
  [operation start];
}

- (BOOL)isReachable {
  
  return NO;
}


- (NSURLRequest*)requestWithRequestInfo:(ERTWebRequestInfo*)requestInfo {

  NSURL *url = [NSURL URLWithString:baseUrlString] ;
  if (requestInfo.path) {
    url = [url URLByAppendingPathComponent:requestInfo.path];
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
  
  NSString * message = NSLocalizedStringFromTable(@"reachability_error", @"ERTWebServiceErrors", nil);
  NSString * reason = NSLocalizedStringFromTable(@"reachability_error_title", @"ERTWebServiceErrors", nil);
  NSError * error = [[NSError alloc] initWithDomain:ERTAppDomen
                                               code:0
                                           userInfo:@{NSLocalizedDescriptionKey : message,
                                                      NSLocalizedFailureReasonErrorKey : reason}];
  return error;
}

@end
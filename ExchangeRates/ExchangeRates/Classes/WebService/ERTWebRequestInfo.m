//
// ERTWebRequestInfo.m
// ExchangeRates
//

#import "ERTWebRequestInfo.h"
#import "AFURLRequestSerialization.h"


@implementation ERTWebRequestInfo {

}

+ (instancetype)requestWithHttpMethod:(NSString *)method
                                 path:(NSString *)path
                           parameters:(NSDictionary *)parameters {

  return [[ERTWebRequestInfo alloc] initWithHttpMethod:method
                                                  path:path
                                            parameters:parameters];
}

- (id)initWithHttpMethod:(NSString *)method
                    path:(NSString *)path
              parameters:(NSDictionary *)parameters {

  self = [super init];

  if (self) {
    _httpMethod = method;
    _path = path;
    _parameters = parameters;
  }

  return self;
}

@end
//
// ERTWebRequestInfo.h
// ExchangeRates
//

#import <Foundation/Foundation.h>

@protocol AFMultipartFormData;


@interface ERTWebRequestInfo : NSObject

@property (nonatomic, strong) NSString *httpMethod;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSDictionary *parameters;

+ (instancetype)requestWithHttpMethod:(NSString *)method
                                 path:(NSString *)path
                           parameters:(NSDictionary *)parameters;

- (id)initWithHttpMethod:(NSString *)method
                    path:(NSString *)path
              parameters:(NSDictionary *)parameters;

@end
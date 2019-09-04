//
//  ViewController.m
//  
//
//  Created by Anatoly Ryavkin on 18/07/2019.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webViewLoad.navigationDelegate=self;
    NSURL*url = [[NSURL alloc] initWithString:@"https://oauth.vk.com/authorize?"
                     "client_id=7062911&display=page&redirect_uri=https://oauth.vk.com/blank.html&"
                     "scope=140294&response_type=token&v=5.101&state=12345&revoke=1"];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    NSLog(@"request=%@",request);
    [self.webViewLoad loadRequest:request];
}

-(void)dealloc{
    self.webViewLoad.navigationDelegate=nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"segueUser"]){
        TableViewController*tvc = segue.destinationViewController;
        tvc.user = self.userLoad;
        UIBarButtonItem*fullUserInfo = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(fullUserInfo)];
        tvc.navigationItem.rightBarButtonItem = fullUserInfo;
        self.tvc=tvc;
    }
}

-(void)fullUserInfo{

    AVManagerRequest*manager =  [AVManagerRequest sharedManager];
    NSDictionary*dictionary = [[NSDictionary alloc]initWithObjectsAndKeys:

                            self.userLoad.ID,                                   @"user_ids",
                            @"photo_50,city,bdate",                          @"fields",
                            self.userLoad.token,                               @"access_token",
                            @"Nom",                                           @"name_case",
                            @"5.101",                                         @"v",
                                  nil];
    
    NSURLSessionDataTask*response = [manager responseAtRequestOfString:@"users.get" andDictionaryParametrs:dictionary andTvc:self.tvc andUser:self.userLoad];
    NSLog(@"response=%@",response.response);
}


#pragma mark - NavigationDelegat

    - (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
        NSURL*inputURL = [navigationResponse.response URL];
        NSString*strURL = [NSString stringWithFormat:@"%@",inputURL];
        NSLog(@"requestURL=%@",inputURL);
        if([strURL containsString:@"access_token="])
            self.userLoad = [[AVUser alloc]initWithURL:inputURL];
        decisionHandler(WKNavigationResponsePolicyAllow);
    }

@end

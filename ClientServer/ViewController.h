//
//  ViewController.h
//  
//
//  Created by Anatoly Ryavkin on 18/07/2019.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "AVManagerRequest.h"
#import "TableViewController.h"
#import "AVUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController<WKNavigationDelegate,WKUIDelegate>

@property (strong, nonatomic) IBOutlet WKWebView *webViewLoad;

@property (nonatomic) AVManagerRequest*managerRequest;

@property (nonatomic) AVUser*userLoad;

@property (weak) TableViewController*tvc;

@end

NS_ASSUME_NONNULL_END

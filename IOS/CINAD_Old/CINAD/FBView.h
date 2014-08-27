 
@interface FBView :   UIViewController    <UIWebViewDelegate>
{
    UIWebView *webView;
    UISegmentedControl *segmentedControl;
}

@property (nonatomic, strong)   UIWebView *webView;
@end

## NoNetworkShowPage
这是一个无网络自定义显示的界面、根据YesOrNo来进行显示

#### Use:
```
1、把仓库Down到本地.
2、把 CustomNoNetworkView这个类放到自己的工程里面
3、导入头文件 
#import "CustomNoNetworkView.h"
4、声明一个这个类的全局引用
@property (nonatomic, strong) CustomNoNetworkView * loadingFailPage;
5、这里是用懒加载的方式创建的
#pragma mark - 无网络页面的懒加载

- (CustomNoNetworkView *)loadingFailPage {
if (_loadingFailPage == nil) {
_loadingFailPage = [[CustomNoNetworkView alloc] init];
[self.view addSubview:_loadingFailPage];
[_loadingFailPage mas_makeConstraints:^(MASConstraintMaker *make) {
make.edges.equalTo(@0);
}];
}
return _loadingFailPage;
}

*** " 记得要在ViewDidLoad方法里调用懒加载、 且懒加载要放到所有UI初始化之后、这样无网络显示的界面才会在最上层 "
[self loadingFailPage];

6.在网络请求里的判断调用显示或隐藏的方法

[[NetWorkManager shareInstance]getHomePageTopDataCompletionHandler:^(BOOL flag, NSString *serMsg, id obj) {
if (flag) {
//有网络
[self.loadingFailPage hiddenLoadingFailPage];

}else {
//无网络
[self.loadingFailPage showLoadingFailPage];
}
}];

```

#### ~  此功能还能进一步的改进欢迎 Pull Requests、  如果觉得可以请点个Star~

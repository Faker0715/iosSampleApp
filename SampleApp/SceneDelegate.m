//
//  SceneDelegate.m
//  SampleApp
//
//  Created by faker on 2022/7/25.
//

#import "SceneDelegate.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
@interface SceneDelegate () <UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // UI的生命周期交给新增的Scene Delegate处理
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    
    // 建立底层tabbar
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    UIViewController *newsviewController = [[GTNewsViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
//    UIViewController *controller1 = [[UIViewController alloc] init];
//    navigationController.view.backgroundColor = [UIColor whiteColor];
//    navigationController.tabBarItem.title = @"新闻";
    newsviewController.view.backgroundColor = [UIColor whiteColor];
    newsviewController.tabBarItem.title = @"新闻";
    
    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
    
    GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];
    
    UIViewController *mineController = [[UIViewController alloc] init];
    mineController.view.backgroundColor = [UIColor greenColor];
    mineController.tabBarItem.title = @"我的";

    tabbarController.tabBar.backgroundColor = UIColor.whiteColor;
    // 加入4个tabbar
    [tabbarController setViewControllers: @[newsviewController, videoController, recommendController, mineController]];
    // 加入事件委托
    tabbarController.delegate = self;
    
    // 加入跳转viewcontroller
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabbarController];
    // 必须设置根控制器
    self.window.rootViewController = navigationController;
    // 显示当前窗口,用于显示当前窗口并将其放置在同一级别或更低级别的所有其他窗口的前面。
    [self.window makeKeyAndVisible];

}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

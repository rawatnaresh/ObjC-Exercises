//
//  SceneDelegate.m
//  Hypnosister
//
//  Created by Naresh Rawat on 09/02/2026.
//

#import "SceneDelegate.h"
#import "BNRHyponsisView.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UIWindowScene *windowScene = (UIWindowScene *) scene;
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    self.window = window;
    
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    
    bigRect.size.width *= 2.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = YES;
    [self.window addSubview:scrollView];
    
    // Create a super-sized hypnosis view and add it to the scroll view
    BNRHyponsisView *hypnosisView = [[BNRHyponsisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];
    
    // add a second screen-sized hypnosis view just off screen to the right
    screenRect.origin.x += screenRect.size.width;
    BNRHyponsisView *anotherView = [[BNRHyponsisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size;
    
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
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

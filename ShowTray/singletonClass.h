//
//  singletonClass.h
//  ShowTray
//
//  Created by Ashwani on 15/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import <foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "DGActivityIndicatorView.h"
#import "PrefixHeader.pch"


#define alertTitle @"Oralift"
#define PickerTitle @"Image Picker"

@interface singletonClass : NSObject <UIImagePickerControllerDelegate>
{
    NSString *someProperty;
}

@property(nonatomic,strong)AppDelegate *objApp;
@property(nonatomic,strong)UIImage *imgSelected;
@property(nonatomic,strong)UIAlertController *alertController;
@property(nonatomic,strong)UIAlertController *alertController1;
@property(nonatomic,strong)UIImageView *objImageView;
@property(nonatomic,strong)UIAlertAction *cancelAction,*libraryAction,*cameraAction,*yesButton,*noButton,*yesButton1;

typedef void (^ASCompletionBlock)(BOOL success, NSError *error);
typedef void (^IPickerCompletionBlock)(BOOL success, NSError *error, UIImage*image);

@property(readwrite,copy) IPickerCompletionBlock objBlock;


+ (id)sharedManager;

-(void)showAlertDialog:(NSString *)msg controller:(UIViewController*)viewController complition:(ASCompletionBlock)Success;
-(void)showAlertDialogWithOptions:(NSString *)msg controller:(UIViewController*)viewController complition:(ASCompletionBlock)Success;
-(void)showImageSheet:(NSString *)msg controller:(UIViewController*)viewController complition:(IPickerCompletionBlock)Success;
- (BOOL)isValidEmail:(NSString*) emailString;
-(void)createParralaxEfffect:(UIView *)view;
-(void)CreateShakeAnimation:(UIView*)view;
-(void)CreateDeleteAnimation:(UIView*)view;
-(void)CreateShadow:(UIView*)view;
-(void)CreateTickBoxShadow:(UIView*)view;
- (CGRect)contentSizeRectForTextView:(UITextView *)textView;


-(void)showHud:(UIView*)view;
-(void)hideHud:(UIView*)view;
-(void)showHudinner:(UIView*)view;
-(void)hideHudinner:(UIView*)view;
-(void)hideALLHud:(UIView *)view;


@end

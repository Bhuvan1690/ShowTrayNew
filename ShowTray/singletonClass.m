//
//  singletonClass.m
//  ShowTray
//
//  Created by Ashwani on 15/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "singletonClass.h"
#import "MBProgressHUD.h"
#import "DGActivityIndicatorView.h"
#import "PrefixHeader.pch"


@implementation singletonClass
DGActivityIndicatorView *activityIndicatorView;

@synthesize objApp,alertController,imgSelected,cancelAction,libraryAction,cameraAction,objImageView,objBlock,yesButton,noButton,alertController1,yesButton1;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static singletonClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    
    if (self = [super init]) 
    {
        someProperty = @"Default Property Value";
        objApp=(AppDelegate*)[[UIApplication sharedApplication]delegate];
        //alertController=[UIAlertController new];
        alertController1=[UIAlertController new];
        imgSelected=[UIImage new];
    }
    return self;
}



-(void)showAlertDialog:(NSString *)msg controller:(UIViewController*)viewController complition:(ASCompletionBlock)Success
{
    alertController = [UIAlertController new];
    alertController1.title =alertTitle;
    alertController1.message = msg;
    
    if (![alertController1.actions containsObject:yesButton1])
    {
      yesButton1 = [UIAlertAction
      actionWithTitle:NSLocalizedString(@"OK", nil)
      style:UIAlertActionStyleDefault
      handler:^(UIAlertAction * action)
     {
      [alertController1 dismissViewControllerAnimated:YES completion:nil];
      Success(YES,nil);
     }];  
      [alertController1 addAction:yesButton1];
    }
    
    [viewController presentViewController:alertController1 animated:YES completion:nil];
}



-(void)showAlertDialogWithOptions:(NSString *)msg controller:(UIViewController*)viewController complition:(ASCompletionBlock)Success
{
    
    alertController=[UIAlertController new];
    alertController.title =alertTitle;
    alertController.message = msg;
    
    if (![alertController.actions containsObject:yesButton])
    {
        yesButton = [UIAlertAction
                     actionWithTitle:NSLocalizedString(@"OK", nil)
                     style:UIAlertActionStyleDefault
                     handler:^(UIAlertAction * action)
                     {
                         [alertController dismissViewControllerAnimated:YES completion:nil];
                         Success(YES,nil);
                     }];
        [alertController addAction:yesButton];
    }
    
    if (![alertController.actions containsObject:noButton])
    {
        noButton = [UIAlertAction
                    actionWithTitle:NSLocalizedString(@"No, thanks", nil)
                    style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction * action)
                    {
                        [alertController dismissViewControllerAnimated:YES completion:nil];
                        Success(NO,nil);
                    }];
        [alertController addAction:noButton];
    }
    
    [viewController presentViewController:alertController animated:YES completion:nil];
}




-(void)showImageSheet:(NSString *)msg controller:(UIViewController*)viewController complition:(IPickerCompletionBlock)Success
{
    alertController.title=PickerTitle;
    alertController.message = msg;
    objBlock=Success;
    
    
    if (![alertController.actions containsObject:cancelAction]) 
    {
        cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"CANCEL", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                                       { 
                                           [alertController dismissViewControllerAnimated:YES completion:nil];
        }];  
        [alertController addAction:cancelAction];  
    }
  
    
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary] && ![alertController.actions containsObject:libraryAction])
    {
      libraryAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"PHOTO LIBRARY", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
         {  
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
              controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
              controller.allowsEditing = YES;
              controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
              controller.delegate = (id)self;
              [viewController presentViewController: controller animated: YES completion: nil];
          }];  
        [alertController addAction:libraryAction]; 
    }
    
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] && ![alertController.actions containsObject:cameraAction]) 
    {
     cameraAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"CAMERA", nil)  style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
     {  
         UIImagePickerController *Pickercontroller = [[UIImagePickerController alloc] init];
         Pickercontroller.sourceType = UIImagePickerControllerSourceTypeCamera;
         Pickercontroller.allowsEditing = YES;
         Pickercontroller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
         Pickercontroller.delegate = (id)self;
         [viewController presentViewController: Pickercontroller animated: YES completion: nil];
         
       }];  
        [alertController addAction:cameraAction];
    }
    
    [viewController presentViewController:alertController animated:YES completion:nil];  
}


- (BOOL)isValidEmail:(NSString*) emailString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailString];
}



-(void)showHud:(UIView*)view
{
    activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallClipRotatePulse tintColor:[UIColor colorWithRed:67/255.0 green:0/255.0 blue:46/255.0 alpha:1] size:60.0f];
    activityIndicatorView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width)/2 - 30, ([UIScreen mainScreen].bounds.size.height)/2 - 30, 60.0f, 60.0f);
    //[view addSubview:activityIndicatorView];
   [self.objApp.window addSubview:activityIndicatorView];
    self.objApp.window.userInteractionEnabled=NO;
    [activityIndicatorView startAnimating];
   // [MBProgressHUD showHUDAddedTo:self.objApp.window animated:YES];
}

-(void)hideHud:(UIView*)view
{
    [activityIndicatorView removeFromSuperview];
    [activityIndicatorView stopAnimating];
    self.objApp.window.userInteractionEnabled=YES;
    //[MBProgressHUD hideHUDForView:self.objApp.window animated:YES];
}
-(void)showHudinner:(UIView*)view
{
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}
-(void)hideHudinner:(UIView *)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}
-(void)hideALLHud:(UIView *)view
{
    [MBProgressHUD hideAllHUDsForView:self.objApp.window animated:YES];
}


#pragma mark UIIMAGEPICKERCONTROLLER DELEGATE METHODS

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
     NSLog(@"%@",info);
    imgSelected=[info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    objBlock (YES,nil,imgSelected);
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
     objBlock (NO,nil,nil);
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


-(void)createParralaxEfffect:(UIView *)view
{
    // Set vertical effect
//    UIInterpolatingMotionEffect *verticalMotionEffect =[[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
//    verticalMotionEffect.minimumRelativeValue = @(-10);
//    verticalMotionEffect.maximumRelativeValue = @(10);
//    
//    // Set horizontal effect
//    UIInterpolatingMotionEffect *horizontalMotionEffect =[[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    horizontalMotionEffect.minimumRelativeValue = @(-10);
//    horizontalMotionEffect.maximumRelativeValue = @(10);
//    
//    // Create group to combine both
//    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
//    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
//    
//    // Add both effects to your view
//    [view addMotionEffect:group];
    
    view.layer.shadowOffset = CGSizeMake(10, 10);
    view.layer.shadowRadius = 5.0;
    view.layer.shadowOpacity = 0.6;
    view.layer.masksToBounds = NO;
}

-(void)CreateShakeAnimation:(UIView*)view
{
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.05];
    [animation setRepeatCount:5];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([view center].x - 20.0f, [view center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([view center].x + 20.0f, [view center].y)]];
    [[view layer] addAnimation:animation forKey:@"position"];
}

-(void)CreateDeleteAnimation:(UIView*)view
{
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.01];
    [animation setRepeatCount:20];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([view center].x - 5.0f, [view center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([view center].x + 5.0f, [view center].y)]];
    [[view layer] addAnimation:animation forKey:@"position"];
}

-(void)CreateShadow:(UIView*)view
{
    view.layer.shadowOffset = CGSizeMake(4, 4);
    view.layer.shadowRadius = 2.0;
    view.layer.shadowOpacity = 0.6;
   view.layer.masksToBounds = NO;
}

-(void)CreateTickBoxShadow:(UIView*)view
{
    view.layer.shadowOffset = CGSizeMake(2, 2);
    view.layer.shadowRadius = 1.0;
    view.layer.shadowOpacity = 0.3;
    view.layer.masksToBounds = NO;
}


- (CGRect)contentSizeRectForTextView:(UITextView *)textView
{
    [textView.layoutManager ensureLayoutForTextContainer:textView.textContainer];
    CGRect textBounds = [textView.layoutManager usedRectForTextContainer:textView.textContainer];
    CGFloat width =  (CGFloat)ceil(textBounds.size.width + textView.textContainerInset.left + textView.textContainerInset.right);
    CGFloat height = (CGFloat)ceil(textBounds.size.height + textView.textContainerInset.top + textView.textContainerInset.bottom);
    return CGRectMake(0, 0, width, height);
}


/*-(void)uploadPhoto{
 
    AFHTTPRequestOperationManager *manager =  [AFHTTPRequestOperationManager new];
    
    NSData *imageData = UIImageJPEGRepresentation(imgUploadView.image, 0.5);
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:@"9" forKey:@"filename"];
    
    AFHTTPRequestOperation *op = [manager POST:@"http:" parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                                  {
                                      //do not put image inside parameters dictionary as I did, but append it!
                                      [formData appendPartWithFileData:imageData name:@"filename"
                                                              fileName:@"photo.jpg" mimeType:@"image/jpeg"];
                                      
                                  } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject)
                                      ;
                                      
                                      NSLog(@"%@",operation.responseObject);
                                      NSLog(@"JSON: %@", responseObject);
                                  } 
                                  
                                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSLog(@"Error: %@ ***** %@", operation.responseString, error);
                                           
                                           
                                           
                                       }];
    
    [op start];
}
*/


/*
-(void)runRequest
{
    
    AFHTTPRequestOperationManager *manager = [objSinglton getRequestOperationManager];
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:@"9" forKey:@"user_id"];
    [parameter setValue:@"9" forKey:@"session_user_id"];
    NSLog(@"%@",parameter);
    
    [manager POST:@"http://192.168.1.99/govind/user.php?event=login" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) 
     {
         NSLog(@"%@",operation.responseObject);
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}
*/
 
 
@end

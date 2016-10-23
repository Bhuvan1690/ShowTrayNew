//
//  ProjectManager.h
//  ShowTray
//
//  Created by Ashwani on 15/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#ifndef ProjectManager_h
#define ProjectManager_h

#import <UIKit/UIKit.h>
#import "Reachability.h"
//#import "SVProgressHUD.h"


@class BALoginResponse;

typedef NS_ENUM(NSInteger, STUserRole) {
    Role_Not_Assigned = 0,
    ST_User = 1,
    BA_Seller = 2,
};


inline static BOOL isInternetConnect() {
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    NSLog(@"NetworkStatus------------ %ld",(long)networkStatus);
    
    if (networkStatus == NotReachable) {
        return false;
    } else {
        return true;
    }
}

inline static NSString* trimString(NSString *string) {

    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

inline static BOOL validateEmail(NSString *emailID) {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailID];
}


inline static BOOL validateUrlWithString(NSString * url){
    
    if ([[url lowercaseString] rangeOfString:@"http"].location==NSNotFound && [[url lowercaseString] rangeOfString:@"https"].location==NSNotFound )
    {
        url=[NSString stringWithFormat:@"http://%@",url];
    }
    NSString *urlRegEx =
    @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&amp;=]*)?";
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    
    if ([regextest evaluateWithObject: url.lowercaseString] == YES) {
        return NO;
    } else {
        return YES;
    }
}


//inline static void showProgressHUD(){
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
//}
//
//inline static void dissmissProgressHUD(){
//    [SVProgressHUD dismiss];
//}



#pragma mark- Alert View

typedef void (^AlertCompletionBLock)();

inline static void showAlertWithSingleButton(UIViewController *controller,NSString *btnTitle,NSString *title,NSString *message,AlertCompletionBLock handler){
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:btnTitle
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull action) {
                                   
                                   if (handler) {
                                       
                                       handler();
                                   }
                                   
                               }];
    
    [alert addAction:okButton];
    [controller presentViewController:alert animated:YES completion:nil];
    
}

typedef void (^CustomAlertCompletionBLock)(NSInteger buttonIndex, NSString *buttonTitle,NSString *fieldText);

inline static void showAlert(UIViewController *controller,BOOL isTextFiled, NSString *title, NSString *message, NSString *btnCancelTitle, NSString *btnTitle, CustomAlertCompletionBLock handler){
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    if (isTextFiled == true) {
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
         {
             textField.placeholder = NSLocalizedString(@"PromoCode (optional)", @"Promo");
         }];
    }
  
    UIAlertAction* cancelButton = [UIAlertAction
                                   actionWithTitle:btnCancelTitle
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * _Nonnull action) {
                                        UITextField *txtField = alert.textFields.firstObject;
                                       //Do Nothing
                                       handler(0,btnCancelTitle,txtField.text);
                                   }];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:btnTitle
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull action) {
                                   
                                   UITextField *txtField = alert.textFields.firstObject;
                                   if (handler) {
                                       handler(1,btnTitle,txtField.text);
                                   }
                                   
                               }];
    
    [alert addAction:cancelButton];
    [alert addAction:okButton];
    [controller presentViewController:alert animated:YES completion:nil];
}



inline static NSString* documentDirectoryPath(){
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

inline static BOOL removeFileFromLocalStorage(NSInteger userId, NSInteger albumID, NSInteger songId, NSString *extension, NSString *userType){
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = documentDirectoryPath();
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%ld", userType,(long)userId]];
    NSError *error;
    
    if(songId > 0){
        filePath = [filePath stringByAppendingFormat:@"/%ld/song_%ld.%@",(long)albumID, (long)songId, extension];
    }
    else{
        filePath = [filePath stringByAppendingFormat:@"/%ld",(long)albumID];
    }
    
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    if (success) {
        return YES;
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
        return NO;
    }
    
    return YES;
}

inline static UILabel* addNodataLableTo(UITableView *tableView){
    
    NSLog(@"Adding...");
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    
    messageLabel.text = @"No data is currently available.";
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:17];
    [messageLabel sizeToFit];
    messageLabel.center = tableView.center;
    if(tableView.backgroundView){
        [tableView.backgroundView addSubview:messageLabel];
    }
    else{
        tableView.backgroundView = messageLabel;
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return messageLabel;
}

inline static void removeNodataLableTo(UITableView *tableView, UILabel *lblNoData){
    NSLog(@"Removing...");
    [lblNoData removeFromSuperview];
}


inline static BALoginResponse * getLoginUser(){
    NSData *objUser = [[NSUserDefaults standardUserDefaults] objectForKey:@"BA_LoginUser"];
    return [NSKeyedUnarchiver unarchiveObjectWithData:objUser];
}

inline static BOOL setLoginUser(BALoginResponse * objUser){
    NSData *objUserData = [NSKeyedArchiver archivedDataWithRootObject:objUser];
    [[NSUserDefaults standardUserDefaults] setObject:objUserData forKey:@"BA_LoginUser"];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

inline static NSString * getDeviceToken(){
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"BA_DeviceToken"];
}
inline static BOOL setDeviceToken(NSString * token){
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"BA_DeviceToken"];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}


inline static NSDictionary * getDraftMessage(){
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"BA_DraftMessage"];
}
inline static BOOL setDraftMessage(NSDictionary *messageDict){
    [[NSUserDefaults standardUserDefaults] setObject:messageDict forKey:@"BA_DraftMessage"];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}


inline static void reseatLoginUserDetails(){
    NSUserDefaults *objUserDefaults = [NSUserDefaults standardUserDefaults];
    [objUserDefaults removeObjectForKey:@"BA_LoginUser"];
}


inline static void getToolBar(id target,id inputView, SEL selecter)
{
    UIToolbar* customToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    customToolbar.barStyle = UIBarStyleBlackTranslucent;
    customToolbar.barTintColor = [UIColor colorWithRed:227/255.0f green:231/255.0f blue:235/255.0f alpha:1];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:target action:selecter];
    doneButton.tintColor = [UIColor colorWithRed:207/255.0f green:66/255.0f blue:50/255.0f alpha:1];
    
    customToolbar.items = @[
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            doneButton];
    [customToolbar sizeToFit];
    if([inputView isKindOfClass:[UITextField class]]){
        [(UITextField *)inputView setInputAccessoryView:customToolbar];
    }
    else if([inputView isKindOfClass:[UITextView class]]){
        [(UITextView *)inputView setInputAccessoryView:customToolbar];
    }
    
}

inline static CGFloat getTextHeight(NSString * text , CGFloat width){
    
    CGRect textSize =CGRectZero;
    if(text.length>0){
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:10]};
        textSize = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    }
    
    return textSize.size.height;
}


#endif /* ProjectManager_h */

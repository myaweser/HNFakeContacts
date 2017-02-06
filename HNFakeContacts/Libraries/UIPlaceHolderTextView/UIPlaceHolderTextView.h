//
//  UIPlaceHolderTextView.h
//  EmailIntroduction
//
//  Created by Nguyen Duc Hoang on 12/14/16.
//  Copyright © 2016 Nguyen Duc Hoang. All rights reserved.
//

@import UIKit;
@import Foundation;

IB_DESIGNABLE
@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) IBInspectable NSString *placeholder;
@property (nonatomic, retain) IBInspectable UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end

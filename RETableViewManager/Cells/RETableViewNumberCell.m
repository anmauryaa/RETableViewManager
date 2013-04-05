//
//  RETableViewNumberCell.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 4/4/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RETableViewNumberCell.h"
#import "RETableViewManager.h"

@implementation RETableViewNumberCell

+ (BOOL)canFocus
{
    return YES;
}

#pragma mark -
#pragma mark Lifecycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    
    self.textField = [[REFormattedNumberField alloc] initWithFrame:CGRectNull];
    self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.textField.inputAccessoryView = self.actionBar;
    self.textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:self.textField];
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    
    self.textLabel.text = self.item.title;
    self.textField.text = [self.textField string:self.item.value withNumberFormat:self.item.format];
    self.textField.placeholder = self.item.placeholder;
    self.textField.format = self.item.format;
    self.textField.font = self.tableViewManager.style.textFieldFont;
    self.textField.keyboardAppearance = self.item.keyboardAppearance;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

#pragma mark -
#pragma mark Handle events

- (void)textFieldDidChange:(REFormattedNumberField *)textField
{
    self.item.value = textField.unformattedText;
}

@end

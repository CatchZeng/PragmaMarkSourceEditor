//
//  SourceEditorCommand.m
//  PragmaMarkPlugin
//
//  Created by CatchZeng on 2016/10/22.
//  Copyright © 2016年 catch. All rights reserved.
//

#import "SourceEditorCommand.h"

static NSString *const insertPragmaMark = @"#pragma mark -- Life Cycle\n\n#pragma mark -- Getters & Setters\n\n#pragma mark -- Private Methods\n\n#pragma mark -- Override Methods\n\n#pragma mark -- Delegate\n";

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    if (invocation.buffer.selections.count != 0) {
        XCSourceTextRange* lastObject = invocation.buffer.selections.lastObject;
        NSUInteger endLine = lastObject.end.line;
        
        [invocation.buffer.lines insertObject:insertPragmaMark atIndex:endLine];
    }
    
    completionHandler(nil);
}

@end

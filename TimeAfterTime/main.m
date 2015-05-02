//
//  main.m
//  TimeAfterTime
//
//  Created by Calvin Cheng on 2/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSDate *now = [NSDate date];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds, it will be %@", later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [cal calendarIdentifier]);
        
        unsigned long day = [cal ordinalityOfUnit:NSCalendarUnitDay
                                           inUnit:NSCalendarUnitMonth
                                          forDate:now];
        NSLog(@"This is day %lu of the month", day);
        
        unsigned units = NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSDateComponents *comps = [cal components:units
                                         fromDate:now];

        NSInteger monthDay = [comps day];
        NSLog(@"Day of the Month: %ld", (long)monthDay);
        
        NSInteger month = [comps month];
        NSLog(@"Month: %ld", (long)month);
        
        NSInteger weekday = [comps weekday];
        NSLog(@"Day of the week: %ld", (long)weekday-1);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSString *dayString = [[formatter weekdaySymbols] objectAtIndex:(weekday-1)];
        NSLog(@"Day of the week in string: %@", dayString);
        
        // From given date and time, calculate seconds since then
        // composing the date object
        NSDateComponents *comps2 = [[NSDateComponents alloc] init];
        [comps2 setYear:1976];
        [comps2 setMonth:10];
        [comps2 setDay:10];
        [comps2 setHour:12];
        [comps2 setMinute:10];
        [comps2 setSecond:0];
        NSDate *comps2Date = [cal dateFromComponents:comps2];
        
        // calculate seconds from `comps2Date` to `now`
        double secondsSinceEarlierDate = [now timeIntervalSinceDate:comps2Date];
        NSLog(@"Seconds since comps2: %f", secondsSinceEarlierDate);
    }
    return 0;
}

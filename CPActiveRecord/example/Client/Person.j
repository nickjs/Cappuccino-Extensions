/*
 * Person.j
 * Client
 *
 * Created by Nicholas Small on October 5, 2009.
 */

@import "CPActiveRecord.j"


@implementation Person : CPActiveRecord
{
    // You need to define the attributes you want to have in your cappuccino model.
    CPString        name    @accessors;
    CPString        email;
}

// The default implementation just returns className + s. Because person has an irregular plural, we need to overwrite it.
+ (CPURL)resourcePath
{
    // Don't forget the leading / and no trailing /
    return [CPURL URLWithString:@"/people"];
}

// Define the layout for saving a record. This will be called on -save.
- (JSObject)attributes
{
    return {
        'person': {
            'name': name,
            'email': email
        }
    }
}

@end

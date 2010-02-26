@import "../CPActiveRecord.j"


// our test subject
@implementation User : CPActiveRecord
{
    CPString name   @accessors;
    CPString email  @accessors;
}

- (JSObject)attributes
{
    return {'user': {'name': name,'email': email} };
}

@end


@implementation CPActiveRecordTest : OJTestCase

- (void)setUp
{
    _newUser = [User new];
    _existingUser = [User new:{'id':42, 'name':'Joe Blow', 'email':'joe@blow.com'}]
}

- (void)testNew
{
    [self assertNull:_newUser.identifier];
    [self assertNull:_newUser.name];
    [self assertNull:_newUser.email];
    
    [self assert:42 equals:_existingUser.identifier];
    [self assert:@"Joe Blow" equals:_existingUser.name];
    [self assert:@"joe@blow.com" equals:_existingUser.email];
}

- (void)testResourcesPath
{
    [self assert:[CPURL URLWithString:@"/users"] equals:[User resourcesPath]];
}

- (void)testResourcePath
{
    [self assert:[CPURL URLWithString:@"/users/42"] equals:[_existingUser resourcePath]];
}

- (void)testRecordWillSave
{
    var request = [_newUser recordWillSave];
    [self assert:[CPURL URLWithString:@"/users"] equals:[request URL]];
    [self assert:@"POST" equals:[request HTTPMethod]];
    
    var request = [_existingUser recordWillSave];
    [self assert:[CPURL URLWithString:@"/users/42"] equals:[request URL]];
    [self assert:@"PUT" equals:[request HTTPMethod]];
}

@end

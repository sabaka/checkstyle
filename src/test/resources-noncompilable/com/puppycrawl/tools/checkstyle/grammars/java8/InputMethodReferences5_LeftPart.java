//simpliest
foo::b;

//ambig names
foo.bar::b;
//just for fun
foo.bar.fooo.foo.bar.fooo.foo.bar.fooo.foo.bar.fooo.foo.bar.fooo::b;


//this and super
super::b;
A.super::b;
this::b;
A.this::b;
com.checkstyle.B.super::b;

//PROBLEMS!!!!!!! these cases should be supported, but they are not :(
//FieldAccess:
//a.super.b::foo;
//super.b::foo;
//Primary . Identifier :: b;

//ArrayAccess 
//a[1]::b;
//a[1+1]::b;
//a.a()[0]::b;
//Primary[expression] :: b;

//MethodInvocation 
//a.a()::b;
//a.super.a()::b;

//MethodReference
//A::b::c;

//AND following things should be investigated. This is lines from java spec, so they should work in the end
//( Expression ) 
//ClassInstanceCreationExpression 
//ArrayCreationExpression
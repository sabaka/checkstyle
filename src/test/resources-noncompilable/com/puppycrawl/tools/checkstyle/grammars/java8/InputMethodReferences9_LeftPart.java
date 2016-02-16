//types
A<>::new;
A<>[]::new;
A[]::new;
A[][]::new;
@foo A::b;
@foo A[][]::new;
@foo A<bar>.@foo B<bar>.@foo C<bar>::b;
A.B[]::new;
A.B.C<?>::b;
A.B.@foo C::b;
A.B.@foo C<bar>::b;
A @foo[]@bar[]::new;

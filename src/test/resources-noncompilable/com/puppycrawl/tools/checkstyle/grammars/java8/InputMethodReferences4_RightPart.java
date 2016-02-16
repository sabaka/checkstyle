//in whole file left side is "foo::"as we test variations of right side
foo::bar;
foo::<bar>foobar;
foo::<?>bar;
foo::new;
foo::<bar>new;
foo::<?>new;
foo::<fooo,barr>bar;

//nested
foo::<foo<bar>>foobar;
foo::<foo<bar<?>>>foobar;
foo::<foo<bar<?>>>new;

//simple wildcard bounds
foo::<? extends bar>foobar;
foo::<? super bar>foobar;

//wildcard bounds with annotation
foo::<@fooo?>bar;
foo::<@fooo? extends barr>bar;
foo::<@fooo? extends @fooo barr>bar;

//no need to test more complicated annotations. It's an another story.
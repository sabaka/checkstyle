//Compilable with Java8
package com.puppycrawl.tools.checkstyle.grammars.java8;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import java.util.Set;

public class InputAnnotationsOnArray2 {
    private String @Fancy [] array; // !!!
    Set<String @Fancy []> set;       // !!!
}

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE_USE)
@interface Fancy {
}
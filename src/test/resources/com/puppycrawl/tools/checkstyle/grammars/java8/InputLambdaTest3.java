package com.puppycrawl.tools.checkstyle.grammars.java8;

public class InputLabdaTest3 {
	
	public void doSomething() {
		object.forEach(() -> {System.out.println(this)});
	}
}

package com.puppycrawl.tools.checkstyle.grammars.java8;

public interface InputDefaultMethods {
	
	default public void doSomething(){
		System.out.println("Something done.");
	}

}

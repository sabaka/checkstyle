package com.puppycrawl.tools.checkstyle.grammars.java8;

public class InputLabdaTest1 {
	
	Runnable r1 = () -> System.out.println("Hello world one!");
	Runnable r2 = () -> System.out.println("Hello world two!");
	
	public static void main(String[] args) {
		r1.run();
		r2.run();
	}
}

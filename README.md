# HaskellCardNumberValidator
validator of credit card numbers

Idea: https://www.seas.upenn.edu/~cis1940/spring13/hw/01-intro.pdf

Small credit card validator. The project was created for personal training and use in the GHCi environment.

The program validates cards using the following algorithm:
1. Read what the user entered (string);
2. Split the string into an array of numbers; if there is a number consisting of 2 digits, split it into numbers (12 -> 1, 2);
3. Go through the array from right to left, doubling the value of every second number in parallel;
4. Sum the resulting array;
5 Find the remainder of division by 10, if it is equal to 0 - the map can exist;

Examples of using:
```cmd
ghci> validate "4012888888881881"
True
ghci> validate "4012888888881882"
False
```

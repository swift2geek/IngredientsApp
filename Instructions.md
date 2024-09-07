# Sauce Labs iOS Coding Challenge

The challenge is implemented in the `IngredientsApp` that we provided you with (it runs on both Simulators and real devices).
The app has a single view (implemented in `IngredientsViewController.swift`) that has three input fields for ingredients for which you should find the correct values.
For correct input values the input fields will turn green. If the value is wrong, the field turns red.
There's also already a bridging header created if you want to solve the implementation part of challenge in Objective-C.

Please write down what you did to find the ingredients, or what you tried until you got stuck in the `Solutions.md` file.
You could rely on the debugger, use a disassembler (Ghidra, Hopper, IDA, ...) or any other approach.

**IN YOUR SUBMISSION PLEASE INCLUDE THE DESCRIPTION OF THE APPROACHES YOU TOOK EVEN THOUGH YOU WERE NOT ABLE TO COMPLETE EVERYTHING!**

## Submission format

Please package the whole app project folder and submit it (also include the `IngredientsFramework.framework`).

## 1. Hidden Ingredient

The first ingredient was stored in plain-text inside the framework.
Lets try to find it!

## 2. Encrypted Ingredient

The second ingredient was encrypted, but both, the cipher-text and password are stored somewhere in the binary.
Can you find the values and decrypt it?

## 3. Patch the Framework

Like the previous ingredient, the third was encrypted and the cipher-text and password are stored in the binary.
However, we *accidentally* use the wrong cipher operation mode when we try to decrypt it and compare it against the input. 
Can you change the operation mode of the cipher?

## Hints

- Both encrypted ingredients were generated with the command `echo -n "{INGREDIENT}" | openssl enc -aes-128-ecb -pass 'pass:{PASSWORD}' -md "SHA1" -nosalt -base64`.
- In the `IngredientsFramework` we use only `CommonCrypto` functions for crypto related operations.

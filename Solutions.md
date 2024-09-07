---

# Solution for Ingredients Checker Challenge

## Overview
This document details the steps I took to uncover all three ingredients in the application using Hopper, LLDB, and some decryption techniques. The task involved identifying plaintext values and performing decryption operations to extract hidden ingredients. Additionally, modifications to the framework were necessary to handle decryption correctly.

## Tools Used
- **Hopper Disassembler**: For analyzing the binary and finding hardcoded values.
- **LLDB**: For debugging and inspecting runtime behavior.
- **OpenSSL**: For decrypting base64-encoded and AES-encrypted strings.

## Steps to Solve the Challenge

### 1. First Ingredient: Cinnamon
The first ingredient was stored in plain text within the binary. Using Hopper, I quickly located this value in the disassembled code. It was available in its plaintext form:

- **First ingredient**: `Cinnamon`

This took only a short time to find, as it was hardcoded in an easily identifiable section of the binary.

### 2. Second Ingredient: Mayonnaise
The second ingredient required a bit more investigation. I used LLDB to analyze the decryption process and found that the decryption key was constructed dynamically within the method. The method used a formatted string with the `%c%c` pattern, and through careful inspection of the instructions and registers in LLDB, I discovered that the key was being constructed using the string `s4uc`.

Further analysis revealed that the key had an additional `3` added to the end, forming the complete key: `s4uc3`. The ciphertext for this ingredient was also found in the binary, base64-encoded, as `zJpd8ixkxNA6L3cSCEg2vw==`.

To decrypt this ingredient, I used the following OpenSSL command:

```bash
echo "zJpd8ixkxNA6L3cSCEg2vw==" | openssl enc -aes-128-ecb -d -base64 -pass pass:s4uc3 -md sha1 -nosalt
```

This command revealed the second ingredient:

- **Second ingredient**: `Mayonnaise`

### 3. Third Ingredient: Pepper
The third ingredient was also base64-encoded and AES-128 encrypted, similar to the second ingredient. However, the passphrase for decryption was different, and I found it hardcoded in the binary (`superseceretkey!`).

I used the following OpenSSL command to decrypt the third ingredient:

```bash
echo "tBzF4x3Kxu3V0upSR9qdmA==" | openssl enc -aes-128-ecb -d -base64 -pass pass:superseceretkey! -md sha1 -nosalt
```

This revealed the third ingredient:

- **Third ingredient**: `Pepper`

### 4. Debugging and Patching the Framework
While analyzing the decryption process for the third ingredient, I encountered an issue with the `CCCrypt` function. By comparing the decryption routines of the second and third ingredients, I noticed that the `w0` register, which controls the cipher mode, was being set differently. 

In the second ingredient's method, the register was set correctly (`w0 = 0x1`), but in the third method, it was not. To resolve this, I patched the iPhone framework (because no signature), adding the necessary register setting to the third ingredient's decryption routine:

```assembly
mov w0, #0x1  ; Set the cipher mode for decryption
```

This patch allowed the decryption of the third ingredient to succeed.

## Summary of Ingredients
- **First ingredient**: Cinnamon (found in plaintext).
- **Second ingredient**: Mayonnaise (decrypted using OpenSSL with dynamically generated passphrase `s4uc3`).
- **Third ingredient**: Pepper (decrypted using OpenSSL with passphrase `superseceretkey!` after patching the iPhone's framework).

---

This solution highlights the steps I've taken to identify and decrypt each ingredient, with a focus on how Hopper, LLDB, and OpenSSL were used in conjunction with a framework patch to complete the challenge.

--- 

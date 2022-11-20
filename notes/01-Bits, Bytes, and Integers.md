# 01 Bits, Bytes, and Integers



## Encoding Byte Values

- Byte = 8 bits

  - Binary: 00000000 to 11111111
  - Decimal: 0 to 255
  - Hexdecimal: 00 to FF

  


## Boolean Algebra

- And
  - &
  - Intersection
- Or
  - |
  - Union
- Not
  - ~
  - Complement

- Exclusive-Or(Xor)
  - ^
  - Symmetric difference

> Logical Operation in C
>
> - &&, ||, !
> - Early Termination



## Shift Operation

- Left shift: x << y

- Right shift: x >> y

  - Logical shift: Fill with 0
  - Arithmetic shift: replicate most significant bit

- Undefined Behavior

  - shift amount < 0 or >= word size

    > in some machines, the shift amount will mold word size 8



## Numeric Ranges

- Unsigned Values
  - UMin = 0
  - UMax = 2^w^ - 1
- Two's Complement Values
  - TMin = -2^w^ - 1
  - TMax = 2^w-1^ - 1
- Other
  - Minus 1: 1111...1



## Encoding Integers

- Unsigned
  $$
  B2U(X) = \sum^{w-1}_{i=0}x_i2^i
  $$

- Two's  Complement
  $$
  B2T(X) = -x_{w-1}w^{w-1}+\sum^{w-2}_{i=0}x_i2^i
  $$

  > e.g.
  > 10110 = -16+4+2 = -10

- C Programming
  - #include <limits.h>
  - Declares constants
    - ULONG_MAX
    - LONG_MAX
    - LONG_MIN
  - Values Platform specific



## Mapping Signed to/from Unsigned

- Principle:
  - Keep bit representations and reinterpret
- non-negative:
  - signed = unsigned
- negative:
  - signed = unsigned - 2^w^

- C Programming

  - Constants

    - By defaults are considered to be signed integers
    - Unsigned if have "U" as suffix
    - Unsigned value is a feature of C

  - Casting Surprises

    - if there is a mix of unsigned and signed in single expression, signed values implicitly cast to **unsigned**

      > e.g.
      > -1 > 0U	 (unsigned evaluation)
      > 2147483647 > (int)2147483648U 	(signed evaluation)

  - Corner case

    - since |TMin| = |TMax| + 1
    - negative TMin(1000...0) we get TMin(1000...0)

- Other properties

  - UMax = 2 * TMax + 1



## Sign Extension

- Task:

  - Given w-bit signed integer x
  - Convert it to w+k-bit integer with same value

- Rule:

  - Make k copies of sign bit

    > e.g.
    > C493 equals FFFFC493 (in signed evaluation)



## Truncating

- Unsigned

  - mod operation

- Signed

  - if 1 before 1 truncated, unchanged

  - if 1 before 0 truncated, similar to mod (negative mod)

    > e.g. 10011 -> 0011

# Reverse Polish Notation (RPN) Calculator Demo

### A Few Opening Thoughts
The tricky thing with coding challenges is figuring out exactly how complex and extensible a solution someone is looking for. I try to keep in mind the various principles of Object Oriented programming (abstraction, encapsulation, polymorphism, and inheritance), SOLID, and TDD, yet it can be hard to convey all of this reasonably well in a small project like this. For anyone interested, I would love the opportunity to discuss the various design decisions I made here that way we can hopefully both learn together.

Thanks for stopping by!

Alan



### From Wikipedia
> In reverse Polish notation the operators follow their operands; for instance, to add 3 and 4, one would write "3 4 +" rather than "3 + 4". If there are multiple operations, the operator is given immediately after its second operand; so the expression written "3 − 4 + 5" in conventional notation would be written "3 4 − 5 +" in RPN: 4 is first subtracted from 3, then 5 added to it. An advantage of RPN is that it removes the need for parentheses that are required by infix. While "3 − 4 × 5" can also be written "3 − (4 × 5)", that means something quite different from "(3 − 4) × 5". In postfix, the former could be written "3 4 5 × −", which unambiguously means "3 (4 5 ×) −" which reduces to "3 20 −"; the latter could be written "3 4 − 5 ×" (or 5 3 4 − ×, if keeping similar formatting), which unambiguously means "(3 4 −) 5 ×".




### Sample Input/Output

    > 5 
    5
    > 8
    8
    > +
    13

---

    > -3
    -3
    > -2
    -2
    > *
    6
    > 5
    5
    > +
    11

---

    > 2
    2
    > 9
    9
    > 3
    3 
    > +
    12 
    > *
    24

---

    > 20
    20
    > 13
    13
    > -
    7
    > 2
    2
    > / 
    3.5

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#import "@preview/tablex:0.0.9": tablex, colspanx, rowspanx

#show heading.where(level: 2): it => pad(top: 1.25em, it)
#set page(header: [TDDD85, Homework 2 #align(right)[Fredrik Ejsing, Bo Rodin]])

= Homework 2

== Exercise 1

=== a) Your grammer: 
$
S &= a A a | b B b | c C c | X\
A &= X A X | a\
B &= X B X | b\
C &= X C X | c\
X &= a | b | c
$


=== Nonterminals: 
$S, A, B, C, X$

=== Terminals:
$a, b, c$

=== Start symbol:
$S$

=== Motivate/explain your grammar:
With our grammer, we need to cover six cases that being where an either $a$, $b$ or $c$ is in the middle start and end of the string or where the whole string is $a$,$b$ or $c$. To cover these cases the start symbol $S$ can go to either nonterminal $A$ between two termninal $a$ and the same for the other letters. The nonterminals $A$, $B$ or $C$ can then either extend the string by returning itself between two nonterminal $X$ or the respective terminal $a$, $b$ or $c$ garantuing the correct letter remains in the middle of the string. The nonterminal $X$ then goes to all the terminals covering the cases of a single letter strings and builds the rest of the string of terminals other then the start, end and middle letter.

=== (b)

=== Your PDA (transition diagram or table):

#tablex(
  columns: 4,
  align: center,      
  inset: 10pt,      
  stroke: 1pt,  

  // Header row
  [*Top of Stack*], [*State*],[*a*], [*b*],

  // Data rows
rowspanx(2)[
  #v(15pt)   // adds vertical padding
  #scale(150%)[ $A$ ]
  #v(15pt)
], 
[$q_1$], [$"push" A space q_1 q_2$], [$"push" B space q_1 q_2$],
[$q_2$], [$"pop" q_2$], [],
rowspanx(2)[
  #v(15pt)   // adds vertical padding
  #scale(150%)[ $B$ ]
  #v(15pt)
], 
[$q_1$], [$"push" A space q_1 q_2$], [$"push" B space q_1 q_2$],
[$q_2$], [], [$"pop" q_2$],
rowspanx(2)[
  #v(15pt)   // adds vertical padding
  #scale(150%)[ $R$ ]
  #v(15pt)
], 
[$q_1$], [$"push" A space q_1 q_2$], [$"push" B space q_1 q_2$],
[$q_2$], colspanx(2)[$"Without reading: pop" q_2$],
)



== Exercise 2

== Exercise 3

== Exercise 4

== Exercise 5

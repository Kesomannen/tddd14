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

=== *$LL = {x x | x in L}$ for any L?*

==== Yes/no:

No.

==== Motivation:

$x x$ demands the same $x in L$ twice, whereas $L L = { x y | x,y in L }$, where $x$ and $y$ can be different strings.

==== If different: find a special case where they are equivalent.

$L = {a}$

The only member of $L L$ is $a a$, which is also satisfies ${x x | x in L}$. The same argument holds the other way, therefore the languages are equivalent.

=== *$L_1^R L_2^R = (L_1 L_2)^R$ for all $L_1, L_2$?*

==== Yes/no:

No.

==== Motivation:

Consider $L_1={a b}, L_2={c d}$. $L_1^R L_2^R = {b a d c}$ but $(L_1 L_2)^R = {d c b a}$ which are not the same.

==== If different: find a special case where they are equivalent.

If $L_1 = L_2$ the languages simplify to $L^R L^R$ and $(L L)^R$ which are trivially equal.

=== *$L_1^R L_2^R = (L_2 L_1)^R$ for all $L_1, L_2$?*

==== Yes/no:

Yes.

==== Motivation:

Reversing a string $s t$ where $s, t in Sigma^*$ first switches their order, then reverses the strings themselves, yielding $t^R s^R$. Applying that to our language $L_2^R L_1^R$ thus gives $L_1^R^R L_2^R^R$, that is equal to $L_1 L_2$.

=== *$L^*=L^*L$ for every L?*

==== Yes/no:

No.

==== Motivation:

We can choose $epsilon$ for the $L^*$ part of a string in $L^*L$. Therefore, if $epsilon in.not L$, then $epsilon in.not L^*L$ so the languages are not equivalent.

==== If different: find a special case where they are equivalent.

If $epsilon in L$ we can pick $epsilon$ as the $L$ in $L^*L$ while remaining in the same language (since $L^*$ "subsumes" the $L$).

== Exercise 3

=== 1. State your assumptions on the pumping length $p >= 0$:

Since we want to prove the statement generally, we cannot make any assumptions on the pumping length $p$ beyond $p >= 0$.

=== 2. Choose a string $s in L$ such that $|s| >= p$:

We choose the string $s = 10^p 20^p 30^p$. $|s| = 3 + 3p = 3(p + 1) > p$.

=== 3. For every decomposition $s = u v w x y$ where $|v x| > 0, |v w x| ≤ p$, find a value $i >= 0$ such that $u v^i w x^i y in.not L_2$:

Because $|v w x| <= p$ and each number in our string is of length $p + 1$, $v x$ cannot cover all three numbers for any decomposition. Therefore, pumping $v x$ will change the value of one or two of these numbers, but not all three, therefore breaking the language constraint. Since we can pump the string out of $L$, $L$ is not context-free.

== Exercise 4

Let $G$ be the following CFG (where $S$ is the start symbol):

$S & -> a B | a D c \
B & -> b B c | c \
D & -> b c | c$

=== (a) Describe the language $L(G)$.

$L(G) = {a b^n c^n c | n > 0} union {a c c}$

=== (b) Show that $G$ is ambiguous.

The string $a b c c$ can be derived in two ways:

$S -> a B -> a b B c -> a b c c\
S -> a D c -> a b c c$

=== (c) Show that $G$ is not an LR(1) grammar.

Let's say we read $a c c$. After reading $a c$ we cannot decide between reducing $B$ or $D$ (with $S -> a B, {\$}$ or $S -> a D c, {\$}$, respectively).

=== (d) Modify $G$ into an equivalent grammar $G'$ that is LR(1). Prove that $G'$ is an LR(1) grammar, and explain why $G$ and $G'$ are equivalent.

The main offending production rules are $B -> c$ and $D -> b c$. The ambiguous string $a b c c$ is the only string that can use the $D$ production rule, so we can simply remove it without losing any strings of the language:

$S -> a B | a D c\
B -> b B c | c\
D -> c$

To simplify we can now remove $D$ as a whole:

$S -> a B | a c c\
B -> b B c | c$

The automaton for this grammar is as follows:

#let item(non-terminal, right, follow) = $#non-terminal & -> #right & #h(8pt) {follow}$

#let lr-node(pos, kernel, extra) = node(pos, [$
    #for i in kernel [
      #item(i.at(0), i.at(1), if i.len() >= 3 { i.at(2) } else { $\$$ })\
    ]
  $
  #if extra.len() > 0 [
    #line(length: 100%, stroke: (thickness: 0.5pt, dash: "dashed"))

    $
      #for i in extra [
        #item(i.at(0), i.at(1), if i.len() >= 3 { i.at(2) } else { $\$$ })\
      ]
    $
  ]
])

#diagram(
  node-stroke: .05em,
  node-shape: rect,
  node-corner-radius: 0.25em,
  node-inset: 8pt,
  lr-node(
    (0, 0),
    (
      ($S$, $dot a B$),
      ($S$, $dot a c c$),
    ),
    (),
  ),
  lr-node(
    (1, 0),
    (
      ($S$, $a dot B$),
      ($S$, $a dot c c$),
    ),
    (
      ($B$, $dot b B c$),
      ($B$, $dot c$),
    ),
  ),
  lr-node(
    (2, 0),
    (
      ($B$, $b dot B c$),
    ),
    (
      ($B$, $dot b B c$, $c$),
      ($B$, $dot c$, $c$),
    ),
  ),
  lr-node(
    (0, 1.5),
    (
      ($S$, $a c dot c$),
      ($B$, $c dot$),
    ),
    (),
  ),
  lr-node(
    (0, 3),
    (
      ($S$, $a c c dot$),
    ),
    (),
  ),
  lr-node(
    (2, 1),
    (
      ($B$, $c dot$, $c$),
    ),
    (),
  ),
  lr-node(
    (3, 0),
    (
      ($B$, $b dot B c$, $c$),
    ),
    (
      ($B$, $dot b B c$, $c$),
      ($B$, $dot c$, $c$),
    ),
  ),
  lr-node(
    (2, -1),
    (
      ($B$, $b B dot c$),
    ),
    (),
  ),
  lr-node(
    (1, -1),
    (
      ($B$, $b B c dot$),
    ),
    (),
  ),
  lr-node(
    (3, -1),
    (
      ($B$, $c dot$, $c$),
    ),
    (),
  ),
  lr-node(
    (3, 1.5),
    (
      ($B$, $b B dot c$, $c$),
    ),
    (),
  ),
  lr-node(
    (3, 2.5),
    (
      ($B$, $b B c dot$, $c$),
    ),
    (),
  ),
  lr-node(
    (1, 1.5),
    (
      ($S$, $a B dot$),
    ),
    (),
  ),
  node((0, -1), [accept]),
  edge((0, 0), (1, 0), "-|>", $a$),
  edge((1, 0), (2, 0), "-|>", $b$),
  edge((1, 0), (0, 1.5), "-|>", $c$, bend: -25deg),
  edge((0, 1.5), (0, 3), "-|>", $c$),
  edge((1, 0), (1, 1.5), "-|>", $B$),
  edge((0, 0), (0, -1), "-|>", $S$),
  edge((2, 0), (2, 1), "-|>", $c$),
  edge((2, 0), (3, 0), "-|>", $b$),
  edge((3, 0), (3, -1), "-|>", $c$),
  edge((2, 0), (2, -1), "-|>", $B$),
  edge((2, -1), (1, -1), "-|>", $c$),
  edge((3, 0), (3, 1.5), "-|>", $B$, bend: 25deg),
  edge((3, 1.5), (3, 2.5), "-|>", $c$),
  edge((3, 0), (3, 0), "-|>", $b$, bend: -110deg),
)

Since we were able to construct a LR(1) parser automaton, the grammar is LR(1).

== Exercise 5

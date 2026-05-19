#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show heading.where(level: 2): it => pad(top: 1.25em, it)
#set page(header: [TDDD85, Homework 2 #align(right)[Fredrik Ejsing, Bo Rodin]])

= Homework 2

== Exercise 1

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

== Exercise 4

== Exercise 5

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show heading.where(level: 2): it => pad(top: 1.25em, it)

= Homework 1

== Exercise 1

== (1) $0^*(0 + 1) (0 + 1)^*$

=== Matching strings:

a, b, c, d

=== Motivation:

$(0 + 1)^*$ accepts everything, as long as there is one symbol caught by the $(0 + 1)$. Therefore, every string except $epsilon$ is accepted.

== (2) $(0 + 1)^*1(0 + 1)^*0(0 + 1)^*$

=== Matching strings:

b, c

=== Motivation:

The regular expression accepts any string where there is some 1 followed by some 0, consecutive or not or not.

== (3) $(0 + (0 + 1)^*)(0^* + 1^*)$

=== Matching strings:

a, b, c, d, e

=== Motivation:

$(0 + 1)^*$ subsumes both $0$ and $(0^* + 1^*)$, therefore we can simplify the regular expression to $(0 + 1)^*$, which trivially accepts all strings.

== (4) $(0^* + 1)(0 + 1^*)$

=== Matching strings:

a, d, e

=== Motivation:

The language of the regular expression can be thought of as the following: once we se $01$, then we cannot see another $0$. Conversely, once we see $10$, we cannot see another $1$.

Therefore, b doesn't match as we start with $10$ but have another $1$ as the last symbol. Likewise, c is also invalid because we start with $01$, then immediately read a $0$. e, the empty string, _is_ accepted because we read neither $01$ nor $10$.

== (5) $(0^* + 1^*)^*$

=== Matching strings:

a, b, c, d, e

=== Motivation:

The regular expression trivially simplifies to $(0 + 1)^*$, which accepts all strings.

== Exercise 2

=== Step 1: present the result as a table. A short motivation is enough.

The below table was generated via the subset construction method over our DFA:

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header([], [*0*], [*1*]),
  ${a,b,c}$, ${b,e}$, ${d,c}$,
  ${b,e}$, ${a,b,c}$, ${d}$,
  ${d,c}$, ${e}$, ${a,b,c}$,
  ${d}$, ${e}$, ${a,b,c}$,
  ${e}$, ${a,b,c}$, ${d}$,
)

=== Step 2: draw the resulting DFA.

#diagram(
  node-stroke: .05em,
  node((0, 1), ${a,b,c}$, radius: 2em),
  node((1, 0), ${b,e}$, radius: 2em, extrude: (-2.5, 0)),
  node((2, 0), ${d}$, radius: 2em, extrude: (-2.5, 0)),
  node((1, 2), ${d,c}$, radius: 2em, extrude: (-2.5, 0)),
  node((2, 2), ${e}$, radius: 2em, extrude: (-2.5, 0)),
  edge((-1, 1), (0, 1), "->"),
  edge((0, 1), (1, 0), "<-", $0$, bend: 30deg),
  edge((0, 1), (1, 0), "->", $0$),
  edge((0, 1), (2, 0), "<-", $1$, bend: -20deg),
  edge((0, 1), (2, 2), "<-", $0$, bend: 20deg),
  edge((0, 1), (1, 2), "<-", $1$, bend: -30deg),
  edge((0, 1), (1, 2), "->", $1$),
  edge((1, 0), (2, 0), "->", $1$),
  edge((2, 0), (2, 2), "->", $0$, bend: 10deg),
  edge((2, 0), (2, 2), "<-", $1$, bend: -10deg),
  edge((1, 2), (2, 2), "->", $0$),
)

== Exercise 3


#{
  let a = (1, 1)
  let b = (2, 0.25)
  let c = (2, 1.75)
  let d = (3, 1)
  let qs = (0, 1)
  let qf = (4, 1)

  [
    #diagram(
      node-stroke: .05em,
      node(a, $a$, radius: 2em),
      node(b, $b$, radius: 2em),
      node(d, $d$, radius: 2em, extrude: (-2.5, 0)),
      node(c, $c$, radius: 2em),
      edge((0, 1), a, "->"),
      edge(a, b, "->", $0$),
      edge(a, c, "->", $1$),
      edge(b, b, "->", $0$, bend: 130deg),
      edge(c, c, "->", $1$, bend: -130deg),
      edge(b, d, "->", $1$),
      edge(c, d, "->", $0$),
      edge(d, d, "->", $0,1$, bend: 130deg),
    )

    === Step 1: Add a new start and accept state.

    #diagram(
      node-stroke: .05em,
      node(qs, $q_s$, radius: 2em),
      node(a, $a$, radius: 2em),
      node(b, $b$, radius: 2em),
      node(d, $d$, radius: 2em, extrude: (-2.5, 0)),
      node(c, $c$, radius: 2em),
      node(qf, $q_f$, radius: 2em, extrude: (-2.5, 0)),
      edge((-1, 1), qs, "->"),
      edge(qs, a, "->", $epsilon$),
      edge(a, b, "->", $0$),
      edge(a, c, "->", $1$),
      edge(b, b, "->", $0$, bend: 130deg),
      edge(c, c, "->", $1$, bend: -130deg),
      edge(b, d, "->", $1$),
      edge(c, d, "->", $0$),
      edge(d, d, "->", $0,1$, bend: 130deg),
      edge(d, qf, "->", $epsilon$),
    )

    === Step 2: Remove state a.

    #diagram(
      node-stroke: .05em,
      node(qs, $q_s$, radius: 2em),
      node(b, $b$, radius: 2em),
      node(d, $d$, radius: 2em, extrude: (-2.5, 0)),
      node(c, $c$, radius: 2em),
      node(qf, $q_f$, radius: 2em, extrude: (-2.5, 0)),
      edge((-1, 1), qs, "->"),
      edge(qs, b, "->", $0$),
      edge(qs, c, "->", $1$),
      edge(b, b, "->", $0$, bend: 130deg),
      edge(c, c, "->", $1$, bend: -130deg),
      edge(b, d, "->", $1$),
      edge(c, d, "->", $0$),
      edge(d, d, "->", $0,1$, bend: 130deg),
      edge(d, qf, "->", $epsilon$),
    )

    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, auto),
      inset: 10pt,
      align: horizon,
      table.header([$s_1$], [$s_e$], [$s_2$], [$R_1$], [$R_2$], [$R_3$], [$R_4$], [$R_1R_2^*R_3 + R_4 ("simplified")$]),
      $q_s$, $a$, $b$, $epsilon$, $emptyset$, $0$, $emptyset$, $0$,
      $q_s$, $a$, $c$, $epsilon$, $emptyset$, $1$, $emptyset$, $1$,
    )

    === Step 3: Remove state b.

    #diagram(
      node-stroke: .05em,
      node(qs, $q_s$, radius: 2em),
      node(d, $d$, radius: 2em, extrude: (-2.5, 0)),
      node(c, $c$, radius: 2em),
      node(qf, $q_f$, radius: 2em, extrude: (-2.5, 0)),
      edge((-1, 1), qs, "->"),
      edge(qs, d, "->", $00^*1$),
      edge(qs, c, "->", $1$),
      edge(c, c, "->", $1$, bend: -130deg),
      edge(c, d, "->", $0$),
      edge(d, d, "->", $0,1$, bend: 130deg),
      edge(d, qf, "->", $epsilon$),
    )

    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, auto),
      inset: 10pt,
      align: horizon,
      table.header([$s_1$], [$s_e$], [$s_2$], [$R_1$], [$R_2$], [$R_3$], [$R_4$], [$R_1R_2^*R_3 + R_4 ("simplified")$]),
      $q_s$, $b$, $d$, $0$, $0$, $1$, $emptyset$, $00^*1$,
    )

    === Step 4: Remove state c.

    #diagram(
      node-stroke: .05em,
      node(qs, $q_s$, radius: 2em),
      node(d, $d$, radius: 2em, extrude: (-2.5, 0)),
      node(qf, $q_f$, radius: 2em, extrude: (-2.5, 0)),
      edge((-1, 1), qs, "->"),
      edge(qs, d, "->", $11^*0 + 00^*1$),
      edge(d, d, "->", $0,1$, bend: 130deg),
      edge(d, qf, "->", $epsilon$),
    )

    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, auto),
      inset: 10pt,
      align: horizon,
      table.header([$s_1$], [$s_e$], [$s_2$], [$R_1$], [$R_2$], [$R_3$], [$R_4$], [$R_1R_2^*R_3 + R_4 ("simplified")$]),
      $q_s$, $c$, $d$, $1$, $1$, $0$, $00^*1$, $11^*0 + 00^*1$,
    )

    === Step 5 Remove state d.

    #diagram(
      node-stroke: .05em,
      node(qs, $q_s$, radius: 2em),
      node(qf, $q_f$, radius: 2em, extrude: (-2.5, 0)),
      edge((-1, 1), qs, "->"),
      edge(qs, qf, "->", $(11^*0 + 00^*1)(0 + 1)^*$),
    )

    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, auto),
      inset: 10pt,
      align: horizon,
      table.header([$s_1$], [$s_e$], [$s_2$], [$R_1$], [$R_2$], [$R_3$], [$R_4$], [$R_1R_2^*R_3 + R_4 ("simplified")$]),
      $q_s$, $d$, $q_f$, $11^*0 + 00^*1$, $0 + 1$, $epsilon$, $emptyset$, $(11^*0 + 00^*1)(0 + 1)^*$,
    )

    === Your regular expression:
    $(11^*0 + 00^*1)(0 + 1)^*$

  ]
}
== Exercise 4

=== Table after iteration 0:

#let check = $checkmark$;

#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 10pt,
  $a$, "", "", "", "",
  check, $b$, "", "", "",
  check, "", $c$, "", "",
  check, "", "", $d$, "",
  check, "", "", "", $e$,
)

Here we marked states which are not both accept or both not accept. This marks all pairs with ${a}$, as that is the only non-accept state.

#pagebreak()

=== Table/motivation after iteration 1

#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 10pt,
  $a$, "", "", "", "",
  check, $b$, "", "", "",
  check, check, $c$, "", "",
  check, check, "", $d$, "",
  check, "", check, check, $e$,
)

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  table.header([], $0$, $1$, "Marked?"),
  ${b, c}$, ${e, a}$, "---", check,
  ${b, d}$, ${a, e}$, "---", check,
  ${b, e}$, ${a}$, ${d}$, "",
  ${c, d}$, ${e}$, ${a}$, "",
  ${c, e}$, ${e, a}$, "---", check,
  ${d, e}$, ${e, a}$, "---", check,
)

=== Table/motivation after iteration 2

#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 10pt,
  $a$, "", "", "", "",
  check, $b$, "", "", "",
  check, check, $c$, "", "",
  check, check, "", $d$, "",
  check, "", check, check, $e$,
)

(the same as after iteration 1)

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  table.header([], $0$, $1$, "Marked?"),
  ${b, e}$, ${a}$, ${d}$, "",
  ${c, d}$, ${e}$, ${a}$, "",
)

We learned no new information, so we terminate the algorithm and conclude that $b equiv e$ and $c equiv d$ under our DFA.

=== Minimized DFA (figure or transition table):

We rename/merge the states as follows:

- $a -> A$
- $b -> B$
- $c -> C$
- $d -> C$
- $e -> B$

#{
  let a = (calc.cos(180deg), calc.sin(180deg))
  let b = (calc.cos(-60deg), calc.sin(-60deg))
  let c = (calc.cos(60deg), calc.sin(60deg))

  diagram(
    node-stroke: .05em,
    spacing: 4em,
    node(a, $A$, radius: 2em),
    node(b, $B$, radius: 2em, extrude: (-2.5, 0)),
    node(c, $C$, radius: 2em, extrude: (-2.5, 0)),
    edge(a, b, "->", $0$, bend: 30deg),
    edge(b, a, "->", $0$, bend: 10deg),
    edge(b, c, "->", $1$, bend: 30deg),
    edge(c, b, "->", $0$, bend: 10deg),
    edge(c, a, "->", $1$, bend: 30deg),
    edge(a, c, "->", $1$, bend: 10deg),
    edge((-2, 0), a, "->"),
  )
}

== Exercise 5

=== (a) DFA for $L_1$:

#diagram(
  node-stroke: .05em,
  for a in (0, 1, 2, 3, 4) {
    for b in (0, 1, 2, 3) {
      (
        node((b, a), $q_(#a,#b)$, radius: 2em, extrude: if a > b {
          (-2.5, 0)
        } else {
          0
        }),
        if (a == 4) {
          edge((b, a), (b, a), "->", $a$, bend: -130deg)
        } else {
          edge((b, a), (b, a + 1), "->", $a$)
        },
        if (b == 3) {
          edge((b, a), (4.5, 2), "->", $b$, bend: (-12.5deg * (a - 2)))
        } else {
          edge((b, a), (b + 1, a), "->", $b$)
        },
      )
    }
  },
  node((4.5, 2), $q_T$, radius: 2em),
  edge((-1, 0), (0, 0), "->"),
  edge((4.5, 2), (4.5, 2), "->", $a, b$, bend: 130deg),
);

=== Motivation/explanation:

We have the states $q_(a,b)$, where $a <= 4$ and $b <= 3$, which we transition to after reading $a$ or more a's, and $b$ b's. The accept states are then naturally ${q_(a,b) | b <= 3 and a > b}$. We also have a trash state $q_T$ for when we read more than 3 $b$'s, as beyond that point the string is always rejected. We don't need to track the number of a's further than 4 since the $a > b$ condition will then always be satisfied, unless we reach 4 b's at which point we'll end up in $q_T$ anyway.

=== (b)

==== Determine a suitable pumping length $p$:

We determine $p = 8$ from the longest (non-repeating) path in our DFA (for example reading $a a a a b b b b$: $q_(0, 0) -> q_(1, 0) -> q_(2, 0) -> q_(3, 0) -> q_(4, 0) -> q_(4, 1) -> q_(4, 2) -> q_(4, 3) -> q_T$).

==== Choose a string $s in L_1$ with $|s| >= p$:

We choose the string $s = a a a a a b b b$. $s$ contains 5 $a$'s and only 3 $b$'s, so it's clear that $s in L_1$.

==== Split $s = x y z$ such that $|x y| <= p, |y| > 0$:

We split the string as following:

- $x = a a a a$
- $y = a$
- $z = b b b$

==== Provide an example of $i != 1$ such that $x y^i z in L_1$:

We choose $i = 3$, yielding the string $x y^i z = a a a a a a a b b b$. We only increased the number of $a$'s in $s$, therefore we are still clearly in the language.

=== (c)

==== 1. State your assumptions on the pumping length $p >= 0$:

We need to prove the statement generally, therefore we cannot make any assumptions on the pumping length. We simply assume that $L_2$ has some  arbitrary pumping length $p$.

==== 2. Choose a string $s in L_2$ such that $|s| >= p$:

We choose $s = b^(p + 1) a^(p + 2)$. $\#a(s) > \#b(s)$ holds for any $p >= 0$, therefore $s in L_2$.

==== 3. For every decomposition $s = x y z$ where $|x y| <= p, |y| > 0$ find a value $i >= 0$ such that $x y^i z in.not L_2$:

For all choices of $x, y, z$ that satisfies the above conditions, the substring $x y$ must only contain $b$'s, since we defined $s$ to start with $p + 1$ repeated $b$'s and $|x y| <= p$. Hence:

1. $y = b^m$ for some $m > 0$,
2. $x = b^k$ for some $k >= 0$ such that $k + m <= p$ and
3. $z = b^(p + 1 - k - m)a^(p + 1)$.

This covers all possible decompositions $s = x y z$. To finish the proof, we need to show that there exists an $i >= 0$ such that $x y^i z in.not L_2$. To generate a string that does not belong in our language, we need to pump enough $b$'s to match the number of $a$'s in $s$, that is $\#a(s) - \#b(x z)$. By definition $\#a(s) = p + 2$, and via (2, 3): $\#b(x z) = k + (p + 1 - k - m) = p + 1 - m$. For each increase in $i$, we generate $m$ $b$'s, therefore, to generate an invalid string $x y^i z = b^k b^(i m) b^(p + 1 - k - m) a^(p+2)$, we need:

#align(center)[
  $i m >= p + 2 - (p + 1 - m)$

  $i m >= m + 1$

  $i >= (m + 1) / m$
]

We find $i = ceil((m + 1) / m)$ generates a string $x y^i z$ with the same number, or more, $b$'s than $a$'s, therefore $x y^i z in.not L_2$. Via the inverted pumping lemma, we conclude that $L_2$ is not regular.

==== (d) Use the Myhill-Nerode theorem from the lecture notes.

Consider the string $a^i b^j$ where $i, j in NN$. From the DFA of $L_1$, we see that $[a^i b^j] equiv_(L_1) [a^(i + 1) b^j]$ where $i >= 4$, that is, reading one more $a$ is equivalent with our current state. Conversely, $[a^i b^j] equiv_(L_1) [a^i b^(j + 1)]$ where $j >= 3$. This means there a bound on the number of equivalence classes; once we've read 4 $a$'s or 3 $b$'s, we cannot reach any new classes. We conclude the number of equivalence classes is finite, which according to the Myhill-Nerode implies $L_1$ is regular.

The equivalence classes of $L_2$, on the other hand, lacks this constraint. Unlike $L_1$, reading a $b$ beyond the third one is not going to lead us to an equivalent state, because in $L_2$ we then need to read another $a$ to reach an accept state. Formally, $[a^i b^j] equiv.not_(L_2) [a^i b^(j + 1)]$, which creates an infinite number of equivalence classes as $j$ increases.

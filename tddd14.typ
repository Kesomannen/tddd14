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
      edge(d, qf, "->", $epsilon$)
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
      edge(d, qf, "->", $epsilon$)
    )

    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, auto),
      inset: 10pt,
      align: horizon,
      table.header([$s_1$], [$s_e$], [$s_2$], [$R_1$], [$R_2$], [$R_3$], [$R_4$], [$R_1R_2^*R_3 + R_4 ("simplified")$]),
      $q_s$, $a$, $b$, $epsilon$, $emptyset$, $0$, $emptyset$, $0$,
      $q_s$, $a$, $c$, $epsilon$, $emptyset$, $1$, $emptyset$, $1$
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
      edge(d, qf, "->", $epsilon$)
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
      edge(d, qf, "->", $epsilon$)
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

For each iteration draw the table to the left in the indicated box. To the right you must for each new state that has been marked include a motivation. Thus, if you in iteration $i$ mark a state $x$, then you should have a calculation of the form $delta(x, a) = y$ where (1) $a in Sigma$ is a symbol, and (2) $y$ has been marked in a previous iteration. For states which are _not_ marked you do not have to write anything.

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

Here we makred states which are not both accept or both not accept. This marks all pairs with ${a}$, as that is the only non-accept state.

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

#diagram(node-stroke: .05em, for a in (0, 1, 2, 3) {
  for b in (0, 1, 2, 3) {
    (
      node((b, a), $q_(a,b)$, radius: 2em, extrude: if a > b {
        (-2.5, 0)
      } else {
        0
      }),
      edge((b, a), (b + 1, a), "->", $b$),
    )
  }
});

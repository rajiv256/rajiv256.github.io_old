---
title: "Infimum and Supremum"
permalink: "/blog/infimum-and-supremum"
categories: Math
output:
  html_document: default
  pdf_document: default
layout: single
bibliography: refs.bib
link-citations: true
defaults:
- scope:
    path: ''
    type: posts
  values:
    author_profile: false
    read_time: true
    comments: true
    share: true
    related: true
tags: math
---

One of the math concepts that continue to confound me are that of the *supremum* and *infimum*. Why do we have to complicate math discourse when we have the conventional *maxima* and *minima* that have been adsorbed into the minds of every high schooler ever [@hardy1992mathematician]? Is it because mathematicians are inherently elitist, egotistical, painfully do-hard blue-bloods? Well, no.

### Set theoretic definition

Both the supremum and infimum talk about a boundary condition. An explicitly vanilla definition is as follows. Let's say both of them are defined on a bounded set $\mathcal{A}$.

**Supremum**. This is the minimum of all possible upper bounds. Note that there can be many upper bounds for a given set.

**Infimum**. This is the maximum of all possible minimums. Again there can be many minimums for a given bounded set.

For example, consider the set in $\mathcal{Z}$, $\mathcal{A} = \{5, 10, 15\}$. Its upper bounds are $15, 16, ... \infty$ and its lower bounds are $-\infty, ..., 3, 4, 5$ (Note that the equality holds). In this case, the supremum (minimum of the upper bounds) is $15$ and the infimum (maximum of the lower bounds) is $5$.

### An alternative characterisation

If $\mathcal{A} \subset \mathbb{R}$, then $M$ is considered to be the supremum of $\mathcal{A}$, if it is larger than or equal to every other element in the set. Similarly, $m$ is the infimum if it is lesser than every other element in the set. The bound description is slightly stricter.

Formally, if $\exists M'$ such that $M' < M$, then there must exist $x \in \mathcal{A}$ so that $x \ge M'$.

Similarly, if $\exists m'\  m' > m$, then there must exist $x \in \mathcal{A}$, so that $x \le m'$.

This characterization results in what seems like an innocent theorem that in turn could be used to infer many bounds in real analysis.

**Theorem 1.** If a set of real numbers is bounded from above it has a supremum and if it is bounded from below, it has an infimum. The converse of these statements is true too.

Some basic results that only require commonsense follow (see web ref 1).

### Infimum and Supremum of a function

This has since confounded me, but not anymore. The infimum and the supremum of a function are simply the infimum and the supremum of its range! Since the range is a set, all the properties that apply for the set theoretic description also apply to the function! Easy peasy.

### Web references

1.  [The supremum and infimum in the context of a Reimann Integral](https://www.math.ucdavis.edu/~hunter/m125b/ch2.pdf)

## Bibliography
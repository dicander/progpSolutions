convert(pvar(X), pvar(X)).
convert(and(F1, F2), and(F1C, F2C)) :-
    convert(F1, F1C),
    convert(F2, F2C).
convert(or(F1, F2), or(F1C, F2C)) :-
    convert(F1, F1C),
    convert(F2, F2C).
convert(neg(neg(F)), FC) :-
    convert(F, FC).
    convert(neg(pvar(X)), neg(pvar(X))).
convert(neg(and(F1, F2)), or(F1C, F2C)) :-
    convert(neg(F1), F1C),
    convert(neg(F2), F2C).
convert(neg(or(F1, F2)), and(F1C, F2C)) :-
    convert(neg(F1), F1C),
    convert(neg(F2), F2C).

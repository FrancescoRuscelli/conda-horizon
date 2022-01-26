#!/usr/bin/env python

import casadi as cs

x = cs.SX.sym("x")
y = cs.SX.sym("y")
z = cs.SX.sym("z")

nlp = {"x": cs.vertcat(x, y, z), "f": x ** 2 + 100 * z ** 2, "g": z + (1 - x) ** 2 - y}
S = cs.nlpsol('S', 'ipopt', nlp)

r = S(x0=[2.5, 3.0, 0.75], lbg=0, ubg=0)


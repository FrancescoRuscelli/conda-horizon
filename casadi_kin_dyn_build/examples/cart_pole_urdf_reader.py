#!/usr/bin/env python

from casadi_kin_dyn import pycasadi_kin_dyn as cas_kin_dyn

# Loading URDF model in pinocchio
urdf = open('cart_pole.urdf', 'r').read()
kindyn = cas_kin_dyn.CasadiKinDyn(urdf)


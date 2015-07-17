using Base: Test
using MATLAB

using DSGE: M990
include("../util.jl")



# This file generated by placing a breakpoint at line 42 of dsgelh.m
#   if any(mspec == class2part_all)
# and then running Main.m and renaming the variables
#   TTT = mt(pd).TTT
#   CCC = mt(pd).CCC
#   RRR = mt(pd).RRR
mf = MatFile("test_solve.mat")
TTT_expected = get_variable(mf, "TTT")
CCC_expected = reshape(get_variable(mf, "CCC"), 78, 1)
RRR_expected = get_variable(mf, "RRR")
close(mf)

model = Model()
TTT, CCC, RRR = solve(model)
@test test_matrix_eq(TTT_expected, TTT)
@test test_matrix_eq(CCC_expected, CCC)
@test test_matrix_eq(RRR_expected, RRR)

println("### solve.jl tests passed\n")

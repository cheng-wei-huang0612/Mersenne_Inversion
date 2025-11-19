from gen_cl import *


a = Epred(["epred0", "epred1"], "epred4")
b = Epred(a, "epred_new")

print(a.to_lines())
print(a.to_lines())
print(b.to_lines())
print(a)
print(b)
print(type(b))

c = Rpred(["rpred0", "rpred1",], "rpred4")
d = Rpred(c, "rpred_new")
print(c.to_lines())
print(c.to_lines())
print(d.to_lines())
print(c)
print(d)
print(type(d))

print(cl_cut(a,c))
print(cl_assume(b,c))


print('---')
print("proc main = (")
print("varvarvar")
print(cl_precondition(b, d))

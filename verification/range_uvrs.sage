

Ta = Matrix([[1, 0],[0, 1/2]])
Tb = Matrix([[1, 0],[1/2, 1/2]])
Tc = Matrix([[0, 1],[-1/2, 1/2]])
I = Matrix([[-2**20, 0],[0, -2**20]])


def Mgen(i=3):
    Ms = [[I]]
    for i in range(i):
        tmp = [T*M for T in [Ta, Tb, Tc] for M in Ms[-1]]
        Ms.append(tmp)

    return Ms
Ms = Mgen(8)


print("hello")
print(Ms[0])
print("hello")
for i in Ms[1]:
    print(i)
    print()

##### Bounds

u_low = -2**20



##### verification

Us_min = [min([matrix[0][0] for matrix in Ms[i]]) for i in range(1,8)]
Us_max = [max([matrix[0][0] for matrix in Ms[i]]) for i in range(1,8)]

Vs_min = [min([matrix[0][1] for matrix in Ms[i]]) for i in range(1,8)]
Vs_max = [max([matrix[0][1] for matrix in Ms[i]]) for i in range(1,8)]

Rs_min = [min([matrix[1][0] for matrix in Ms[i]]) for i in range(1,8)]
Rs_max = [max([matrix[1][0] for matrix in Ms[i]]) for i in range(1,8)]

Ss_min = [min([matrix[1][1] for matrix in Ms[i]]) for i in range(1,8)]
Ss_max = [max([matrix[1][1] for matrix in Ms[i]]) for i in range(1,8)]

RmUs_min = [min([matrix[1][0] - matrix[0][0] for matrix in Ms[i]]) for i in range(1,8)]
RmUs_max = [max([matrix[1][0] - matrix[0][0] for matrix in Ms[i]]) for i in range(1,8)]

SmVs_min = [min([matrix[1][1] - matrix[0][1] for matrix in Ms[i]]) for i in range(1,8)]
SmVs_max = [max([matrix[1][1] - matrix[0][1] for matrix in Ms[i]]) for i in range(1,8)]



print(Us_min)

for i, num in enumerate(Us_max, 1):
    assert num <= 2**19

for i, num in enumerate(Us_min, 1):
    assert num >= -2**20

for i, num in enumerate(Vs_max, 1):
    assert num <= 2**19 - (2**(20 - i))

for i, num in enumerate(Vs_min, 1):
    assert num >= -2**20

for i, num in enumerate(Rs_max, 1):
    assert num <= 2**19

for i, num in enumerate(Rs_min, 1):
    assert num >= 2**(20-i) - 2**20

for i, num in enumerate(Ss_max, 1):
    assert num <= 2**19 - (2**(20 - i))

for i, num in enumerate(Ss_min, 1):
    assert num >= 2**(20-i) - 2**20

for i, num in enumerate(RmUs_max, 1):
    assert num <= 2**20

for i, num in enumerate(RmUs_min, 1):
    assert num >= 2**(20-i) - 2**19

for i, num in enumerate(SmVs_max, 1):
    assert num <= 2**20 - 2**(20-i)

for i, num in enumerate(SmVs_min, 1):
    assert num >= - 2**19

proc main(int64 a_0, int64 b_0) =
{ b_0 = 1 /\ a_0 = 1 && b_0 = 1@64 /\ a_0 = 1@64 }
add a_1 a_0 1@int64;
mul b_1 b_0 2@int64;
add a_2 a_1 1@int64;
mul b_2 b_1 2@int64;
{ a_2 = 3 /\ b_2 = 4 && a_2 = 3@64 /\ b_2 = 4@64 }

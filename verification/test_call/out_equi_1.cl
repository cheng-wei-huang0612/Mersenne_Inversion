proc main(int64 a_2, int64 b_2) =
{ a_2 = 3 /\ b_2 = 4 && a_2 = 3@64 /\ b_2 = 4@64 }
add a_3 a_2 1@int64;
mul b_3 b_2 2@int64;
add a_4 a_3 1@int64;
mul b_4 b_3 2@int64;
{ true && true }

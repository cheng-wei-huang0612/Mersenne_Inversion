
proc main(a@int64, b@int64) = {a = 1, b = 1 && a = (const 64 1), b = (const 64 1)}


add a a 1@int64;
mul b b 2@int64;
add a a 1@int64;
mul b b 2@int64;

cut a = 3, b = 4 && a = (const 64 3), b = (const 64 4);

add a a 1@int64;
mul b b 2@int64;
add a a 1@int64;
mul b b 2@int64;



{true && true}


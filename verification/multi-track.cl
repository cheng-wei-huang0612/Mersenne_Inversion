
proc main () = {true && true}


nondet a@sint64;

mov a 1@sint64;
add a a 1@sint64;


cut true && a = (const 64 2);

cut true && true;
add a a 1@sint64;


cut true && a = (const 64 3)
;


{true && true}

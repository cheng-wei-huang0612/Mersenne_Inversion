
proc subroutine(
input0@int64, input1@int64;
output0@int64, output1@int64
) = {true && 
input0 <=u (const 64 8),
input1 <=u (const 64 8)
}

add output0 input0 1@int64;
mul output1 input1 2@int64;

{
    output0 = input0 + 1,
    output1 = input1 * 2
    &&
    output0 = input0 + (const 64 1),
    output1 = input1 * (const 64 2)
    }


proc main(a@int64, b@int64) = {a = 1, b = 1 && a = (const 64 1), b = (const 64 1)}


call subroutine(a, b; a, b);
call subroutine(a, b; a, b);

cut a = 3, b = 4 && a = (const 64 3), b = (const 64 4);

call subroutine(a, b; a, b);
call subroutine(a, b; a, b);




{b = 16 && b = (const 64 16)}


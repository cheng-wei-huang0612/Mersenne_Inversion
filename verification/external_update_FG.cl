proc main (sint32 F0, sint32 F1, sint32 F2, sint32 F3, sint32 F4, sint32 F5, sint32 F6, sint32 F7, sint32 F8, sint32 F9,
           sint32 G0, sint32 G1, sint32 G2, sint32 G3, sint32 G4, sint32 G5, sint32 G6, sint32 G7, sint32 G8, sint32 G9,
           sint32 uu0, sint32 uu1,
           sint32 vv0, sint32 vv1,
           sint32 rr0, sint32 rr1,
           sint32 ss0, sint32 ss1) =
{
    
and [
eqmod
    (
        (
            (
                (F0 * (2**(30*0))) + 
                (F1 * (2**(30*1))) + 
                (F2 * (2**(30*2))) +
                (F3 * (2**(30*3))) +
                (F4 * (2**(30*4))) +
                (F5 * (2**(30*5))) +
                (F6 * (2**(30*6))) +
                (F7 * (2**(30*7))) +
                (F8 * (2**(30*8))) 
            )
            * 
            (
                (uu0 * (2**(30*0))) +
                (uu1 * (2**(30*1))) 
            )
        )
        +
        (
            (
                (G0 * (2**(30*0))) + 
                (G1 * (2**(30*1))) + 
                (G2 * (2**(30*2))) +
                (G3 * (2**(30*3))) +
                (G4 * (2**(30*4))) +
                (G5 * (2**(30*5))) +
                (G6 * (2**(30*6))) +
                (G7 * (2**(30*7))) +
                (G8 * (2**(30*8))) 
            )
            * 
            (
                (vv0 * (2**(30*0))) +
                (vv1 * (2**(30*1))) 
            )
        )
    )
    (
        0
    )
    (2**(30*2)),

eqmod
    (
        (
            (
                (F0 * (2**(30*0))) + 
                (F1 * (2**(30*1))) + 
                (F2 * (2**(30*2))) +
                (F3 * (2**(30*3))) +
                (F4 * (2**(30*4))) +
                (F5 * (2**(30*5))) +
                (F6 * (2**(30*6))) +
                (F7 * (2**(30*7))) +
                (F8 * (2**(30*8))) 
            )
            * 
            (
                (rr0 * (2**(30*0))) +
                (rr1 * (2**(30*1))) 
            )
        )
        +
        (
            (
                (G0 * (2**(30*0))) + 
                (G1 * (2**(30*1))) + 
                (G2 * (2**(30*2))) +
                (G3 * (2**(30*3))) +
                (G4 * (2**(30*4))) +
                (G5 * (2**(30*5))) +
                (G6 * (2**(30*6))) +
                (G7 * (2**(30*7))) +
                (G8 * (2**(30*8))) 
            )
            * 
            (
                (ss0 * (2**(30*0))) +
                (ss1 * (2**(30*1))) 
            )
        )
    )
    (
        0
    )
    (2**(30*2))
	
]
    
    && 


	and [
	(const 32 0)<=s F0, F0 <s (const 32 (2**30)),
	(const 32 0)<=s F1, F1 <s (const 32 (2**30)),
	(const 32 0)<=s F2, F2 <s (const 32 (2**30)),
	(const 32 0)<=s F3, F3 <s (const 32 (2**30)),
	(const 32 0)<=s F4, F4 <s (const 32 (2**30)),
	(const 32 0)<=s F5, F5 <s (const 32 (2**30)),
	(const 32 0)<=s F6, F6 <s (const 32 (2**30)),
	(const 32 0)<=s F7, F7 <s (const 32 (2**30)),
	(const 32 (-(2**16)))<=s F8, F8 <s (const 32 (2**16)),
	(const 32 (-1))<=s F9, F9 <s (const 32 (1)),
	(const 32 0)<=s G0, G0 <s (const 32 (2**30)),
	(const 32 0)<=s G1, G1 <s (const 32 (2**30)),
	(const 32 0)<=s G2, G2 <s (const 32 (2**30)),
	(const 32 0)<=s G3, G3 <s (const 32 (2**30)),
	(const 32 0)<=s G4, G4 <s (const 32 (2**30)),
	(const 32 0)<=s G5, G5 <s (const 32 (2**30)),
	(const 32 0)<=s G6, G6 <s (const 32 (2**30)),
	(const 32 0)<=s G7, G7 <s (const 32 (2**30)),
	(const 32 (-(2**16)))<=s G8, G8 <s (const 32 (2**16)),
	(const 32 (-1))<=s G9, G9 <s (const 32 (1)),

      const 32 0 <=s uu0, uu0 <s const 32 1073741824,
      const 32 0 <=s vv0, vv0 <s const 32 1073741824,
      const 32 0 <=s rr0, rr0 <s const 32 1073741824,
      const 32 0 <=s ss0, ss0 <s const 32 1073741824,

      const 32 (-1073741824) <=s uu1, uu1 <s const 32 1073741824,
      const 32 (-1073741824) <=s vv1, vv1 <s const 32 1073741824,
      const 32 (-1073741824) <=s rr1, rr1 <s const 32 1073741824,
      const 32 (-1073741824) <=s ss1, ss1 <s const 32 1073741824,




  umod 
  (
  (
    (sext uu0 300) 
    + ((sext uu1 300) * (const 332 (2**30)))  

  * 
      ((sext F0 300)
    + ((sext F1 300) * (const 332 (2**30)))  
    + ((sext F2 300) * (const 332 (2**60)))  
    + ((sext F3 300) * (const 332 (2**90)))  
    + ((sext F4 300) * (const 332 (2**120)))  
    + ((sext F5 300) * (const 332 (2**150)))  
    + ((sext F6 300) * (const 332 (2**180)))  
    + ((sext F7 300) * (const 332 (2**210)))  
    + ((sext F8 300) * (const 332 (2**240))))
  )
  +
  (
      
    (sext vv0 300) 
    + ((sext vv1 300) * (const 332 (2**30)))  
  * 
      ((sext G0 300)
    + ((sext G1 300) * (const 332 (2**30)))  
    + ((sext G2 300) * (const 332 (2**60)))  
    + ((sext G3 300) * (const 332 (2**90)))  
    + ((sext G4 300) * (const 332 (2**120)))  
    + ((sext G5 300) * (const 332 (2**150)))  
    + ((sext G6 300) * (const 332 (2**180)))  
    + ((sext G7 300) * (const 332 (2**210)))  
    + ((sext G8 300) * (const 332 (2**240))))
  )
  )
  
  (const 332 (2**60))
  =
  const 332 0,



    umod 
  (
  (
    (sext rr0 300) 
    + ((sext rr1 300) * (const 332 (2**30)))  
  * 
      ((sext F0 300)
    + ((sext F1 300) * (const 332 (2**30)))  
    + ((sext F2 300) * (const 332 (2**60)))  
    + ((sext F3 300) * (const 332 (2**90)))  
    + ((sext F4 300) * (const 332 (2**120)))  
    + ((sext F5 300) * (const 332 (2**150)))  
    + ((sext F6 300) * (const 332 (2**180)))  
    + ((sext F7 300) * (const 332 (2**210)))  
    + ((sext F8 300) * (const 332 (2**240))))
  )
  +
  (
    (sext ss0 300) 
    + ((sext ss1 300) * (const 332 (2**30)))  
  * 
      ((sext G0 300)
    + ((sext G1 300) * (const 332 (2**30)))  
    + ((sext G2 300) * (const 332 (2**60)))  
    + ((sext G3 300) * (const 332 (2**90)))  
    + ((sext G4 300) * (const 332 (2**120)))  
    + ((sext G5 300) * (const 332 (2**150)))  
    + ((sext G6 300) * (const 332 (2**180)))  
    + ((sext G7 300) * (const 332 (2**210)))  
    + ((sext G8 300) * (const 332 (2**240))))
  )
  )
  
  (const 332 (2**60))
  =
  const 332 0



    ]


}



mov v1_0 (1073741823)@sint32;
mov v1_1 0@sint32;
mov v1_2 (1073741823)@sint32;
mov v1_3 0@sint32;




mov v3_0 F0;
mov v3_1 F1;
mov v3_2 G0;
mov v3_3 G1;
mov v4_0 F2;
mov v4_1 F3;
mov v4_2 G2;
mov v4_3 G3;
mov v5_0 F4;
mov v5_1 F5;
mov v5_2 G4;
mov v5_3 G5;
mov v6_0 F6;
mov v6_1 F7;
mov v6_2 G6;
mov v6_3 G7;
mov v7_0 F8;
mov v7_1 F9;
mov v7_2 G8;
mov v7_3 G9;
mov v13_0 uu0;
mov v13_1 rr0;
mov v13_2 vv0;
mov v13_3 ss0;
mov v14_0 uu1;
mov v14_1 rr1;
mov v14_2 vv1;
mov v14_3 ss1;




(* #! -> SP = 0xffffe3c84610 *)
#! 0xffffe3c84610 = 0xffffe3c84610;
(* smull	v16.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaab1210718 *)
smulj v16_sint64_0 v13_0 v3_0;
smulj v16_sint64_1 v13_1 v3_0;





(* smlal2	v16.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaab121071c *)
smulj vtmp_sint64_0 v13_2 v3_2;
smulj vtmp_sint64_1 v13_3 v3_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;




    assert v16_sint64_0 = (uu0 * F0) + (vv0 * G0) && true;
    assert v16_sint64_1 = (rr0 * F0) + (ss0 * G0) && true;
    assert eqmod v16_sint64_0 0 (2**30) && true;
    assert eqmod v16_sint64_1 0 (2**30) && true;
    assume true && v16_sint64_0 = (const 64 0) (umod (const 64 (2**30)));
    assume true && v16_sint64_1 = (const 64 0) (umod (const 64 (2**30)));



(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab1210720 *)

split v16_sint64_0 dc v16_sint64_0 30;
    assert true && dc = (const 64 0);
split v16_sint64_1 dc v16_sint64_1 30;
    assert true && dc = (const 64 0);


    assert true && (v16_sint64_0 * (const 64 (2**30))) = (((sext uu0 32) * (sext F0 32)) + ((sext vv0 32) * (sext G0 32)));
    assert true && (v16_sint64_1 * (const 64 (2**30))) = (((sext rr0 32) * (sext F0 32)) + ((sext ss0 32) * (sext G0 32)));
    assume (v16_sint64_0 * (2**30)) = (uu0 * F0) + (vv0 * G0) && true;
    assume (v16_sint64_1 * (2**30)) = (rr0 * F0) + (ss0 * G0) && true;


(* smlal	v16.2d, v14.2s, v3.s[0]                   #! PC = 0xaaaab1210724 *)
smulj vtmp_sint64_0 v14_0 v3_0;
smulj vtmp_sint64_1 v14_1 v3_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**30)) = (uu0 * F0) + (vv0 * G0) + (((uu1 * F0)) * (2**30)) && true;
    assert (v16_sint64_1 * (2**30)) = (rr0 * F0) + (ss0 * G0) + (((rr1 * F0)) * (2**30)) && true;


(* smlal2	v16.2d, v14.4s, v3.s[2]                  #! PC = 0xaaaab1210728 *)
smulj vtmp_sint64_0 v14_2 v3_2;
smulj vtmp_sint64_1 v14_3 v3_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**30)) = (uu0 * F0) + (vv0 * G0) + (((uu1 * F0) + (vv1 * G0)) * (2**30)) && true;
    assert (v16_sint64_1 * (2**30)) = (rr0 * F0) + (ss0 * G0) + (((rr1 * F0) + (ss1 * G0)) * (2**30)) && true;



(* smlal	v16.2d, v13.2s, v3.s[1]                   #! PC = 0xaaaab121072c *)
smulj vtmp_sint64_0 v13_0 v3_1;
smulj vtmp_sint64_1 v13_1 v3_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**30)) = (uu0 * F0) + (vv0 * G0) + (((uu1 * F0) + (vv1 * G0) + (uu0 * F1)) * (2**30)) && true;
    assert (v16_sint64_1 * (2**30)) = (rr0 * F0) + (ss0 * G0) + (((rr1 * F0) + (ss1 * G0) + (rr0 * F1)) * (2**30)) && true;


(* smlal2	v16.2d, v13.4s, v3.s[3]                  #! PC = 0xaaaab1210730 *)
smulj vtmp_sint64_0 v13_2 v3_3;
smulj vtmp_sint64_1 v13_3 v3_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;

    assert (v16_sint64_0 * (2**30)) = (uu0 * F0) + (vv0 * G0) + (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)) && true;
    assert (v16_sint64_1 * (2**30)) = (rr0 * F0) + (ss0 * G0) + (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)) && true;

    assume (v16_sint64_0 * (2**30)) = (uu0 * F0) + (vv0 * G0) + (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)) 
          &&
           ((sext v16_sint64_0 32) * (const 96 (2**30))) = 
              (((sext uu0 64) * (sext F0 64)) + ((sext vv0 64) * (sext G0 64))) + 
              ((((sext uu1 64) * (sext F0 64)) + ((sext vv1 64) * (sext G0 64)) + ((sext uu0 64) * (sext F1 64)) + ((sext vv0 64) * (sext G1 64))  ) * (const 96 (2**30))) ;
    assume (v16_sint64_1 * (2**30)) = (rr0 * F0) + (ss0 * G0) + (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)) 
          &&
           ((sext v16_sint64_1 32) * (const 96 (2**30))) = 
              (((sext rr0 64) * (sext F0 64)) + ((sext ss0 64) * (sext G0 64))) + 
              ((((sext rr1 64) * (sext F0 64)) + ((sext ss1 64) * (sext G0 64)) + ((sext rr0 64) * (sext F1 64)) + ((sext ss0 64) * (sext G1 64))  ) * (const 96 (2**30))) ;

    assert eqmod ((uu0 * F0) + (vv0 * G0) + (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))) 0 (2**60) && true;
    assert eqmod ((rr0 * F0) + (ss0 * G0) + (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))) 0 (2**60) && true;


    assert eqmod (v16_sint64_0 * (2**30)) 0 (2**60) && true;
    assert eqmod (v16_sint64_1 * (2**30)) 0 (2**60) && true;
    assume true && (sext v16_sint64_0 32) * (const 96 (2**30)) = (const 96 0 ) (umod (const 96 (2**60)));
    assume true && (sext v16_sint64_1 32) * (const 96 (2**30)) = (const 96 0 ) (umod (const 96 (2**60)));
    assert true && v16_sint64_0 = (const 64 0) (umod (const 64 (2**30)));
    assert true && v16_sint64_1 = (const 64 0) (umod (const 64 (2**30)));
    assume eqmod v16_sint64_0 0 (2**30) && true;
    assume eqmod v16_sint64_1 0 (2**30) && true;



(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab1210734 *)
split v16_sint64_0 dc v16_sint64_0 30;
    assert true && dc = (const 64 0);
split v16_sint64_1 dc v16_sint64_1 30;
    assert true && dc = (const 64 0);

    
    assert true
          &&
           ((sext v16_sint64_0 32) * (const 96 (2**60))) = 
              (((sext uu0 64) * (sext F0 64)) + ((sext vv0 64) * (sext G0 64))) + 
              ((((sext uu1 64) * (sext F0 64)) + ((sext vv1 64) * (sext G0 64)) + ((sext uu0 64) * (sext F1 64)) + ((sext vv0 64) * (sext G1 64))  ) * (const 96 (2**30)));
    assert true
          &&
           ((sext v16_sint64_1 32) * (const 96 (2**60))) = 
              (((sext rr0 64) * (sext F0 64)) + ((sext ss0 64) * (sext G0 64))) + 
              ((((sext rr1 64) * (sext F0 64)) + ((sext ss1 64) * (sext G0 64)) + ((sext rr0 64) * (sext F1 64)) + ((sext ss0 64) * (sext G1 64))  ) * (const 96 (2**30)));



    assume (v16_sint64_0 * (2**60)) = (uu0 * F0) + (vv0 * G0) + (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)) 
          &&
           ((sext v16_sint64_0 32) * (const 96 (2**60))) = 
              (((sext uu0 64) * (sext F0 64)) + ((sext vv0 64) * (sext G0 64))) + 
              ((((sext uu1 64) * (sext F0 64)) + ((sext vv1 64) * (sext G0 64)) + ((sext uu0 64) * (sext F1 64)) + ((sext vv0 64) * (sext G1 64))  ) * (const 96 (2**30)));

    assume (v16_sint64_1 * (2**60)) = (rr0 * F0) + (ss0 * G0) + (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)) 
          &&
           ((sext v16_sint64_1 32) * (const 96 (2**60))) = 
              (((sext rr0 64) * (sext F0 64)) + ((sext ss0 64) * (sext G0 64))) + 
              ((((sext rr1 64) * (sext F0 64)) + ((sext ss1 64) * (sext G0 64)) + ((sext rr0 64) * (sext F1 64)) + ((sext ss0 64) * (sext G1 64))  ) * (const 96 (2**30)));




(* smlal	v16.2d, v14.2s, v3.s[1]                   #! PC = 0xaaaab1210738 *)
smulj vtmp_sint64_0 v14_0 v3_1;
smulj vtmp_sint64_1 v14_1 v3_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**60)) = (uu0 * F0) + (vv0 * G0) + 
            (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
            (((uu1 * F1) ) * (2**60))  
            && true;

    assert (v16_sint64_1 * (2**60)) = (rr0 * F0) + (ss0 * G0) + 
            (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
            (((rr1 * F1) ) * (2**60))  
            && true;
    


(* smlal2	v16.2d, v14.4s, v3.s[3]                  #! PC = 0xaaaab121073c *)
smulj vtmp_sint64_0 v14_2 v3_3;
smulj vtmp_sint64_1 v14_3 v3_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**60)) = (uu0 * F0) + (vv0 * G0) + 
            (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
            (((uu1 * F1) + (vv1 * G1)) * (2**60))  
            && true;

    assert (v16_sint64_1 * (2**60)) = (rr0 * F0) + (ss0 * G0) + 
            (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
            (((rr1 * F1) + (ss1 * G1)) * (2**60))  
            && true;
    

(* smlal	v16.2d, v13.2s, v4.s[0]                   #! PC = 0xaaaab1210740 *)
smulj vtmp_sint64_0 v13_0 v4_0;
smulj vtmp_sint64_1 v13_1 v4_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**60)) = (uu0 * F0) + (vv0 * G0) + 
            (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
            (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) ) * (2**60))  
            && true;

    assert (v16_sint64_1 * (2**60)) = (rr0 * F0) + (ss0 * G0) + 
            (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
            (((rr1 * F1) + (ss1 * G1) + (rr0 * F2)) * (2**60))  
            && true;

(* smlal2	v16.2d, v13.4s, v4.s[2]                  #! PC = 0xaaaab1210744 *)
smulj vtmp_sint64_0 v13_2 v4_2;
smulj vtmp_sint64_1 v13_3 v4_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;



    assert (v16_sint64_0 * (2**60)) = (uu0 * F0) + (vv0 * G0) + 
            (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
            (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  
            && true;

    assert (v16_sint64_1 * (2**60)) = (rr0 * F0) + (ss0 * G0) + 
            (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
            (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  
            && true;

    assume (v16_sint64_0 * (2**60)) = (uu0 * F0) + (vv0 * G0) + 
            (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
            (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  
            && 
           ((sext v16_sint64_0 64) * (const 128 (2**60))) = 
              (
                ((sext uu0 96) * (sext F0 96)) + ((sext vv0 96) * (sext G0 96))
              )
              + 
              (
                (((sext uu1 96) * (sext F0 96)) + ((sext vv1 96) * (sext G0 96)) + ((sext uu0 96) * (sext F1 96)) + ((sext vv0 96) * (sext G1 96))  ) * (const 128 (2**30))
              )
              + 
              (
                (((sext uu1 96) * (sext F1 96)) + ((sext vv1 96) * (sext G1 96)) + ((sext uu0 96) * (sext F2 96)) + ((sext vv0 96) * (sext G2 96))  ) * (const 128 (2**60))
              );


    assume (v16_sint64_1 * (2**60)) = (rr0 * F0) + (ss0 * G0) + 
            (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
            (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  
            && 
            ((sext v16_sint64_1 64) * (const 128 (2**60))) = 
              (
                ((sext rr0 96) * (sext F0 96)) + ((sext ss0 96) * (sext G0 96))
              )
              + 
              (
                (((sext rr1 96) * (sext F0 96)) + ((sext ss1 96) * (sext G0 96)) + ((sext rr0 96) * (sext F1 96)) + ((sext ss0 96) * (sext G1 96))  ) * (const 128 (2**30))
              )
              + 
              (
                (((sext rr1 96) * (sext F1 96)) + ((sext ss1 96) * (sext G1 96)) + ((sext rr0 96) * (sext F2 96)) + ((sext ss0 96) * (sext G2 96))  ) * (const 128 (2**60))
              );


(* and	v3.16b, v16.16b, v1.16b                     #! PC = 0xaaaab1210748 *)
split dc v3_sint64_0 v16_sint64_0 30;
split dc v3_sint64_1 v16_sint64_1 30;




mov F0_new v3_sint64_0;
mov G0_new v3_sint64_1;




(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab121074c *)
split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;



    assert true
            && 
           ((sext v16_sint64_0 64) * (const 128 (2**90)) + (sext F0_new 64) * (const 128 (2**60))) = 
              (
                ((sext uu0 96) * (sext F0 96)) + ((sext vv0 96) * (sext G0 96))
              )
              + 
              (
                (((sext uu1 96) * (sext F0 96)) + ((sext vv1 96) * (sext G0 96)) + ((sext uu0 96) * (sext F1 96)) + ((sext vv0 96) * (sext G1 96))  ) * (const 128 (2**30))
              )
              + 
              (
                (((sext uu1 96) * (sext F1 96)) + ((sext vv1 96) * (sext G1 96)) + ((sext uu0 96) * (sext F2 96)) + ((sext vv0 96) * (sext G2 96))  ) * (const 128 (2**60))
              );


    assert true
            && 
           ((sext v16_sint64_1 64) * (const 128 (2**90)) + (sext G0_new 64) * (const 128 (2**60))) = 
              (
                ((sext rr0 96) * (sext F0 96)) + ((sext ss0 96) * (sext G0 96))
              )
              + 
              (
                (((sext rr1 96) * (sext F0 96)) + ((sext ss1 96) * (sext G0 96)) + ((sext rr0 96) * (sext F1 96)) + ((sext ss0 96) * (sext G1 96))  ) * (const 128 (2**30))
              )
              + 
              (
                (((sext rr1 96) * (sext F1 96)) + ((sext ss1 96) * (sext G1 96)) + ((sext rr0 96) * (sext F2 96)) + ((sext ss0 96) * (sext G2 96))  ) * (const 128 (2**60))
              );


    assume (v16_sint64_0 * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            && 
            true;


    assume (v16_sint64_1 * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            && 
            true;




(* smlal	v16.2d, v14.2s, v4.s[0]                   #! PC = 0xaaaab1210750 *)
smulj vtmp_sint64_0 v14_0 v4_0;
smulj vtmp_sint64_1 v14_1 v4_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2)) 
              * 
              (2**90)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2)) 
              * 
              (2**90)
            )
            && 
            true;



(* smlal2	v16.2d, v14.4s, v4.s[2]                  #! PC = 0xaaaab1210754 *)
smulj vtmp_sint64_0 v14_2 v4_2;
smulj vtmp_sint64_1 v14_3 v4_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2))
              * 
              (2**90)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2)) 
              * 
              (2**90)
            )
            && 
            true;


(* smlal	v16.2d, v13.2s, v4.s[1]                   #! PC = 0xaaaab1210758 *)
smulj vtmp_sint64_0 v13_0 v4_1;
smulj vtmp_sint64_1 v13_1 v4_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3))
              * 
              (2**90)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3)) 
              * 
              (2**90)
            )
            && 
            true;


(* smlal2	v16.2d, v13.4s, v4.s[3]                  #! PC = 0xaaaab121075c *)
smulj vtmp_sint64_0 v13_2 v4_3;
smulj vtmp_sint64_1 v13_3 v4_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;


    assert (v16_sint64_0 * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            && 
            true;

    assume (v16_sint64_0 * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            && 
            true;


    assume (v16_sint64_1 * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            && 
            true;




(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaab1210760 *)
split dc v17_sint64_0 v16_sint64_0 30;
split dc v17_sint64_1 v16_sint64_1 30;


    assert eqmod v17_sint64_0 v16_sint64_0 (2**30) && true;
    assert eqmod v17_sint64_1 v16_sint64_1 (2**30) && true;


(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab1210764 *)

ghost v16_sint64_0o@sint64, v16_sint64_1o@sint64 :
and [v16_sint64_0o=v16_sint64_0, v16_sint64_1o=v16_sint64_1]
&&
and [v16_sint64_0o=v16_sint64_0, v16_sint64_1o=v16_sint64_1];



split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;



(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaab1210768 *)
(* orr	v3.16b, v3.16b, v17.16b                     #! PC = 0xaaaab121076c *)

assert 
true 
&&
(const 64 0) <= v17_sint64_0, v17_sint64_0 <(const 64 (2**30)),
(const 64 0) <= v17_sint64_1, v17_sint64_1 <(const 64 (2**30)),
(const 64 0) <= v3_sint64_0, v3_sint64_0 <(const 64 (2**30)),
(const 64 0) <= v3_sint64_1, v3_sint64_1 <(const 64 (2**30));

assert 
true 
&&
(const 64 0) <= v17_sint64_0, v17_sint64_0 <(const 64 (2**32)),
(const 64 0) <= v17_sint64_1, v17_sint64_1 <(const 64 (2**32)),
(const 64 0) <= v3_sint64_0, v3_sint64_0 <(const 64 (2**32)),
(const 64 0) <= v3_sint64_1, v3_sint64_1 <(const 64 (2**32));


vpc v3_sint32_0@uint32 v3_sint64_0;
vpc v3_sint32_2@uint32 v3_sint64_1;
vpc v17_sint32_0@uint32 v17_sint64_0;
vpc v17_sint32_1@uint32 v17_sint64_1;
mov v3_sint32_1 v17_sint32_0;
mov v3_sint32_3 v17_sint32_1;


vpc F0_new@sint64 v3_sint32_0;
vpc G0_new@sint64 v3_sint32_2;
vpc F1_new@sint64 v3_sint32_1;
vpc G1_new@sint64 v3_sint32_3;


    assert true && v16_sint64_0o = v16_sint64_0 * (const 64 (2**30)) + F1_new  ;
    assert true && v16_sint64_1o = v16_sint64_1 * (const 64 (2**30)) + G1_new  ;
    assume v16_sint64_0o = v16_sint64_0 * (2**30) + F1_new && true;
    assume v16_sint64_1o = v16_sint64_1 * (2**30) + G1_new && true;

    assert (v16_sint64_0o * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            && 
            true;


    assert (v16_sint64_1o * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            && 
            true;

    assert (v16_sint64_0 * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            && 
            true;






(* smlal	v16.2d, v14.2s, v4.s[1]                   #! PC = 0xaaaab1210770 *)
smulj vtmp_sint64_0 v14_0 v4_1;
smulj vtmp_sint64_1 v14_1 v4_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v14.4s, v4.s[3]                  #! PC = 0xaaaab1210774 *)
smulj vtmp_sint64_0 v14_2 v4_3;
smulj vtmp_sint64_1 v14_3 v4_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal	v16.2d, v13.2s, v5.s[0]                   #! PC = 0xaaaab1210778 *)
smulj vtmp_sint64_0 v13_0 v5_0;
smulj vtmp_sint64_1 v13_1 v5_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v13.4s, v5.s[2]                  #! PC = 0xaaaab121077c *)
smulj vtmp_sint64_0 v13_2 v5_2;
smulj vtmp_sint64_1 v13_3 v5_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;





    assert (v16_sint64_0 * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            && 
            true;


(* and	v4.16b, v16.16b, v1.16b                     #! PC = 0xaaaab1210780 *)

split dc v4_sint64_0 v16_sint64_0 30;
split dc v4_sint64_1 v16_sint64_1 30;

mov F2_new v4_sint64_0;
mov G2_new v4_sint64_1;


(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab1210784 *)
ghost v16_sint64_0o1@sint64, v16_sint64_1o1@sint64 :
and [v16_sint64_0o1=v16_sint64_0, v16_sint64_1o1=v16_sint64_1]
&&
and [v16_sint64_0o1=v16_sint64_0, v16_sint64_1o1=v16_sint64_1];
split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;


    assert true && v16_sint64_0o1 = v16_sint64_0 * (const 64 (2**30)) + F2_new  ;
    assert true && v16_sint64_1o1 = v16_sint64_1 * (const 64 (2**30)) + G2_new  ;
    assume v16_sint64_0o1 = v16_sint64_0 * (2**30) + F2_new && true;
    assume v16_sint64_1o1 = v16_sint64_1 * (2**30) + G2_new && true;


    assert (v16_sint64_0o1 * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            && 
            true;


    assert (v16_sint64_1o1 * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            && 
            true;

    assert (v16_sint64_0 * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**150) + G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            && 
            true;




(* smlal	v16.2d, v14.2s, v5.s[0]                   #! PC = 0xaaaab1210788 *)
smulj vtmp_sint64_0 v14_0 v5_0;
smulj vtmp_sint64_1 v14_1 v5_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v14.4s, v5.s[2]                  #! PC = 0xaaaab121078c *)
smulj vtmp_sint64_0 v14_2 v5_2;
smulj vtmp_sint64_1 v14_3 v5_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal	v16.2d, v13.2s, v5.s[1]                   #! PC = 0xaaaab1210790 *)
smulj vtmp_sint64_0 v13_0 v5_1;
smulj vtmp_sint64_1 v13_1 v5_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v13.4s, v5.s[3]                  #! PC = 0xaaaab1210794 *)
smulj vtmp_sint64_0 v13_2 v5_3;
smulj vtmp_sint64_1 v13_3 v5_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;



    assert (v16_sint64_0 * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**150) + G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            && 
            true;



(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaab1210798 *)
split dc v17_sint64_0 v16_sint64_0 30;
split dc v17_sint64_1 v16_sint64_1 30;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab121079c *)

ghost v16_sint64_0o2@sint64, v16_sint64_1o2@sint64 :
and [v16_sint64_0o2=v16_sint64_0, v16_sint64_1o2=v16_sint64_1]
&&
and [v16_sint64_0o2=v16_sint64_0, v16_sint64_1o2=v16_sint64_1];



split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;
(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaab12107a0 *)
(* orr	v4.16b, v4.16b, v17.16b                     #! PC = 0xaaaab12107a4 *)


vpc v17_sint32_0@sint32 v17_sint64_0;
vpc v17_sint32_1@sint32 v17_sint64_1;
vpc v4_sint32_0@sint32 v4_sint64_0;
vpc v4_sint32_2@sint32 v4_sint64_1;

mov v4_sint32_1 v17_sint32_0;
mov v4_sint32_3 v17_sint32_1;


vpc F2_new@sint64 v4_sint32_0;
vpc G2_new@sint64 v4_sint32_2;
vpc F3_new@sint64 v4_sint32_1;
vpc G3_new@sint64 v4_sint32_3;




    assert true && v16_sint64_0o2 = v16_sint64_0 * (const 64 (2**30)) + F3_new  ;
    assert true && v16_sint64_1o2 = v16_sint64_1 * (const 64 (2**30)) + G3_new  ;
    assume v16_sint64_0o2 = v16_sint64_0 * (2**30) + F3_new && true;
    assume v16_sint64_1o2 = v16_sint64_1 * (2**30) + G3_new && true;


    assert (v16_sint64_0o2 * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            && 
            true;


    assert (v16_sint64_1o2 * (2**150) + G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            && 
            true;

    assert (v16_sint64_0 * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            && 
            true;




(* smlal	v16.2d, v14.2s, v5.s[1]                   #! PC = 0xaaaab12107a8 *)
smulj vtmp_sint64_0 v14_0 v5_1;
smulj vtmp_sint64_1 v14_1 v5_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v14.4s, v5.s[3]                  #! PC = 0xaaaab12107ac *)
smulj vtmp_sint64_0 v14_2 v5_3;
smulj vtmp_sint64_1 v14_3 v5_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal	v16.2d, v13.2s, v6.s[0]                   #! PC = 0xaaaab12107b0 *)
smulj vtmp_sint64_0 v13_0 v6_0;
smulj vtmp_sint64_1 v13_1 v6_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v13.4s, v6.s[2]                  #! PC = 0xaaaab12107b4 *)
smulj vtmp_sint64_0 v13_2 v6_2;
smulj vtmp_sint64_1 v13_3 v6_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;



    assert (v16_sint64_0 * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            && 
            true;





(* and	v5.16b, v16.16b, v1.16b                     #! PC = 0xaaaab12107b8 *)
split dc v5_sint64_0 v16_sint64_0 30;
split dc v5_sint64_1 v16_sint64_1 30;

mov F4_new v5_sint64_0;
mov G4_new v5_sint64_1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab12107bc *)

ghost v16_sint64_0o3@sint64, v16_sint64_1o3@sint64 :
and [v16_sint64_0o3=v16_sint64_0, v16_sint64_1o3=v16_sint64_1]
&&
and [v16_sint64_0o3=v16_sint64_0, v16_sint64_1o3=v16_sint64_1];


split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;


    assert true && v16_sint64_0o3 = v16_sint64_0 * (const 64 (2**30)) + F4_new  ;
    assert true && v16_sint64_1o3 = v16_sint64_1 * (const 64 (2**30)) + G4_new  ;
    assume v16_sint64_0o3 = v16_sint64_0 * (2**30) + F4_new && true;
    assume v16_sint64_1o3 = v16_sint64_1 * (2**30) + G4_new && true;



    assert (v16_sint64_0o3 * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            && 
            true;


    assert (v16_sint64_1o3 * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            && 
            true;




    assert (v16_sint64_0 * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            && 
            true;


(* smlal	v16.2d, v14.2s, v6.s[0]                   #! PC = 0xaaaab12107c0 *)
smulj vtmp_sint64_0 v14_0 v6_0;
smulj vtmp_sint64_1 v14_1 v6_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v14.4s, v6.s[2]                  #! PC = 0xaaaab12107c4 *)
smulj vtmp_sint64_0 v14_2 v6_2;
smulj vtmp_sint64_1 v14_3 v6_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal	v16.2d, v13.2s, v6.s[1]                   #! PC = 0xaaaab12107c8 *)
smulj vtmp_sint64_0 v13_0 v6_1;
smulj vtmp_sint64_1 v13_1 v6_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v13.4s, v6.s[3]                  #! PC = 0xaaaab12107cc *)
smulj vtmp_sint64_0 v13_2 v6_3;
smulj vtmp_sint64_1 v13_3 v6_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;

    assert (v16_sint64_0 * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            && 
            true;

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaab12107d0 *)
split dc v17_sint64_0 v16_sint64_0 30;
split dc v17_sint64_1 v16_sint64_1 30;

mov F5_new v17_sint64_0;
mov G5_new v17_sint64_1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab12107d4 *)
ghost v16_sint64_0o4@sint64, v16_sint64_1o4@sint64 :
and [v16_sint64_0o4=v16_sint64_0, v16_sint64_1o4=v16_sint64_1]
&&
and [v16_sint64_0o4=v16_sint64_0, v16_sint64_1o4=v16_sint64_1];

split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaab12107d8 *)
(* orr	v5.16b, v5.16b, v17.16b                     #! PC = 0xaaaab12107dc *)

vpc v5_sint32_0@sint32 v5_sint64_0;
vpc v5_sint32_2@sint32 v5_sint64_1;
vpc v5_sint32_1@sint32 v17_sint64_0;
vpc v5_sint32_3@sint32 v17_sint64_1;

vpc F4_new@sint64 v5_sint32_0;
vpc G4_new@sint64 v5_sint32_2;
vpc F5_new@sint64 v5_sint32_1;
vpc G5_new@sint64 v5_sint32_3;


    assert true && v16_sint64_0o4 = v16_sint64_0 * (const 64 (2**30)) + F5_new  ;
    assert true && v16_sint64_1o4 = v16_sint64_1 * (const 64 (2**30)) + G5_new  ;
    assume v16_sint64_0o4 = v16_sint64_0 * (2**30) + F5_new && true;
    assume v16_sint64_1o4 = v16_sint64_1 * (2**30) + G5_new && true;

    assert (v16_sint64_0o4 * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            && 
            true;


    assert (v16_sint64_1o4 * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            && 
            true;


    assert (v16_sint64_0 * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            && 
            true;



(* smlal	v16.2d, v14.2s, v6.s[1]                   #! PC = 0xaaaab12107e0 *)
smulj vtmp_sint64_0 v14_0 v6_1;
smulj vtmp_sint64_1 v14_1 v6_1;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v14.4s, v6.s[3]                  #! PC = 0xaaaab12107e4 *)
smulj vtmp_sint64_0 v14_2 v6_3;
smulj vtmp_sint64_1 v14_3 v6_3;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal	v16.2d, v13.2s, v7.s[0]                   #! PC = 0xaaaab12107e8 *)
smulj vtmp_sint64_0 v13_0 v7_0;
smulj vtmp_sint64_1 v13_1 v7_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v13.4s, v7.s[2]                  #! PC = 0xaaaab12107ec *)
smulj vtmp_sint64_0 v13_2 v7_2;
smulj vtmp_sint64_1 v13_3 v7_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;



    assert (v16_sint64_0 * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            +
            (
              ((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8))
              * 
              (2**240)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            +
            (
              ((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) 
              * 
              (2**240)
            )
            && 
            true;


(* and	v6.16b, v16.16b, v1.16b                     #! PC = 0xaaaab12107f0 *)
split dc v6_sint64_0 v16_sint64_0 30;
split dc v6_sint64_1 v16_sint64_1 30;

mov F6_new v6_sint64_0;
mov G6_new v6_sint64_1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaab12107f4 *)
ghost v16_sint64_0o5@sint64, v16_sint64_1o5@sint64 :
and [v16_sint64_0o5=v16_sint64_0, v16_sint64_1o5=v16_sint64_1]
&&
and [v16_sint64_0o5=v16_sint64_0, v16_sint64_1o5=v16_sint64_1];

split v16_sint64_0 dc v16_sint64_0 30;
split v16_sint64_1 dc v16_sint64_1 30;


    assert true && v16_sint64_0o5 = v16_sint64_0 * (const 64 (2**30)) + F6_new  ;
    assert true && v16_sint64_1o5 = v16_sint64_1 * (const 64 (2**30)) + G6_new  ;
    assume v16_sint64_0o5 = v16_sint64_0 * (2**30) + F6_new && true;
    assume v16_sint64_1o5 = v16_sint64_1 * (2**30) + G6_new && true;


    assert (v16_sint64_0o5 * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            +
            (
              ((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8))
              * 
              (2**240)
            )
            && 
            true;


    assert (v16_sint64_1o5 * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            +
            (
              ((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) 
              * 
              (2**240)
            )
            && 
            true;


    assert (v16_sint64_0 * (2**270) + F6_new * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            +
            (
              ((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8))
              * 
              (2**240)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**270) + G6_new * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            +
            (
              ((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) 
              * 
              (2**240)
            )
            && 
            true;


(* smlal	v16.2d, v14.2s, v7.s[0]                   #! PC = 0xaaaab12107f8 *)
smulj vtmp_sint64_0 v14_0 v7_0;
smulj vtmp_sint64_1 v14_1 v7_0;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;
(* smlal2	v16.2d, v14.4s, v7.s[2]                  #! PC = 0xaaaab12107fc *)
smulj vtmp_sint64_0 v14_2 v7_2;
smulj vtmp_sint64_1 v14_3 v7_2;
add v16_sint64_0 v16_sint64_0 vtmp_sint64_0;
add v16_sint64_1 v16_sint64_1 vtmp_sint64_1;



    assert (v16_sint64_0 * (2**270) + F6_new * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            +
            (
              ((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8))
              * 
              (2**240)
            )
            +
            (
              ((uu1 * F8) + (vv1 * G8))
              * 
              (2**270)
            )
            && 
            true;


    assert (v16_sint64_1 * (2**270) + G6_new * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            +
            (
              ((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) 
              * 
              (2**240)
            )
            +
            (
              ((rr1 * F8) + (ss1 * G8)) 
              * 
              (2**270)
            )
            && 
            true;




(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaab1210800 *)

split dc v17_sint64_0 v16_sint64_0 30;
split dc v17_sint64_1 v16_sint64_1 30;

mov F7_new v17_sint64_0;
mov G7_new v17_sint64_1;

(* sshr	v7.2d, v16.2d, #30                         #! PC = 0xaaaab1210804 *)

split v7_sint64_0 dc v16_sint64_0 30;
split v7_sint64_1 dc v16_sint64_1 30;



(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaab1210808 *)
(* orr	v6.16b, v6.16b, v17.16b                     #! PC = 0xaaaab121080c *)

vpc v6_sint32_0@sint32 v6_sint64_0;
vpc v6_sint32_2@sint32 v6_sint64_1;
vpc v6_sint32_1@sint32 v17_sint64_0;
vpc v6_sint32_3@sint32 v17_sint64_1;

vpc F6_new@sint64 v6_sint32_0;
vpc G6_new@sint64 v6_sint32_2;
vpc F7_new@sint64 v6_sint32_1;
vpc G7_new@sint64 v6_sint32_3;




    assert true && v16_sint64_0 = v7_sint64_0 * (const 64 (2**30)) + F7_new  ;
    assert true && v16_sint64_1 = v7_sint64_1 * (const 64 (2**30)) + G7_new  ;
    assume v16_sint64_0 = v7_sint64_0 * (2**30) + F7_new && true;
    assume v16_sint64_1 = v7_sint64_1 * (2**30) + G7_new && true;


    assert (v7_sint64_0 * (2**300) + F7_new * (2**270) + F6_new * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            +
            (
              ((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8))
              * 
              (2**240)
            )
            +
            (
              ((uu1 * F8) + (vv1 * G8))
              * 
              (2**270)
            )
            && 
            true;


    assert (v7_sint64_1 * (2**300) + G7_new * (2**270) + G6_new * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            +
            (
              ((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) 
              * 
              (2**240)
            )
            +
            (
              ((rr1 * F8) + (ss1 * G8)) 
              * 
              (2**270)
            )
            && 
            true;

(* #! <- SP = 0xffffe3c84610 *)
#! 0xffffe3c84610 = 0xffffe3c84610;
(* #ret                                            #! PC = 0xaaaab1210810 *)
#ret                                            #! 0xaaaab1210810 = 0xaaaab1210810;


mov F8_new v7_sint64_0;
mov G8_new v7_sint64_1;


    assert (F8_new * (2**300) + F7_new * (2**270) + F6_new * (2**240) + F5_new * (2**210) + F4_new * (2**180) + F3_new * (2**150) + F2_new * (2**120) + F1_new * (2**90) + F0_new * (2**60)) =
            (
              (uu0 * F0) + (vv0 * G0)
            )
            + 
            (
              ((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30)
            )
            +
            (
              ((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60)
            )
            +
            (
              ((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3))
              * 
              (2**90)
            )
            +
            (
              ((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4))
              * 
              (2**120)
            )
            +
            (
              ((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5))
              * 
              (2**150)
            )
            +
            (
              ((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6))
              * 
              (2**180)
            )
            +
            (
              ((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7))
              * 
              (2**210)
            )
            +
            (
              ((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8))
              * 
              (2**240)
            )
            +
            (
              ((uu1 * F8) + (vv1 * G8))
              * 
              (2**270)
            )
            && 
            true;


    assert (G8_new * (2**300) + G7_new * (2**270) + G6_new * (2**240) + G5_new * (2**210) + G4_new * (2**180) + G3_new * (2**150)+ G2_new * (2**120) + G1_new * (2**90) + G0_new * (2**60)) =
            (
              (rr0 * F0) + (ss0 * G0)
            )
            + 
            (
              ((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30)
            )
            +
            (
              ((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60)
            )
            +
            (
              ((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) 
              * 
              (2**90)
            )
            +
            (
              ((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) 
              * 
              (2**120)
            )
            +
            (
              ((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) 
              * 
              (2**150)
            )
            +
            (
              ((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) 
              * 
              (2**180)
            )
            +
            (
              ((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) 
              * 
              (2**210)
            )
            +
            (
              ((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) 
              * 
              (2**240)
            )
            +
            (
              ((rr1 * F8) + (ss1 * G8)) 
              * 
              (2**270)
            )
            && 
            true;

    #assert true && 
    #(const 64 (-(2**17))) <=s F8_new, F8_new <s (const 64 ((2**17))) ;



{
eqmod 
            (F0_new * (2**60))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  
            )
            (2**90)
,
eqmod 
            (G0_new * (2**60))
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  
            )
            (2**90)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  
            )
            (2**120)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90))
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  
            )
            (2**120)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90) + F2_new * (2**120))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120))  
            )
            (2**150)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90) + G2_new * (2**120))
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120))  
            )
            (2**150)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90) + 
              F2_new * (2**120) + F3_new * (2**150))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120)) +
              (((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5)) * (2**150)) 
            )
            (2**180)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90) + 
              G2_new * (2**120) + G3_new * (2**150))
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120)) +
              (((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) * (2**150))  
            )
            (2**180)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90) + 
              F2_new * (2**120) + F3_new * (2**150) + 
              F4_new * (2**180) )
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120)) +
              (((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5)) * (2**150)) +
              (((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6)) * (2**180)) 
            )
            (2**210)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90) + 
              G2_new * (2**120) + G3_new * (2**150) +
              G4_new * (2**180) )
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120)) +
              (((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) * (2**150)) +
              (((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) * (2**180))  
            )
            (2**210)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90) + 
              F2_new * (2**120) + F3_new * (2**150) + 
              F4_new * (2**180) + F5_new * (2**210))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120)) +
              (((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5)) * (2**150)) +
              (((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6)) * (2**180)) +
              (((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7)) * (2**210)) 
            )
            (2**240)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90) + 
              G2_new * (2**120) + G3_new * (2**150) +
              G4_new * (2**180) + G5_new * (2**210))
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120)) +
              (((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) * (2**150)) +
              (((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) * (2**180)) +
              (((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) * (2**210))
            )
            (2**240)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90) + 
              F2_new * (2**120) + F3_new * (2**150) + 
              F4_new * (2**180) + F5_new * (2**210) + 
              F6_new * (2**240))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120)) +
              (((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5)) * (2**150)) +
              (((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6)) * (2**180)) +
              (((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7)) * (2**210)) +
              (((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8)) * (2**240)) 
            )
            (2**270)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90) + 
              G2_new * (2**120) + G3_new * (2**150) +
              G4_new * (2**180) + G5_new * (2**210) + 
              G6_new * (2**240)) 
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120)) +
              (((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) * (2**150)) +
              (((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) * (2**180)) +
              (((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) * (2**210)) +
              (((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) * (2**240))
            )
            (2**270)
,
eqmod 
            (F0_new * (2**60) + F1_new * (2**90) + 
              F2_new * (2**120) + F3_new * (2**150) + 
              F4_new * (2**180) + F5_new * (2**210) + 
              F6_new * (2**240) + F7_new * (2**270) )
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120)) +
              (((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5)) * (2**150)) +
              (((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6)) * (2**180)) +
              (((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7)) * (2**210)) +
              (((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8)) * (2**240)) +
              (((uu1 * F8) + (vv1 * G8)) * (2**270)) 
            )
            (2**300)
,
eqmod 
            (G0_new * (2**60) + G1_new * (2**90) + 
              G2_new * (2**120) + G3_new * (2**150) +
              G4_new * (2**180) + G5_new * (2**210) + 
              G6_new * (2**240) + G7_new * (2**270)) 
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120)) +
              (((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) * (2**150)) +
              (((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) * (2**180)) +
              (((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) * (2**210)) +
              (((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) * (2**240)) +
              (((uu1 * F8) + (vv1 * G8)) * (2**270)) 
            )
            (2**300)
,
eq
            (F0_new * (2**60) + F1_new * (2**90) + 
              F2_new * (2**120) + F3_new * (2**150) + 
              F4_new * (2**180) + F5_new * (2**210) + 
              F6_new * (2**240) + F7_new * (2**270) +
              F8_new * (2**300))
            (
              (uu0 * F0) + (vv0 * G0) + 
              (((uu1 * F0) + (vv1 * G0) + (uu0 * F1) + (vv0 * G1)) * (2**30))  +
              (((uu1 * F1) + (vv1 * G1) + (uu0 * F2) + (vv0 * G2)) * (2**60))  +
              (((uu1 * F2) + (vv1 * G2) + (uu0 * F3) + (vv0 * G3)) * (2**90))  +
              (((uu1 * F3) + (vv1 * G3) + (uu0 * F4) + (vv0 * G4)) * (2**120)) +
              (((uu1 * F4) + (vv1 * G4) + (uu0 * F5) + (vv0 * G5)) * (2**150)) +
              (((uu1 * F5) + (vv1 * G5) + (uu0 * F6) + (vv0 * G6)) * (2**180)) +
              (((uu1 * F6) + (vv1 * G6) + (uu0 * F7) + (vv0 * G7)) * (2**210)) +
              (((uu1 * F7) + (vv1 * G7) + (uu0 * F8) + (vv0 * G8)) * (2**240)) +
              (((uu1 * F8) + (vv1 * G8)) * (2**270)) 
            )

,
eq
            (G0_new * (2**60) + G1_new * (2**90) + 
              G2_new * (2**120) + G3_new * (2**150) +
              G4_new * (2**180) + G5_new * (2**210) + 
              G6_new * (2**240) + G7_new * (2**270) + 
              G8_new * (2**300)) 
            (
              (rr0 * F0) + (ss0 * G0) + 
              (((rr1 * F0) + (ss1 * G0) + (rr0 * F1) + (ss0 * G1)) * (2**30))  +
              (((rr1 * F1) + (ss1 * G1) + (rr0 * F2) + (ss0 * G2)) * (2**60))  +
              (((rr1 * F2) + (ss1 * G2) + (rr0 * F3) + (ss0 * G3)) * (2**90))  +
              (((rr1 * F3) + (ss1 * G3) + (rr0 * F4) + (ss0 * G4)) * (2**120)) +
              (((rr1 * F4) + (ss1 * G4) + (rr0 * F5) + (ss0 * G5)) * (2**150)) +
              (((rr1 * F5) + (ss1 * G5) + (rr0 * F6) + (ss0 * G6)) * (2**180)) +
              (((rr1 * F6) + (ss1 * G6) + (rr0 * F7) + (ss0 * G7)) * (2**210)) +
              (((rr1 * F7) + (ss1 * G7) + (rr0 * F8) + (ss0 * G8)) * (2**240)) +
              (((uu1 * F8) + (vv1 * G8)) * (2**270)) 
            )

  &&
  true
}


//Copyright 2018 Andrey S. Ionisyan (anserion@gmail.com)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//=========================================================================

//   P[1]:=2;   P[2]:=3;   P[3]:=5;   P[4]:=7;   P[5]:=11;
//   P[6]:=13;  P[7]:=17;  P[8]:=19;  P[9]:=23;  P[10]:=29;
//   P[11]:=31; P[12]:=37; P[13]:=41; P[14]:=43; P[15]:=47;

program RNS_lib64_demo;
uses RNS_lib;

var
   n,n_bin,n_dec: integer;
   
   pp_bin: T_bin; pp_dec: T_dec;
   P_sv: array[0..max_n] of integer;
   basis_dec: array[0..max_n] of T_dec;
   rang_dec: T_dec;
   rang_RNS: T_RNS;

   X_int64,Y_int64:int64;
   X_dec,Y_dec:T_dec;
   X_crt_dec,Y_crt_dec:T_dec;
   X_rns,Y_rns,X_plus_Y_rns,X_minus_Y_rns,X_mul_Y_rns,X_div_Y_rns,X_mod_Y_rns:T_RNS;
   
   k: integer;

begin
   n:=10; n_bin:=110; n_dec:=110;

   calc_P; write('n=',n); print_vector(n,',  P=',P);
   for k:=1 to max_n do p_sv[k]:=k;
   
   calc_PP_dec(n,n_dec,p_sv,pp_dec);
   writeln('  pp = ',modulo_to_str(n_dec,pp_dec)); writeln;
   
   calc_PP_bin(n,n_bin,p_sv,pp_bin);
   writeln('  pp = ',modulo_to_str(n_bin,pp_bin)); writeln;
   
   calc_rns_a_tables;
   calc_rns_math_tables;
   calc_rns_pow2_table;
   calc_rns_pow10_table;
   for k:=1 to n do calc_RNS_basis_dec(n,n_dec,k,p_sv,basis_dec[k]);
   for k:=1 to n do writeln('b_',k:2,' = ',modulo_to_str(n_dec,basis_dec[k]));
   
   n_dec:=13;
   X_int64:=100;
   //write('X='); readln(X_int64);
   Y_int64:=12;
   //write('Y='); readln(Y_int64);

   writeln; print_vector(n,'  ',P,p_sv);
   
   int64_to_RNS(n,X_int64,P_sv,X_rns); RNS_to_dec(n,n_dec,X_rns,p_sv,X_dec);
   RNS_rang(n,2*n,X_rns,p_sv,rang_RNS); RNS_to_dec(n,n_dec,rang_RNS,p_sv,rang_dec);
   RNS_to_dec_CRT(n,2*n,n_dec,X_RNS,p_sv,X_crt_dec);
   print_vector(n,'X=',X_rns,' = '+modulo_to_str(n_dec,X_dec),0,false,true);
   writeln('rang_X=',modulo_to_str(n_dec,rang_dec));
   writeln(' CRT_X=',modulo_to_str(n_dec,X_crt_dec));
   writeln;
   
   int64_to_RNS(n,Y_int64,P_sv,Y_rns); RNS_to_dec(n,n_dec,Y_rns,p_sv,Y_dec);
   RNS_rang(n,2*n,Y_rns,p_sv,rang_RNS); RNS_to_dec(n,n_dec,rang_RNS,p_sv,rang_dec);
   RNS_to_dec_CRT(n,2*n,n_dec,Y_RNS,p_sv,Y_crt_dec);
   print_vector(n,'Y=',Y_rns,' = '+modulo_to_str(n_dec,Y_dec),0,false,true);
   writeln('rang_Y=',modulo_to_str(n_dec,rang_dec));
   writeln(' CRT_Y=',modulo_to_str(n_dec,Y_crt_dec));

   writeln; print_vector(n,'        ',P,p_sv);
   print_vector(n,'      X=',X_rns,' = ',RNS_to_int64(n,X_rns,p_sv),true,true);
   print_vector(n,'      Y=',Y_rns,' = ',RNS_to_int64(n,Y_rns,p_sv),true,true);
   X_plus_Y_rns:=RNS_add(n,x_RNS,y_RNS,p_sv);
   print_vector(n,'    X+Y=',X_plus_Y_rns,' = ',RNS_to_int64(n,X_plus_Y_rns,p_sv),true,true);
   X_minus_Y_rns:=RNS_sub(n,x_RNS,y_RNS,p_sv);
   print_vector(n,'    X-Y=',X_minus_Y_rns,' = ',RNS_to_int64(n,X_minus_Y_rns,p_sv),true,true);
   X_mul_Y_rns:=RNS_mul(n,x_RNS,y_RNS,p_sv);
   print_vector(n,'    X*Y=',X_mul_Y_rns,' = ',RNS_to_int64(n,X_mul_Y_rns,p_sv),true,true);
   X_div_Y_rns:=RNS_div(n,x_RNS,y_RNS,p_sv);
   print_vector(n,'X div Y=',X_div_Y_rns,' = ',RNS_to_int64(n,X_div_Y_rns,p_sv),true,true);
   X_mod_Y_rns:=RNS_mod(n,x_RNS,y_RNS,p_sv);
   print_vector(n,'X mod Y=',X_mod_Y_rns,' = ',RNS_to_int64(n,X_mod_Y_rns,p_sv),true,true);
end.

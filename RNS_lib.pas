//Copyright 2018,2019 Andrey S. Ionisyan (anserion@gmail.com)
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
//========================================================================

unit RNS_lib;

interface
const primes_num=128;
const max_n_rns=54;
const max_p_val=255;
const max_pow2=1024;
const max_pow10=512;

type
   T_RNS=array[0..max_n_rns] of integer;
   T_bin=array[0..max_pow2] of integer;
   T_dec=array[0..max_pow10] of integer;
   T_int_vector=array of integer;

var
   rns_primes:array[0..primes_num] of integer;
   rns_P:array[0..max_n_rns] of integer;
   
   RNS_zero,RNS_one,RNS_two,RNS_ten:T_RNS;
   bin_zero,bin_one,bin_two,bin_ten:T_bin;
   dec_zero,dec_one,dec_two,dec_ten:T_dec;
//========================================================================

function RNS_get_n_rns:integer;
function RNS_get_n_dec:integer;
function RNS_get_n_bin:integer;
function RNS_get_n_ext:integer;

procedure RNS_set_n_rns(value:integer);
procedure RNS_set_n_dec(value:integer);
procedure RNS_set_n_bin(value:integer);
procedure RNS_set_n_ext(value:integer);
procedure RNS_init;
//========================================================================

procedure print_vector(n,space:integer; dir,zeroes:boolean; pre_str:string;
                       a:T_int_vector; newline:boolean);
procedure print_dec(pre_str:string; a:T_dec; newline:boolean);
procedure print_bin(pre_str:string; a:T_bin; newline:boolean);
procedure print_RNS(pre_str:string; a:T_RNS; newline:boolean);
procedure print_MRS(pre_str:string; a:T_RNS; newline:boolean);
//========================================================================

procedure modulo_set(n:integer; value:integer; var a:array of integer);
procedure modulo_copy(n:integer; src:array of integer; var dst:array of integer);
function modulo_cmp_equ(n:integer; r1,r2:array of integer):boolean;
function modulo_cmp(n:integer; r1,r2:array of integer):integer;
procedure modulo_shl(n:integer; var m:array of integer);
function modulo_to_str(n:integer; a:array of integer):string;
procedure str_to_modulo(a_str:string; var res:array of integer);
//========================================================================

operator :=(value:string)res:T_bin;
operator :=(value:string)res:T_dec;
operator :=(value:int64)res:T_bin;
operator :=(value:int64)res:T_dec;
operator :=(value:T_bin)res:int64;
operator :=(value:T_dec)res:int64;

operator +(op1,op2:T_bin)res:T_bin;
operator +(op1,op2:T_dec)res:T_dec;
operator *(op1,op2:T_bin)res:T_bin;
operator *(op1,op2:T_dec)res:T_dec;
function pow_mod(a,power,modulo:integer):integer;
//========================================================================

procedure rns_calc_primes;
procedure rns_calc_a_tables;
procedure rns_calc_math_tables;
procedure rns_calc_pow2_table;
procedure rns_calc_pow10_table;

function rns_a_table_get(a:integer):T_RNS;
function rns_a_neg_table_get(a:integer):T_RNS;
function rns_a_inv_table_get(a:integer):T_RNS;
function rns_pow2_table_get(pow_idx:integer):T_RNS;
function rns_pow10_table_get(pow_idx:integer):T_RNS;
//========================================================================

function rns_PP_int64:int64;
function rns_PP_bin:T_bin;
function rns_PP_dec:T_dec;
//========================================================================

operator +(op1,op2:T_RNS)res:T_RNS;
operator -(op1,op2:T_RNS)res:T_RNS;
operator *(op1,op2:T_RNS)res:T_RNS;
operator /(op1,op2:T_RNS)res:T_RNS;
operator div(op1,op2:T_RNS)res:T_RNS;
operator mod(op1,op2:T_RNS)res:T_RNS;
function RNS_scale_trunc(p_idx:integer; value:T_RNS):T_RNS;
function RNS_scale(p_idx:integer; value:T_RNS):T_RNS;
function RNS_mod2(A:T_RNS; p2_mod:integer):T_RNS;
function RNS_div2(A:T_RNS; p2_mod:integer):T_RNS;
procedure RNS_divmod(A,B:T_RNS; var Q,R:T_RNS);
function RNS_change_mod(n:integer; value:T_RNS; idx:T_int_vector):T_RNS;
//========================================================================

operator =(op1,op2:T_RNS)res:boolean;
operator <>(op1,op2:T_RNS)res:boolean;
operator >(op1,op2:T_RNS)res:boolean;
operator <(op1,op2:T_RNS)res:boolean;
operator >=(op1,op2:T_RNS)res:boolean;
operator <=(op1,op2:T_RNS)res:boolean;
function RNS_cmp(r1,r2:T_RNS):integer;
//========================================================================

operator :=(value:int64)res:T_RNS;
operator :=(value:T_RNS)res:int64;
operator :=(value:T_RNS)res:T_dec;
operator :=(value:T_RNS)res:T_bin;
operator :=(value:T_dec)res:T_RNS;
operator :=(value:T_bin)res:T_RNS;
//========================================================================

function MRS_to_int64(value:T_RNS):int64;
function MRS_to_bin(value:T_RNS):T_bin;
function MRS_to_dec(value:T_RNS):T_dec;
function MRS_to_RNS(value:T_RNS):T_RNS;

function RNS_to_MRS(value:T_RNS):T_RNS;
function int64_to_MRS(value:int64):T_RNS;
function bin_to_MRS(value:T_bin):T_RNS;
function dec_to_MRS(value:T_dec):T_RNS;

function MRS_product(a_mrs,b_mrs:T_RNS):T_RNS;
//========================================================================

function RNS_gcd(A,B:T_RNS):T_RNS;
function RNS_lcm(A,B:T_RNS):T_RNS;
function RNS_sqr(A:T_RNS):T_RNS;
function RNS_sqrt(A:T_RNS):T_RNS;
//=========================================================================

implementation
var
   primitive_roots_table: T_RNS;
   rns_a_table:array[0..max_p_val] of T_RNS;
   rns_a_neg_table:array[0..max_p_val] of T_RNS;
   rns_a_inv_table:array[0..max_p_val] of T_RNS;
   rns_a_idx_table:array[0..max_p_val] of T_RNS;
   rns_pow2_table:array[0..max_pow2] of T_RNS;
   rns_pow10_table:array[0..max_pow10] of T_RNS;
   rns_add_table,rns_sub_table,rns_mul_table:array[0..max_p_val,0..max_p_val] of T_RNS;

   n_rns, n_bin, n_dec, sqrt_iterations, n_ext: integer;

function RNS_get_n_rns:integer; begin RNS_get_n_rns:=n_rns; end;
function RNS_get_n_dec:integer; begin RNS_get_n_dec:=n_dec; end;
function RNS_get_n_bin:integer; begin RNS_get_n_bin:=n_bin; end;
function RNS_get_n_ext:integer; begin RNS_get_n_ext:=n_ext; end;

procedure RNS_set_n_rns(value:integer); begin n_rns:=value; end;
procedure RNS_set_n_dec(value:integer); begin n_dec:=value; end;
procedure RNS_set_n_bin(value:integer); begin n_bin:=value; end;
procedure RNS_set_n_ext(value:integer); begin n_ext:=value; end;
procedure RNS_init;
begin
   rns_calc_a_tables;

   modulo_set(n_rns,0,RNS_zero);
   modulo_set(n_rns,1,RNS_one);
   modulo_copy(n_rns,rns_a_table[2],RNS_two);
   modulo_copy(n_rns,rns_a_table[10],RNS_ten);
   
   modulo_set(n_bin,0,bin_zero);
   bin_one:=bin_zero; bin_one[1]:=1;
   bin_two:=bin_zero; bin_two[2]:=1;
   bin_ten:=bin_zero; bin_ten[4]:=1; bin_ten[2]:=1;
   
   modulo_set(n_dec,0,dec_zero);
   dec_one:=dec_zero; dec_one[1]:=1;
   dec_two:=dec_zero; dec_two[1]:=2;
   dec_ten:=dec_zero; dec_ten[2]:=1;

   rns_calc_math_tables;
   rns_calc_pow2_table;
   rns_calc_pow10_table;
end;
//=========================================================================

procedure print_vector(n,space:integer; dir,zeroes:boolean; pre_str:string;
                       a:T_int_vector; newline:boolean);
var k:integer;
begin
   write(pre_str);
   if not(zeroes) then while a[n]=0 do n:=n-1;
   if dir
   then for k:=1 to n do write(a[k]:space)
   else for k:=n downto 1 do write(a[k]:space);
   if newline then writeln;
end;

procedure print_RNS(pre_str:string; a:T_RNS; newline:boolean);
begin print_vector(n_rns,6,true,true,pre_str,a,newline); end;

procedure print_MRS(pre_str:string; a:T_RNS; newline:boolean);
begin print_vector(n_rns,6,true,true,pre_str,a,newline); end;

procedure print_dec(pre_str:string; a:T_dec; newline:boolean);
begin print_vector(n_dec,0,false,false,pre_str,a,newline); end;

procedure print_bin(pre_str:string; a:T_bin; newline:boolean);
begin print_vector(n_bin,0,false,false,pre_str,a,newline); end;
//==========================================================================

procedure modulo_set(n:integer; value:integer; var a:array of integer);
var k:integer; begin for k:=1 to n do a[k]:=value; end;

procedure modulo_copy(n:integer; src:array of integer; var dst:array of integer);
var k:integer; begin for k:=1 to n do dst[k]:=src[k]; end;

function modulo_cmp_equ(n:integer; r1,r2:array of integer):boolean;
var k:integer; tmp:boolean;
begin
   tmp:=true;
   for k:=1 to n do if r1[k]<>r2[k] then tmp:=false;
   modulo_cmp_equ:=tmp;
end;

function modulo_cmp(n:integer; r1,r2:array of integer):integer;
var k,tmp:integer;
begin
   tmp:=0;
   for k:=n downto 1 do
   begin
      if r1[k]<r2[k] then begin tmp:=-1; break; end;
      if r1[k]>r2[k] then begin tmp:=1; break; end;
   end;
   modulo_cmp:=tmp;
end;

procedure modulo_shl(n:integer; var m:array of integer);
var k:integer;
begin
     for k:=n downto 2 do m[k]:=m[k-1];
     m[1]:=0;
end;

//========================================================================
function modulo_to_str(n:integer; a:array of integer):string;
var k:integer; tmp:string; flag:boolean;
begin
   tmp:=''; flag:=false;
   for k:=n downto 1 do
   begin
      if a[k]<>0 then flag:=true;
      if flag then tmp:=tmp+chr(a[k]+ord('0'));
   end;
   if not(flag) then tmp:='0';
   modulo_to_str:=tmp;
end;

procedure str_to_modulo(a_str:string; var res:array of integer);
var k,n:integer;
begin
   modulo_set(length(res),0,res);
   n:=length(a_str);
   for k:=1 to n do res[n-k+1]:=ord(a_str[k])-ord('0');
end;
//====================================================================

operator :=(value:string)res:T_bin;
begin str_to_modulo(value,res); end;

operator :=(value:string)res:T_dec;
begin str_to_modulo(value,res); end;

operator :=(value:int64)res:T_bin;
var k:integer;
begin
   for k:=1 to n_bin do
   begin
      res[k]:=value and 1;
      value:=value shr 1;
   end;
end;

operator :=(value:int64)res:T_dec;
var k:integer;
begin
   for k:=1 to n_dec do
   begin
      res[k]:=value mod 10;
      value:=value div 10;
   end;
end;

operator :=(value:T_bin)res:int64;
var k:integer;
begin
   res:=0;
    for k:=n_bin downto 1 do res:=res*2+value[k];
end;

operator :=(value:T_dec)res:int64;
var k:integer;
begin
   res:=0;
    for k:=n_dec downto 1 do res:=res*10+value[k];
end;
//=======================================================

operator +(op1,op2:T_bin)res:T_bin;
var k:integer; carry:byte;
begin
   carry:=0;
   for k:=1 to n_bin do
   begin
      res[k]:=op1[k]+op2[k]+carry; carry:=0;
      if res[k]=2 then begin res[k]:=0; carry:=1; end;
      if res[k]=3 then begin res[k]:=1; carry:=1; end;
   end;
end;

operator +(op1,op2:T_dec)res:T_dec;
var k:integer; carry:byte;
begin
   carry:=0;
   for k:=1 to n_dec do
   begin
      res[k]:=op1[k]+op2[k]+carry; carry:=0;
      if res[k]>9 then begin res[k]:=res[k]-10; carry:=1; end;
   end;
end;

operator *(op1,op2:T_bin)res:T_bin;
var k:integer; tmp:T_bin;
begin
   tmp:=op1; op1:=op2; op2:=bin_zero;
   for k:=1 to n_bin do
   begin
      if tmp[k]=1 then
      begin
         res:=op1+op2;
         op2:=res;
      end;
      modulo_shl(n_bin,op1);
   end;
end;

operator *(op1,op2:T_dec)res:T_dec;
var i,k,carry:integer; tmp:T_dec;
begin
   tmp:=op1; op1:=op2; op2:=dec_zero;
   res:=dec_zero;
   for k:=1 to n_dec do
   begin
      carry:=0;
      for i:=1 to n_dec do
      begin
         op2[i]:=tmp[k]*op1[i]+carry;
         carry:=op2[i] div 10;
         op2[i]:=op2[i] mod 10;
      end;
      res:=op2+res;
      op2:=res;
      modulo_shl(n_dec,op1);
   end;
end;

function pow_mod(a,power,modulo:integer):integer;
var res,h:longint;
begin
   res:=1; h:=a;
   while power>0 do
      if (power and 1)=0 then begin h:=(h*h) mod modulo; power:=power shr 1; end
      else begin res:=(res*h) mod modulo; power:=power-1; end;
   pow_mod:=res;
end;
//==============================================================

function rns_PP_int64:int64;
var k:integer; tmp:int64;
begin
   tmp:=1;
   for k:=1 to n_rns do tmp:=tmp*rns_P[k];
   rns_PP_int64:=tmp;
end;

function rns_PP_bin:T_bin;
var k:integer; tmp:T_bin;
begin
   tmp:=bin_one;
   for k:=1 to n_rns do tmp:=tmp*rns_P[k];
   rns_PP_bin:=tmp;
end;

function rns_PP_dec:T_dec;
var k:integer; tmp:T_dec;
begin
   tmp:=dec_one;
   for k:=1 to n_rns do tmp:=tmp*rns_P[k]; 
   rns_PP_dec:=tmp;
end;
//======================================================================

procedure rns_calc_primes;
var n,k,i,sqrt_i:longint; flag:boolean;
begin
   n:=1; rns_Primes[1]:=2;
   i:=2;
   while n<primes_num do
   begin
      i:=i+1;
      flag:=true; sqrt_i:=trunc(sqrt(i));

      k:=1;
      while rns_Primes[k]<=sqrt_i do
      begin
         if (i mod rns_Primes[k])=0 then flag:=false;
         k:=k+1;
      end;

      if flag then
      begin
         n:=n+1;
         rns_Primes[n]:=i;
      end;
   end;
end;

procedure rns_calc_a_tables;
var a,k,i:integer;
begin
   for k:=1 to n_rns do
   for a:=0 to max_p_val do
      rns_a_table[a,k]:=a mod rns_P[k];

   for k:=1 to n_rns do
   for a:=0 to max_p_val do
   begin
      if rns_a_table[a,k]=0 then rns_a_neg_table[a,k]:=0
         else rns_a_neg_table[a,k]:=rns_P[k]-rns_a_table[a,k];
      rns_a_inv_table[a,k]:=0;
      for i:=1 to rns_P[k]-1 do
         if ((rns_a_table[a,k]*i)mod rns_P[k])=1 then rns_a_inv_table[a,k]:=i;
   end;
end;

procedure rns_calc_math_tables;
var i,j,k:integer; a1,a2:integer; phi:integer; flag:integer;
begin
   for k:=1 to n_rns do
      for a1:=0 to max_p_val do
         for a2:=0 to max_p_val do
         begin
            rns_add_table[a1,a2,k]:=(a1+a2) mod rns_P[k];
            rns_sub_table[a1,a2,k]:=(a1-a2) mod rns_P[k];
            if rns_sub_table[a1,a2,k]<0 then
               rns_sub_table[a1,a2,k]:=rns_sub_table[a1,a2,k]+rns_P[k];
            rns_mul_table[a1,a2,k]:=(a1*a2) mod rns_P[k];
         end;
   
   for k:=1 to n_rns do
   begin
      phi:=rns_P[k]-1;
      for i:=1 to rns_P[k]-1 do
      begin
         flag:=0;
         for j:=1 to phi do if pow_mod(i,j,rns_P[k])=1 then flag:=flag+1;
         if flag=1 then begin primitive_roots_table[k]:=i; break; end;
      end;
      
      rns_a_idx_table[0,k]:=0;
      rns_a_idx_table[1,k]:=primitive_roots_table[k];
      for i:=1 to max_p_val do
         for j:=0 to phi-1 do
            if pow_mod(primitive_roots_table[k],j,rns_P[k])=(i mod rns_P[k]) then rns_a_idx_table[i,k]:=j;
   end;
end;

procedure rns_calc_pow2_table;
var i:integer;
begin
   rns_pow2_table[0]:=RNS_one;
   for i:=1 to max_pow2 do rns_pow2_table[i]:=rns_pow2_table[i-1]*RNS_two;
end;

procedure rns_calc_pow10_table;
var i:integer;
begin
   rns_pow10_table[0]:=RNS_one;
   for i:=1 to max_pow10 do rns_pow10_table[i]:=rns_pow10_table[i-1]*RNS_ten;
end;

function rns_a_table_get(a:integer):T_RNS;
begin rns_a_table_get:=rns_a_table[a]; end;

function rns_a_neg_table_get(a:integer):T_RNS;
begin rns_a_neg_table_get:=rns_a_neg_table[a]; end;

function rns_a_inv_table_get(a:integer):T_RNS;
begin rns_a_inv_table_get:=rns_a_inv_table[a]; end;

function rns_pow2_table_get(pow_idx:integer):T_RNS;
begin rns_pow2_table_get:=rns_pow2_table[pow_idx]; end;

function rns_pow10_table_get(pow_idx:integer):T_RNS;
begin rns_pow10_table_get:=rns_pow10_table[pow_idx]; end;
//======================================================================

operator +(op1,op2:T_RNS)res:T_RNS;
var k:integer; 
begin
   for k:=1 to n_rns do res[k]:=rns_add_table[op1[k],op2[k],k];
end;

operator -(op1,op2:T_RNS)res:T_RNS;
var k:integer;
begin 
   for k:=1 to n_rns do res[k]:=rns_add_table[op1[k],rns_a_neg_table[op2[k],k],k];
end;

operator *(op1,op2:T_RNS)res:T_RNS;
var k:integer;
begin
   for k:=1 to n_rns do res[k]:=rns_mul_table[op1[k],op2[k],k];
end;

operator /(op1,op2:T_RNS)res:T_RNS;
var k:integer;
begin
   for k:=1 to n_rns do res[k]:=rns_mul_table[op1[k],rns_a_inv_table[op2[k],k],k];
end;

operator div(op1,op2:T_RNS)res:T_RNS;
var dummy:T_RNS;
begin
   RNS_divmod(op1,op2,res,dummy);
end;

operator mod(op1,op2:T_RNS)res:T_RNS;
var k:integer; tmp,B_mul_P:T_RNS;
begin
   if op2<>RNS_zero then
   begin
      res:=op1;
      while res>=op2 do
      begin
         k:=0;
         tmp:=op2;
         repeat
            k:=k+1;
            B_mul_P:=tmp;
            tmp:=B_mul_P*rns_a_table_get(rns_P[k]);
         until (tmp>=res)or(k=n_rns);
         while res>=B_mul_P do res:=res-B_mul_P;
      end;
   end else res:=RNS_zero;
end;

function RNS_scale_trunc(p_idx:integer; value:T_RNS):T_RNS;
var tmp_dig,tmp_sub,tmp_P:T_RNS;
begin
   tmp_dig:=rns_a_table_get(value[p_idx]);
   tmp_sub:=value-tmp_dig;
   tmp_p:=rns_a_table_get(rns_P[p_idx]);
   RNS_scale_trunc:=tmp_sub/tmp_p;
end;

function RNS_scale(p_idx:integer; value:T_RNS):T_RNS;
var tmp_res,p_sv_src,res:T_RNS; k:integer;
begin
   RNS_scale:=RNS_zero;
   res:=RNS_scale_trunc(p_idx,value);
   for k:=1 to p_idx-1 do p_sv_src[k]:=k;
   for k:=p_idx+1 to n_rns do begin tmp_res[k-1]:=res[k]; p_sv_src[k-1]:=k; end;
   RNS_scale:=RNS_change_mod(n_rns-1,tmp_res,p_sv_src);
end;

function RNS_mod2(A:T_RNS; p2_mod:integer):T_RNS;
var A_mrs:T_RNS; k:integer; tmp_res:integer;
begin
   tmp_res:=0;
   if p2_mod= -1 then
   begin
      A_mrs:=RNS_to_MRS(A);
      for k:=1 to n_rns do tmp_res:=tmp_res xor (A_mrs[k] and 1);
   end else tmp_res:=A[p2_mod];
  if tmp_res=0 then RNS_mod2:=RNS_zero else RNS_mod2:=RNS_one;
end;

function RNS_div2(A:T_RNS; p2_mod:integer):T_RNS;
var tmp_mod,tmp_res,tmp,mrs:T_RNS; k:integer; mod2:integer;
begin
   tmp_mod:=RNS_mod2(A,p2_mod);
   tmp_res:=(A-tmp_mod)/RNS_two;

   if p2_mod<> -1 then
   begin
      //RNS to MRS transform without p2_mod modulo
      tmp:=tmp_res;
      for k:=1 to n_rns do
         if k<>p2_mod then
         begin
            mrs[k]:=tmp[k];
            tmp:=RNS_scale_trunc(k,tmp);
         end;
   
      //restore new p2_mod value 
      mod2:=0;
      for k:=1 to n_rns do
         if k<>p2_mod then mod2:=mod2 xor (mrs[k] and 1);
         
      tmp_res[p2_mod]:=mod2;
   end;

   RNS_div2:=tmp_res;
end;

procedure RNS_divmod(A,B:T_RNS; var Q,R:T_RNS);
var A_minus_R,tmp_Q:T_RNS; k,cnt:integer; p_sv_src:T_RNS;
begin
   R:=A mod B;
   A_minus_R:=A-R;
   Q:=A_minus_R / B;
   
   cnt:=0;
   for k:=1 to n_rns do
      if B[k]<>0 then
      begin
         cnt:=cnt+1;
         p_sv_src[cnt]:=k;
         tmp_Q[cnt]:=Q[k];
      end;
   Q:=RNS_change_mod(cnt,tmp_Q,p_sv_src);
end;

function RNS_change_mod(n:integer; value:T_RNS; idx:T_int_vector):T_RNS;
var k:integer; mrs,tmp:T_RNS;
begin
   //RNS (source) to MRS (source) transform
   tmp:=RNS_zero;
   for k:=1 to n do tmp[idx[k]]:=value[k];
   for k:=1 to n do
   begin
      mrs[k]:=tmp[idx[k]];
      tmp:=RNS_scale_trunc(idx[k],tmp);
   end;

   //MRS (source) to RNS (target) transform
   tmp:=RNS_zero;
   for k:=n downto 1 do tmp:=tmp*rns_P[idx[k]]+mrs[k];
   RNS_change_mod:=tmp;
end;
//======================================================================

operator =(op1,op2:T_RNS)res:boolean;
begin res:=modulo_cmp_equ(n_rns,op1,op2); end;

operator <>(op1,op2:T_RNS)res:boolean;
begin res:=not(op1=op2); end;

operator >(op1,op2:T_RNS)res:boolean;
begin if RNS_cmp(op1,op2)=1 then res:=true else res:=false; end;

operator <(op1,op2:T_RNS)res:boolean;
begin if RNS_cmp(op2,op1)=1 then res:=true else res:=false; end;

operator >=(op1,op2:T_RNS)res:boolean;
begin if RNS_cmp(op1,op2)>=0 then res:=true else res:=false; end;

operator <=(op1,op2:T_RNS)res:boolean;
begin if RNS_cmp(op2,op1)>=0 then res:=true else res:=false; end;

function RNS_cmp(r1,r2:T_RNS):integer;
begin RNS_cmp:=modulo_cmp(n_rns,RNS_to_MRS(r1),RNS_to_MRS(r2)); end;
//======================================================================

operator :=(value:int64)res:T_RNS;
var k:integer; tmp_pow2:T_RNS;
begin
   res:=RNS_zero;
   k:=0;
   while (value<>0) do
   begin
      if (value and 1)=1 then
      begin
         tmp_pow2:=rns_pow2_table_get(k);
         res:=res+tmp_pow2;
      end;
      value:=value shr 1;
      k:=k+1;
   end;
end;

operator :=(value:T_RNS)res:int64;
begin res:=MRS_to_int64(RNS_to_MRS(value)); end;

operator :=(value:T_RNS)res:T_dec;
begin res:=MRS_to_dec(RNS_to_MRS(value)); end;

operator :=(value:T_RNS)res:T_bin;
begin res:=MRS_to_bin(RNS_to_MRS(value)); end;

operator :=(value:T_dec)res:T_RNS;
var k:integer; tmp_mul,tmp_pow10,tmp_dig:T_RNS;
begin
   res:=RNS_zero;
   for k:=1 to n_dec do
   begin
      tmp_pow10:=rns_pow10_table_get(k-1);
      tmp_dig:=rns_a_table_get(value[k]);
      tmp_mul:=tmp_dig*tmp_pow10;
      res:=res+tmp_mul;
   end;
end;

operator :=(value:T_bin)res:T_RNS;
var k:integer;
begin
   res:=RNS_zero;
   for k:=1 to n_bin do
      if value[k]=1 then res:=res+rns_pow2_table_get(k-1);
end;
//====================================================================

function MRS_to_int64(value:T_RNS):int64;
var tmp:int64; k:integer;
begin
   tmp:=0;
   for k:=n_rns downto 1 do tmp:=tmp*rns_p[k]+value[k];
   MRS_to_int64:=tmp;
end;

function MRS_to_bin(value:T_RNS):T_bin;
var k:integer; tmp:T_bin;
begin
   tmp:=bin_zero;
   for k:=n_rns downto 1 do tmp:=tmp*rns_p[k]+value[k];
   MRS_to_bin:=tmp;
end;

function MRS_to_dec(value:T_RNS):T_dec;
var k:integer; tmp:T_dec;
begin
   tmp:=dec_zero;
   for k:=n_rns downto 1 do tmp:=tmp*rns_p[k]+value[k];
   MRS_to_dec:=tmp;
end;

function MRS_to_RNS(value:T_RNS):T_RNS;
var k:integer; tmp:T_RNS;
begin
   tmp:=RNS_zero;
   for k:=n_rns downto 1 do tmp:=tmp*rns_p[k]+value[k];
   MRS_to_RNS:=tmp;
end;

function RNS_to_MRS(value:T_RNS):T_RNS;
var k:integer; tmp:T_RNS;
begin
   tmp:=value;
   for k:=1 to n_rns do
   begin
      RNS_to_MRS[k]:=tmp[k];
      tmp:=RNS_scale_trunc(k,tmp);
   end;
end;

function int64_to_MRS(value:int64):T_RNS;
var tmp:int64; k:integer;
begin
   tmp:=value;
   for k:=1 to n_rns do
   begin
      int64_to_MRS[k]:=tmp mod rns_p[k];
      tmp:=(tmp-int64_to_MRS[k]) div rns_p[k];
   end;
end;

function bin_to_MRS(value:T_bin):T_RNS;
begin bin_to_MRS:=RNS_to_MRS(value); end;

function dec_to_MRS(value:T_dec):T_RNS;
begin dec_to_MRS:=RNS_to_MRS(value); end;

function MRS_product(a_mrs,b_mrs:T_RNS):T_RNS;
begin MRS_product:=RNS_to_MRS(MRS_to_RNS(a_mrs)*MRS_to_RNS(b_mrs)); end;
//========================================================

function RNS_gcd(A,B:T_RNS):T_RNS;
begin
   while (A<>RNS_zero) and (B<>RNS_zero) do
      if A>B then A:=A mod B else B:=B mod A;
   RNS_gcd:=A+B;
end;

function RNS_lcm(A,B:T_RNS):T_RNS;
begin RNS_lcm:=(A*B)/RNS_gcd(A,B); end;

function RNS_sqr(A:T_RNS):T_RNS;
begin RNS_sqr:=A*A; end;

function RNS_sqrt(A:T_RNS):T_RNS;
var cnt:integer; tmp:T_RNS;
begin
   tmp:=RNS_one;
   for cnt:=1 to sqrt_iterations do tmp:=(tmp+(A div tmp)) div RNS_two;
   RNS_sqrt:=tmp;
end;
//========================================================================

var k:integer;
begin 
   rns_calc_Primes;
   rns_P[0]:=1; for k:=1 to max_n_rns do rns_P[k]:=rns_primes[k];
   RNS_set_n_rns(8);//max_n_rns);
   RNS_set_n_bin(max_pow2);
   RNS_set_n_dec(max_pow10);
   RNS_set_n_ext(max_n_rns);
   sqrt_iterations:=100;
   RNS_init;
end.

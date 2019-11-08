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
//=========================================================================

//   P[1]:=2;   P[2]:=3;   P[3]:=5;   P[4]:=7;   P[5]:=11;
//   P[6]:=13;  P[7]:=17;  P[8]:=19;  P[9]:=23;  P[10]:=29;
//   P[11]:=31; P[12]:=37; P[13]:=41; P[14]:=43; P[15]:=47;

program RNS_lib64_demo;
uses RNS_lib,sysutils;

var
   x_dec,y_dec:T_dec;
   X_int64,Y_int64:int64;
   pp_dec: T_dec;
   x_RNS,y_RNS:T_RNS;
   s:string;
begin
   //RNS_P[1]:=2; RNS_P[2]:=5; RNS_P[3]:=7; RNS_P[4]:=11; RNS_P[5]:=13;
   RNS_set_n_rns(5); RNS_init;
   //RNS_set_n_bin(64);
   //RNS_set_n_dec(13);

   print_RNS('         P=',rns_P,true);

   pp_dec:=rns_PP_dec;
   print_dec('  pp = ',pp_dec,true);

   //X_int64:=1000; x_rns:=x_int64;
   x_dec:='1003'; x_rns:=x_dec;
   //write('X='); readln(s); x_dec:=s;
   print_RNS('     X=',X_rns,false); writeln(' = ',int64(X_rns));

   Y_int64:=12; Y_rns:=Y_int64;
   //write('Y='); readln(Y_int64); Y_rns:=Y_int64;
   print_RNS('     Y=',Y_rns,false); writeln(' = ',int64(Y_rns));

   print_RNS('    X+Y=',x_RNS+y_RNS,false); writeln(' = ',int64(x_RNS+y_RNS));
   print_RNS('    X-Y=',x_RNS-y_RNS,false); writeln(' = ',int64(x_RNS-y_RNS));
   print_RNS('    X*Y=',x_RNS*y_RNS,false); writeln(' = ',int64(x_RNS*y_RNS));
   print_RNS('X mod 2=',RNS_mod2(x_RNS,1),false); writeln(' = ',int64(RNS_mod2(x_RNS,1)));
   print_RNS('X div 2=',RNS_div2(x_RNS,1),false); writeln(' = ',int64(RNS_div2(x_RNS,1)));
   print_RNS('X div Y=',x_RNS div y_RNS,false); writeln(' = ',int64(x_RNS div y_RNS));
   print_RNS('X mod Y=',x_RNS mod y_RNS,false); writeln(' = ',int64(x_RNS mod y_RNS));
   print_RNS('gcd(X,Y)',RNS_gcd(x_RNS,y_RNS),false); writeln(' = ',int64(RNS_gcd(x_RNS,y_RNS)));
   print_RNS('lcm(X,Y)',RNS_lcm(x_RNS,y_RNS),false); writeln(' = ',int64(RNS_lcm(x_RNS,y_RNS)));   
   print_RNS(' sqr(X)=',RNS_sqr(x_RNS),false); writeln(' = ',int64(RNS_sqr(x_RNS)));   
   print_RNS('sqrt(X)=',RNS_sqrt(x_RNS),false); writeln(' = ',int64(RNS_sqrt(x_RNS)));
end.

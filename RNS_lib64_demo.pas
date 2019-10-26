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
   X_int64,Y_int64:int64;
   pp_dec: T_dec;
   x_RNS,y_RNS:T_RNS;
   
begin
   writeln('n_rns=',RNS_n_rns);
   print_vector('         P=',P,true);

   pp_dec:=calc_PP_dec;
   writeln('  pp = ',modulo_to_str(RNS_n_dec,pp_dec)); writeln;

   RNS_n_dec:=13;
   X_int64:=1000;
   //write('X='); readln(X_int64);
   X_rns:=X_int64;
   print_vector('     X=',X_rns,false); writeln(' = ',int64(X_rns));
   
   Y_int64:=12;
   //write('Y='); readln(Y_int64);
   Y_rns:=Y_int64;
   print_vector('     Y=',Y_rns,false); writeln(' = ',int64(Y_rns));

   print_vector('    X+Y=',x_RNS+y_RNS,false); writeln(' = ',int64(x_RNS+y_RNS));
   print_vector('    X-Y=',x_RNS-y_RNS,false); writeln(' = ',int64(x_RNS-y_RNS));
   print_vector('    X*Y=',x_RNS*y_RNS,false); writeln(' = ',int64(x_RNS*y_RNS));
   print_vector('X div Y=',x_RNS div y_RNS,false); writeln(' = ',int64(x_RNS div y_RNS));
   print_vector('X mod Y=',x_RNS mod y_RNS,false); writeln(' = ',int64(x_RNS mod y_RNS));
   print_vector('gcd(X,Y)',RNS_gcd(x_RNS,y_RNS),false); writeln(' = ',int64(RNS_gcd(x_RNS,y_RNS)));
   print_vector('lcm(X,Y)',RNS_lcm(x_RNS,y_RNS),false); writeln(' = ',int64(RNS_lcm(x_RNS,y_RNS)));   
   print_vector(' sqr(X)=',RNS_sqr(x_RNS),false); writeln(' = ',int64(RNS_sqr(x_RNS)));   
   print_vector('sqrt(X)=',RNS_sqrt(x_RNS),false); writeln(' = ',int64(RNS_sqrt(x_RNS)));
end.

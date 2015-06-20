unit utility;

Interface

uses crt,dos;

const
     name='Steve Myles';
     class='Computer Science II';
     per='Seventh';

var
  lst:text;

procedure center(line:string);
procedure centerf(line:string);
procedure skip(num:integer);
procedure title(input:string);
procedure execution;
procedure terminate;
procedure output_selection;
procedure heading;
procedure swap(var a,b:integer);
procedure page(var n:integer);
procedure page_string(var n:integer;phrase:string);
function quit:boolean;

Implementation

procedure center(line:string);
var tab,len:integer;
begin
 len:=length(line);
 tab:=(80-len) div 2;
 writeln(' ':tab,line);
end;

procedure centerf(line:string);
var tab,len:integer;
begin
 len:=length(line);
 tab:=(80-len) div 2;
 writeln(lst,' ':tab,line);
end;

procedure skip(num:integer);
 var
  lcv:integer;
  begin
       for lcv:= 1 to num do
        writeln(lst);
     end;

procedure title(input:string);
const
     linelength = 68;
     halflinelength = 34;
var
   lcv,
   fsf,           {Variable For Length Of The Input}
   o,             {variable for the midpoint of the string}
   p,             {variable for the location to begin writing the string}
   i,             {variable for, uhh... nothing}
   u,             {count variable}
   m:integer;     {another useless one}
begin
fsf:=0; o:=0; p:=0; i:=0; u:=0; m:=0;
fsf:=length(input);
o:=fsf div 2;
p:=halflinelength-o;
u:=0;
for lcv:=1 to 80 do write(lst,'-');
write(lst,' ');
while i < p+5   { loop till we reach a point half the length of the }
  do            { length of the string from the middle of the line  }
  begin         { make the line of ='s                              }
   write(lst,'=');
   i:=i+1;
   u:=u+1;
  end;
   write(lst,input);     {write the string }
if(fsf mod 2 = 0)     { is the length even? }
 then                    { if so...}
  begin
   while u > 0          { print ='s till the end of the line}
    do
     begin
     write(lst,'=');
     u:=u-1;
    end;
  end
 else                    { if not....}
  begin
   while u > -3          { print ='s till the end of the line}
    do                   { this was necessary to prevent the function}
     begin               { from placing an extra = if the length is odd}
     write(lst,'=');
     u:=u-1;
    end;
  end;
writeln(lst);
for lcv:=1 to 80 do write(lst,'-');
skip(1);
end;

function leadingzero(w:word):string;
   var
    s:string;
   begin
    str(w:0,s);
    if length(s)=1 then
    s:='0'+s;
    leadingzero:=s;
   end;

procedure execution;
var year,month,day,dayofweek,hour,minute,second,hundredth:word;
begin
  write(lst,'--------------------------------------------------------------------------------');
  writeln(lst,' =============================  EXECUTION BEGINS  =============================');
  writeln(lst,' =============================                    =============================');
  gettime(hour,minute,second,hundredth);
  write(lst,' =============================      ',leadingzero(hour),':',leadingzero(minute),':',leadingzero(second));
  writeln(lst,'      =============================');
  getdate(year,month,day,dayofweek);
  write(lst,' =============================     ',leadingzero(month),'-',leadingzero(day),'-',year);
  writeln(lst,'     =============================');
  writeln(lst,'--------------------------------------------------------------------------------');
end;

procedure terminate;
var year,month,day,dayofweek,hour,minute,second,hundredth:word;
begin
  write(lst,'--------------------------------------------------------------------------------');
  writeln(lst,' ========================    EXECUTION TERMINATES    ==========================');
  writeln(lst,' ========================                            ==========================');
  gettime(hour,minute,second,hundredth);
  write(lst,' ========================          ',leadingzero(hour),':',leadingzero(minute),':',leadingzero(second));
  writeln(lst,'          ==========================');
  getdate(year,month,day,dayofweek);
  write(lst,' ========================         ',leadingzero(month),'-',leadingzero(day),'-',year);
  writeln(lst,'         ==========================');
  writeln(lst,'--------------------------------------------------------------------------------');
  close(lst);
end;

procedure output_selection;
 var
    choice:char;
 begin
  writeln('Do you wish to send output to the (S)creen or (P)rinter?');
  repeat
   choice:=readkey;
   if (choice='S') or (choice='s') then
      assigncrt(lst)
   else
      assign(lst,'LPT1');
   rewrite(lst);
  until choice in ['S','s','P','p'];
 end;

procedure heading;
 var
    foo,foo2:integer;
    evenadd,evenadd2:integer;
    choice:integer;
    date_due,assignment,ver,
    description,description2,mon,late_reason:string;
 begin
  writeln;
  write('What is the assignment title?  ');
  readln(assignment);
  writeln;
  write('How many points is this worth? (Press SPACE if 100) ');
  readln(ver);
  if ver=' ' then ver:='100';
  ver:=concat(ver,' Points');
  writeln;
  write('When is this assignment due?  ');
  readln(date_due);
  writeln;
  write('Why is the assignment late? (Press SPACE if ON TIME) ');
  readln(late_reason);
  if late_reason=' ' then late_reason:='ON TIME';
  writeln;
  write('Describe the program:  ');
  readln(description);
  description2:=' ';
  Delete(description2,1,58);
  if (length(description)) > 64 then
     begin
      description2:=Copy(description,64,1+(length(description)-64));
      Delete(description,64,64);
     end;
  if length(description) mod 2 = 1 then
     evenadd:=0
  else
     evenadd:=1;
  foo:=(34-(length(description) div 2));
  foo2:=(34-(length(description2) div 2));
  if length(description2) mod 2 = 1 then
     evenadd2:=0
  else
     evenadd2:=1;
write(lst,'********************************************************************************');
write(lst,'**                                                                            **');
write(lst,'**         NAME:        ',name,' ':77-(29+length(name)));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**         COURSE:      ',class,' ':74-(26+length(class)));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**         PERIOD:      ',per,' ':74-(26+length(per)));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**         ASSIGNMENT:  ',assignment,' ':66-(18+length(assignment)));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**         VERSION:     ',ver,' ':69-(21+length(ver)));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**         DATE DUE:    ',date_due,' ':70-(20+10));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**         LATE REASON: ',late_reason,' ':65-(17+length(late_reason)));write(lst,'      **');
write(lst,'**                                                                            **');
write(lst,'**                             Program Description                            **');
write(lst,'**                                                                            **');
write(lst,'**');write(lst,' ':foo,description,' ':foo+evenadd);write(lst,'       **');
write(lst,'**');write(lst,' ':foo2,description2,' ':foo2+evenadd2);write(lst,'       **');
writeln(lst,'********************************************************************************');
end;

procedure swap(var a,b:integer);
var
 t:integer;
begin
  t:=a;
  a:=b;
  b:=t;
end;

procedure page(var n:integer);
 begin
  write(lst,#12);
  writeln(lst,'Page ',n);
  n:=n+1;
 end;

procedure page_string(var n:integer;phrase:string);
 begin
  write(lst,#12);
  writeln(lst,phrase,n);
  n:=n+1;
 end;

function power(base,exp:integer):integer;
 var
   i,
   temp:integer;
 begin
  if exp=0 then
     power:=1
  else
     begin
      temp:=base;
      for i:= 2 to exp do
      temp:= temp* base;
      power:=temp;
     end;
 end;

function quit:boolean;
 var
   choice:char;
 begin
  quit:=false;
  write('Do you want to run the program again? ');
  readln(choice);
  if (choice='n') or (choice = 'N') then quit:=true;
 end;

end.
{ procedures.pas                                                       }                                           
{ by Steve Myles                                                       }
{ license: MIT License                                                 }
{ last updated:  1995-06-16                                            }
{ posted to Github:  2015-06-17                                        }
{                                                                      }
{ This is an old file I have of various procedures that I used to find }
{ useful for Turbo Pascal programs.  Since it's been 20 years, posting }
{ it seemed like a good idea.                                          }

procedure OUTPUT_SELECTION; {this procedure sends output to the screen or to the printer}
    var
        CHOICE:char;
    begin
        writeln;
        writeln('Do you wish to send output to the (S)creen or (P)rinter?');
        repeat
            CHOICE:=readkey;
            if(CHOICE='S')or(CHOICE='s') then
                assigncrt(LST)
            else
                assign(LST,'LPT1');
            rewrite(LST);
        until CHOICE in ['S','s','P','p'];
    end;

procedure centerf(var fil:text; line:string);
var
   tab,
   len: integer;
begin
   len:=length(line);
   tab:=(78-len)div 2;
   writeln(fil,' ':tab,line);
end;

procedure center(line:string);
var
   tab,
   len:integer;
begin
   len:=length(line);
   tab:=(78-len)div 2;
   writeln(' ':tab,line);
end;

procedure BLUE;
begin
  TextColor(1);
end;

procedure GREEN;
begin
  TextColor(2);
end;

procedure CYAN;
begin
  TextColor(3);
end;

procedure RED;
begin
  TextColor(4);
end;

procedure VIOLET;
begin
  TextColor(5);
end;

procedure BROWN;
begin
  TextColor(6);
end;

procedure L_GRAY;
begin
  TextColor(7);
end;

procedure GRAY;
begin
  TextColor(8);
end;

procedure L_BLUE;
begin
  TextColor(9);
end;

procedure L_GREEN;
begin
  TextColor(10);
end;

procedure L_CYAN;
begin
  TextColor(11);
end;

procedure PINK;
begin
  TextColor(12);
end;

procedure L_VIOLET;
  begin
TextColor(13);
end;

procedure YELLOW;
begin
  TextColor(14);
end;

procedure WHITE;
begin
  TextColor(15);
end;

procedure TIME;
var
  h, m, s, hund : Word;
  tod : string;
  x:word;

  function LeadingZero(w : Word) : String;
  var
    s: String;
  begin
    Str(w:0,s);
    if Length(s) = 1 then
      s := '0' + s;
    LeadingZero := s;
  end;
begin
  GetTime(h,m,s,hund);
  case h of
    1: begin x:=h; tod:='am'; end;
    2: begin x:=h; tod:='am'; end;
    3: begin x:=h; tod:='am'; end;
    4: begin x:=h; tod:='am'; end;
    5: begin x:=h; tod:='am'; end;
    6: begin x:=h; tod:='am'; end;
    7: begin x:=h; tod:='am'; end;
    8: begin x:=h; tod:='am'; end;
    9: begin x:=h; tod:='am'; end;
    10:begin x:=h; tod:='am'; end;
    11:begin x:=h; tod:='am'; end;
    12:begin x:=h; tod:='pm'; end;
    13:begin x:=1; tod:='pm'; end;
    14:begin x:=2; tod:='pm'; end;
    15:begin x:=3; tod:='pm'; end;
    16:begin x:=4; tod:='pm'; end;
    17:begin x:=5; tod:='pm'; end;
    18:begin x:=6; tod:='pm'; end;
    19:begin x:=7; tod:='pm'; end;
    20:begin x:=8; tod:='pm'; end;
    21:begin x:=9; tod:='pm'; end;
    22:begin x:=10; tod:='pm'; end;
    23:begin x:=11; tod:='pm'; end;
    24:begin x:=12; tod:='am'; end;
end;
Write(x); white; write(':'); l_gray; write(LeadingZero(m)); white; write(':');
  l_gray; write(LeadingZero(s),tod);
end;

procedure TIMEFILE(var fil:text);
var
  h, m, s, hund : Word;
  tod : string;
  x:word;

  function LeadingZero(w : Word) : String;
    var
      s: String;
  begin
    Str(w:0,s);
    if Length(s) = 1 then
    s := '0' + s;
    LeadingZero := s;
  end;
begin
  GetTime(h,m,s,hund);
  case h of
    1: begin x:=h; tod:='am'; end;
    2: begin x:=h; tod:='am'; end;
    3: begin x:=h; tod:='am'; end;
    4: begin x:=h; tod:='am'; end;
    5: begin x:=h; tod:='am'; end;
    6: begin x:=h; tod:='am'; end;
    7: begin x:=h; tod:='am'; end;
    8: begin x:=h; tod:='am'; end;
    9: begin x:=h; tod:='am'; end;
    10:begin x:=h; tod:='am'; end;
    11:begin x:=h; tod:='am'; end;
    12:begin x:=h; tod:='pm'; end;
    13:begin x:=1; tod:='pm'; end;
    14:begin x:=2; tod:='pm'; end;
    15:begin x:=3; tod:='pm'; end;
    16:begin x:=4; tod:='pm'; end;
    17:begin x:=5; tod:='pm'; end;
    18:begin x:=6; tod:='pm'; end;
    19:begin x:=7; tod:='pm'; end;
    20:begin x:=8; tod:='pm'; end;
    21:begin x:=9; tod:='pm'; end;
    22:begin x:=10; tod:='pm'; end;
    23:begin x:=11; tod:='pm'; end;
    24:begin x:=12; tod:='am'; end;
  end;
Write(fil,x,':',LeadingZero(m),':',LeadingZero(s),tod);
end;

procedure DATE;
const
  days : array [0..6] of String[9] =
    ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
  months : array [1..12] of string[9] =
    ('January','February','March','April','May','June','July','August','September','October','November','December');
var
  y, m, d, dow : Word;
begin
  GetDate(y,m,d,dow);
  Write(days[dow]); white; write(',');
  l_gray; write(' ',months[m],' ',d:0); white; write(', '); l_gray; write(y:0);
end;

procedure DATEFILE(var fil:text);
const
  days : array [0..6] of String[9] =
    ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
  months : array [1..12] of string[9] =
    ('January','February','March','April','May','June','July','August','September','October','November','December');
var
  y, m, d, dow : Word;
begin
  GetDate(y,m,d,dow);
  Write(fil,days[dow],',',' ',months[m],' ',d:0,', ',y:0);
end;

procedure TIMEDATE;
begin
  white;
  write('It is now ');
  l_gray;
  TIME;
  white;
  write(' on ');
  l_gray;
  DATE;
  white;
  writeln('.');
end;

procedure FILETIMEDATE(var fil:text);
begin
  write(fil,'This file was created at ');
  TIMEFILE(fil);
  write(fil,' on ');
  DATEFILE(fil);
  writeln(fil,'.');
  writeln(fil);
end;

procedure name_switch;
var
  len, posit:integer;
  lname, fname, new, str:string;
begin
  write('Enter your name:  ');
  readln(str);
  posit:=pos(' ',str);
  len:=length(str);
  fname:=copy(str,1,posit-1);
  lname:=copy(str,posit+1,len);
  writeln('Name as entered:  ',str);
  writeln;
  new:=concat(lname,', ',fname);
  writeln(new);
end;

procedure yes_no;
begin
  gray; write(' ['); yellow;
  write('y'); l_gray; write('/'); yellow; write('n'); gray; write(']  ');
end;

procedure open_rewrite_file(var fil:text; file_name:string);
begin
  assign(fil,file_name);
  rewrite(fil);
end;

procedure openfile(var fil:text; file_name:string);
begin
  assign(fil,file_name);
  reset(fil);
end;

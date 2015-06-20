uses crt,strings;

var
 P: PChar;
 S, SubStr: array[0..9] of Char;
begin
 Readln(S);
 Readln(SubStr);
 P := StrPos(S, SubStr);
 if P = nil then
   Writeln('Substring not found')
 else
   Writeln('Substring found at index ', P - S);
end.

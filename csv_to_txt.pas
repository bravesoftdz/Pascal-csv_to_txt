
program csv_to_txt;

uses crt; //Spiaczek productions
var
plak:text;
plak_w:text;
ch:char;
tab:array[1..5000] of string;
i:integer;
j:longint;
plik, plik_w:string;

procedure csv_to_txt(plik,plik_w:string);
begin
i:=1;
	//Czytanie csv
	assign(plak, plik);
	reset(plak);
		while not eof(plak) do
			begin
			read(plak,ch);
				if (ch <> ',') then
					begin
						tab[i]:= tab[i] + ch;
					end
				else if eoln(plak) or (ch='') then
				inc(i)
				else
					begin
						tab[i]:= tab[i] + ' ';
					end;
			end;
	close(plak);
	//Zapisywanie do txt
	assign(plak_w,plik_w);
	rewrite(plak_w);
	for j:=1 to i do writeln(plak_w,tab[j]);
	close(plak_w); 	 
end; 

BEGIN
	 writeln('=========================================');
	 Writeln('Podaj nazwe pliku wejsciowego z rozszerzeniem .csv');
	 writeln('=========================================');
	 Readln(plik);
	 writeln('=========================================');
	 Writeln('Podaj nazwe pliku wyjsciowego z rozszerzeniem .txt');
	 writeln('=========================================');
	 Readln(plik_w);
	 csv_to_txt(plik, plik_w);
	 writeln('=========================================');
	 Writeln('Plik: ', plik_w, ' został stworzony');
END.

uses
  crt;

const
  w = 55;
  h = 60;
  n = 100;
  x = 75;
  y = 80;

type
  Tarray = array [1..w, 1..h] of integer;

var
  key, k, k1: char;
  new_game, count, game_over, live, count1, u, menu: integer;
  m: Tarray;
  i, j, x1, y1, y2, i1, v, stop: integer;

procedure Text1(const xi, yi: integer);
begin
  gotoxy(xi, yi);
  writeln('<<NEW GAME>>', ' ', '-');
  gotoxy(xi, yi + 1);
  writeln('Нажмите ENTER')
end;

procedure Text2(const xl, yl: integer);
begin
  gotoxy(xl, yl);
  writeln('<<EXIT>>', ' ', '-');
  gotoxy(xl, yl + 1);
  writeln('Нажмите ESC')
end;

procedure Ramka2(const xc, yc: integer);
begin
  gotoxy(xc, yc);
  writeln('//', '====================', '\\');
  gotoxy(xc, yc + 1);
  writeln('||', '                    ', '||');
  gotoxy(xc, yc + 2);
  writeln('||', '                    ', '||');
  gotoxy(xc, yc + 3);
  writeln('||', '                    ', '||');
  gotoxy(xc, yc + 4);
  writeln('||', '                    ', '||');
  gotoxy(xc, yc + 5);
  writeln('\\', '====================', '//');
end;

procedure Ramka1(const xv, yv: integer);
begin
  gotoxy(xv, yv);
  writeln('<<', '===================================================================', '>>');
  gotoxy(xv, yv + 1);
  writeln('||', '                                                                   ', '||');
  gotoxy(xv, yv + 2);
  writeln('||', '   ', '  ', '/\', '  ', '/\', '     ', '/\', '   ', '{}', ' ', '|\\', ' ', '||', '     ', '/\', '  ', '/\', '   ', '||===', ' ', '|\\', ' ', '||', ' ', '||', '  ', '||', '    ', '||');
  gotoxy(xv, yv + 3);
  writeln('||', '    ', '//\\//\\', '   ', '====', '  ', '||', ' ', '||\\||', '    ', '//\\//\\', '  ', '||===', ' ', '||\\||', ' ', '||', '  ', '||', '    ', '||');
  gotoxy(xv, yv + 4);
  writeln('||', '   ', '//', '      ', '\\', ' ', '//', '  ', '\\', ' ', '||', ' ', '||', ' ', '\\|', '   ', '//', '      ', '\\', ' ', '||===', ' ', '||', ' ', '\\|', ' ', '\\==//', '    ', '||');
  gotoxy(xv, yv + 5);
  writeln('||', '                                                                   ', '||');
  gotoxy(xv, yv + 6);
  writeln('<<', '===================================================================', '>>');
end;

procedure Logo(const x2, y2: integer);{=== Логотип ===}
begin
  gotoxy(x2, y2);
  writeln('__', '     ', '__', '   ', '_________', '   ', '  ', '_______');
  gotoxy(x2, y2 + 1);
  writeln('___', '    ', '__', '   ', '_________', '   ', '  ', '_______');
  gotoxy(x2, y2 + 2);
  writeln('__', ' ', '__', '  ', '__', '   ', '__', '          ', '//');
  gotoxy(x2, y2 + 3);
  writeln('__', '  ', '__', ' ', '__', '   ', '_____', '      ', '_________');
  gotoxy(x2, y2 + 4);
  writeln('__', '   ', '__', ' ', '_', '   ', '_____', '      ', '       ', '//');
  gotoxy(x2, y2 + 5);
  writeln('__', '    ', '___', '   ', '__', '          ', '_______');
  gotoxy(x2, y2 + 6);
  writeln('__', '     ', '__', '   ', '__', '          ', '_______');
end;

procedure lose{=== Проиграл ===}
(const x11, y11: integer);
begin
  gotoxy(x11, y11);
  writeln('       ', 'GGGGGGGG', '             ', 'AA', '          ', 'MM', '        ', 'MM', '   ', 'EEEEEEEEEEE');
  gotoxy(x11, y11+1);
  writeln('    ', 'GGG', '       ', 'GGG', '          ', 'AAAA', '         ', 'MMM', '      ', 'MMM', '   ', 'EE', '         ');
  gotoxy(x11, y11+2);
  writeln('   ', 'GGG', '                    ', 'A', '    ', 'A', '        ', 'MM', ' ', 'M', '    ', 'M', ' ', 'MM', '   ', 'EE', '         ');
  gotoxy(x11, y11+3);
  writeln('  ', 'GGG', '                    ', 'A', '      ', 'A', '       ', 'MM', '  ', 'M', '  ', 'M', '  ', 'MM', '   ', 'EEEEEEEEEE', ' ');
  gotoxy(x11, y11+4);
  writeln('  ', 'GGG', '                   ', 'AAAAAAAAAA', '      ', 'MM', '   ', 'MM', '   ', 'MM', '   ', 'EEEEEEEEEE', ' ');
  gotoxy(x11, y11+5);
  writeln('   ', 'GGG', '      ', 'GGGGGG', '     ', 'AA', '        ', 'AA', '     ', 'MM', '        ', 'MM', '   ', 'EE', '         ');
  gotoxy(x11, y11+6);
  writeln('    ', 'GGG', '         ', 'GG', '    ', 'AA', '          ', 'AA', '    ', 'MM', '        ', 'MM', '   ', 'EE', '         ');
  gotoxy(x11, y11+7);
  writeln('      ', 'GGGGGGGGGG', '     ', 'AA', '            ', 'AA', '   ', 'MM', '        ', 'MM', '   ', 'EEEEEEEEEEE');
  gotoxy(x11, y11+8);
  writeln('                                                                  ');
  gotoxy(x11, y11+9);
  writeln('                                                                  ');
  gotoxy(x11, y11+10);
  writeln('                                                                  ');
  gotoxy(x11, y11+11);
  writeln('      ', 'OOOOOOOO', '       ', 'AA', '            ', 'AA', '   ', 'EEEEEEEEEEEE', '   ', 'RRRRRRRR', '   ');
  gotoxy(x11, y11+12);
  writeln('    ', 'OOO', '      ', 'OOO', '      ', 'AA', '          ', 'AA', '    ', 'EE', '             ', 'RR', '     ', 'RRR', ' ');
  gotoxy(x11, y11+13);
  writeln('    ', 'OOO', '      ', 'OOO', '       ', 'AA', '        ', 'AA', '     ', 'EE', '             ', 'RR', '     ', 'RRR', ' ');
  gotoxy(x11, y11+14);
  writeln('    ', 'OOO', '      ', 'OOO', '        ', 'AA', '      ', 'AA', '      ', 'EEEEEEEEEEE', '    ', 'RR', '    ', 'RR', '   ');
  gotoxy(x11, y11+15);
  writeln('    ', 'OOO', '      ', 'OOO', '         ', 'AA', '    ', 'AA', '       ', 'EEEEEEEEEEE', '    ', 'RRRRRRR', '    ');
  gotoxy(x11, y11+16);
  writeln('    ', 'OOO', '      ', 'OOO', '          ', 'AA', '  ', 'AA', '        ', 'EE', '             ', 'RRRRRRR', '    ');
  gotoxy(x11, y11+17);
  writeln('    ', 'OOO', '      ', 'OOO', '          ', ' AAAA', '         ', 'EE', '             ', 'RR', '    ', 'RR', '   ');
  gotoxy(x11, y11+18);
  writeln('      ', 'OOOOOOOO', '              ', 'AA', '          ', 'EEEEEEEEEEEE', '   ', 'RR', '      ', 'RR', ' ');
  gotoxy(x11, y11+19);
  writeln('                                                                                                          ');
  gotoxy(x11, y11+20);
  writeln('                                                                                                          ');
  gotoxy(x11, y11+21);
  writeln('                           ','Your score:',' ',count)
end;
                                                      {=== Заставка ===}
procedure Load(const x4, y4: integer);{=== Загрузка ===}
begin
  gotoxy(x4, y4);
  writeln('Нажмите <Enter> для продолжения...');
end;

procedure Zvezda(const x3, y3: integer);{=== Звезда ===}
begin
  gotoxy(x3, y3);
  writeln('_/|_');
  gotoxy(x3, y3 + 1);
  writeln('>,"<');
end;

procedure Razr(const xr, yr: integer);{=== Разработчики ===}
begin
  gotoxy(xr, yr);
  writeln('Игра издательства "ВЕЛИКАЯ и УЖ...ПРЕКРАСНАЯ ШКОЛА имени ПРОГРАММИСТА",');
  gotoxy(xr, yr + 1);
  writeln(' ');
  gotoxy(xr, yr + 2);
  writeln('Компании "Квантовый кактус^2",');
  gotoxy(xr, yr + 3);
  writeln(' ');
  gotoxy(xr, yr + 4);
  writeln('Разработчики: Михаил Козляковский, Илья Соломатин и Иванов Никита.');
end;

procedure Zast(const xq, yq: integer);
begin
  gotoxy(xq, yq);
  writeln('__', '     ', '__', '   ', '_________', '   ', '  ', '_______');
  gotoxy(xq, yq + 1);
  writeln('___', '    ', '__', '   ', '_________', '   ', '  ', '_______');
  gotoxy(xq, yq + 2);
  writeln('__', ' ', '__', '  ', '__', '   ', '__', '          ', '//');
  gotoxy(xq, yq + 3);
  writeln('__', '  ', '__', ' ', '__', '   ', '_____', '      ', '_________');
  gotoxy(xq, yq + 4);
  writeln('__', '   ', '__', ' ', '_', '   ', '_____', '      ', '       ', '//');
  gotoxy(xq, yq + 5);
  writeln('__', '    ', '___', '   ', '__', '          ', '_______');
  gotoxy(xq, yq + 6);
  writeln('__', '     ', '__', '   ', '__', '          ', '_______');
end;

procedure Zagr2(const xa, ya: integer);
begin
  gotoxy(xa, ya);
  writeln('*');
end;

procedure Zagr(const xz, yz: integer);
begin
  gotoxy(xz, yz);
  writeln('/', '---------------------------------', '\');
  gotoxy(xz, yz + 1);
  writeln('|', '                                 ', '|');
  gotoxy(xz, yz + 2);
  writeln('\', '---------------------------------', '/');
  gotoxy(xz, yz + 3); 
  writeln('            ', 'Загрузка...', '            ')
end;

procedure Mash(const xm, ym: integer);
begin
  gotoxy(xm, ym);
  writeln('              ', '////////////////');
  gotoxy(xm, ym + 1);
  writeln('             ', '//', '     ', '///////////');
  gotoxy(xm, ym + 2);
  writeln(' ', '//////////////////////////////////');
  gotoxy(xm, ym + 3);
  writeln(' ', '////////////////////////////////////');
  gotoxy(xm, ym + 4);
  writeln('//////////////////////////////////////');
  gotoxy(xm, ym + 5);
  writeln('//////////////////////////////////////');
  gotoxy(xm, ym + 6);
  writeln('   ', '////', '              ', '////');
  gotoxy(xm, ym + 7);
  writeln('   ', ' ', '//', '                ', ' ', '//');
end;

procedure ramka;{=== Игровое поле ===}
var
  i1: integer;
begin
  textbackground(black);
  
  for i1 := 1 to 71 do
  begin
    textcolor(white);
    gotoxy(30, 10);
    write('___________________________________________________________________________________');
    y2 := y2 + 1;
    gotoxy(v, y2);
    write('|', '         |                                                            |          ', '|');
    if y2 = 71 then y2 := 10;
    writeln;
    gotoxy(30, 71);
    write('___________________________________________________________________________________');
  end;
  
end;



begin{=== Тело программы ===} 
  crt.setwindowsize(135,80);
  Menu := 0;
  textcolor(white);
  logo(51, 1);
  delay(5);
  
  var xv, yv: integer;
  begin
    textcolor(green);
    ramka1(32, 10);
    delay(5);
    
  end;
  
  var
  j1, xh, yh: integer;
  begin{=== Отрисовка заставки ===}
    yh := 20;
    xh := 25;
    textbackground(black);
    clrscr;
    v := 30;
    x1 := 67;
    y1 := 70;
    y2 := 10;
    game_over := 0;
    new_game := 0; 
    live := 3;  
    var xq, yq: integer;
    begin
      textcolor(green);
      for xq := 1 to 100 do 
      begin
        zast(xq, 1);
        delay(15);
      end;
    end;
    
    var xm, ym: integer;
    begin
      textcolor(green);
      for xm := 100 downto 1 do 
      begin
        mash(xm, 70);
        delay(15);
      end;
    end;
    
    var xz, yz: integer;
    begin
      textcolor(green);
      zagr(50, 30);
      delay(5);
    end;
    
    var xr, yr: integer;
    begin
      textcolor(white);
      razr(5, 17);
      delay(5);
    end;
    
    var xa, ya: integer;
    begin
      textcolor(yellow);
      for xa := 51 to 83 do 
      begin
        zagr2(xa, 31);
        delay(100);
      end;
    end;
    
    var xk, yk: integer;
    begin
      textcolor(white);
      logo(51, 40);
      delay(5);
    end;
    
    var x3, y3: integer;
    begin
      textcolor(yellow);
      zvezda(15, 60);
      zvezda(85, 15);
      zvezda(120, 45);
    end;
    
    var x4, y4: integer;
    begin
      textcolor(white);
      load(51, 50);
    end;
  end;
  
  key := readkey;               {=== Переход в меню ===}
  if key = #13 then begin
    clrscr;
    menu := 1; 
  end;
  
  if Menu = 1 then               {=== Отрисовка меню ===}
  begin
    clrscr;
    textcolor(white);
    logo(51, 1);
    delay(5);
    
    
    begin
      textcolor(green);
      ramka1(32, 10);
      delay(5);
      
    end;
    textcolor(white);
    for j1 := 1 to 51 do
    begin
      gotoxy(25, 20);
      write('<<=================================================================================>>');
      yh := yh + 1;
      gotoxy(xh, yh);
      write('||', '                                                                                 ', '||');
      if yh = 10 then yh := 10;
      writeln;
      gotoxy(25, 71);
      write('<<=================================================================================>>');
      
    end;
    
    var xc, yc: integer;
    begin
      textcolor(green);
      ramka2(55, 30);
      ramka2(55, 55);
      delay(5);
    end;
    
    
    begin
      textcolor(yellow);
      zvezda(15, 75);
      zvezda(100, 7);
      zvezda(120, 50);
      
    end;
    
    var xi, yi: integer;
    begin
      textcolor(yellow);
      text1(60, 32);
    end;
    
    var xl, yl: integer;
    begin
      textcolor(yellow);
      text2(61, 57);
    end;  
    
  end;
  
  
  
  
        {=== Управление меню ===}
  
  key := readkey;
  if key = #13 then begin
    clrscr;
    new_game := 1; 
    if key=#27 then begin
    exit;
    clrscr;
    end;
  end;
  
  
  if new_game = 1 then                         {=== Начало новой игры ===}
  begin
    clrscr;
    randomize;
    repeat
      gotoxy(124, 5);
      textcolor(red);
      write('Life ',live);
      ramka;
      inc(count);
      gotoxy(x1, y1);
      textcolor(red);
      write(chr(14));
      gotoxy(x1, y1+1);
      write(chr(14));
      if keypressed then                      {=== Управление ===}
      begin
        k1 := readkey;
        if k1 = #0 then begin
          k1 := readkey;
          if k1 = #39 then 
          begin
            if x1 = 100 then x1 := x1
            else
              inc(x1);
          end;
          if k1 = #37 then
          begin
            if x1 = 41 then x1 := x1
            else
              dec(x1);
          end;
          if k1 = #40 then
          begin
            if y1 = 70 then y1 := y1
            else
              inc(y1);
          end;
          if k1 = #38 then
          begin
            if y1 = 11 then y1 := y1
            else
              dec(y1);
          end;
        end;
      end;
      
      if count mod 1 = 0 then begin{=== Частота хода во время падения камней ===}
        for j := 1 to w do                    {=== Камни ===}
          m[j, 1] := random(n);
          gotoxy(10, 5);
          textcolor(white);
          write('Score ', count);
        for i := h - 1 downto 1 do
          for j := 1 to w do
          begin
            m[j, i + 1] := m[j, i];
            if m[j, i + 1] = 1 then
            begin
              
              gotoxy(j + 40, i + 10);          
              textcolor(brown);
              write('0');
              gotoxy(j + 44, i + 11);
              write('0');
              if (j + 44 = x1) and (i + 11 = y1) then 
              begin
                live := live - 1;
                game_over := game_over + 1;        
              end;
              if game_over = 3 then game_over := 4;
            end;
          end;
      end;
      delay(150);
      clrscr;
      
    until (game_over = 4);                            {=== Поражение ===}
    if game_over = 4 then
    begin
      clrscr;
     lose (30,30) ;
      key := readkey;               {=== Переход в меню ===}
      
      if key = #13 then
      begin
        clrscr;
        
      end;
    end;
  end;
  
  
end.
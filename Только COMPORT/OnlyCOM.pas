unit OnlyCOM;

interface

uses
  Windows, Messages, SysUtils,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus,
  SDL_sdlbase, SDL_Colsel, SDL_NumLab, SDL_plot3d, CPort, CPDrv, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, VclTee.TeeGDIPlus,
  VCLTee.TeeProcs, VCLTee.TeeDraw3D;

const
  mas=5;
  mas2=7;
  mas3=9;
  XRes = 9;
  YRes = 9;
  XYRes =35;
  new =45;

  
type
  TForm1 = class(TForm)
    CommPortDriver1: TCommPortDriver;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    com: TPlot3D;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Button3: TButton;
    StringGrid1: TStringGrid;
    com2: TPlot3D;
    Label6: TLabel;
    Timer1: TTimer;
    com3: TPlot3D;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Draw3D1: TDraw3D;
    Panel2: TPanel;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;

    //COM-PORT//

procedure CommPortDriver1ReceiveData(Sender: TObject; DataPtr: Pointer; DataSize: Cardinal);
//procedure EmulatorReceiveData(Sender: TObject; DataPtr: Pointer; DataSize: Cardinal);

//-------------- Emulator --------------
procedure N5Click(Sender: TObject);
procedure N6Click(Sender: TObject);
//-------------- /Emulator --------------
    //COM-PORT//
    //PLOT3D//
procedure comDataRendered(Sender: TObject; canvas: Tcanvas);
procedure com2DataRendered(Sender: TObject; canvas: Tcanvas);
procedure com3DataRendered(Sender: TObject; canvas: Tcanvas);
procedure DrawGraph();
procedure DrawGraph2();
procedure DrawGraph3();
procedure comBeforeRenderPolygon(Sender: TObject;
  canvas: Tcanvas; var Handled: Boolean; CellX, CellY: Integer;
  quad: TQuad; var color: TColor);
procedure com2BeforeRenderPolygon(Sender: TObject;
  canvas: Tcanvas; var Handled: Boolean; CellX, CellY: Integer;
  quad: TQuad; var color: TColor);
procedure com3BeforeRenderPolygon(Sender: TObject;
  canvas: Tcanvas; var Handled: Boolean; CellX, CellY: Integer;
  quad: TQuad; var color: TColor);
procedure comMouseMoveOverPlot(Sender: TObject;
  OverPlot: Boolean; Shift: TShiftState; MouseCellX, MouseCellY: Integer);
procedure com2MouseMoveOverPlot(Sender: TObject;
  OverPlot: Boolean; Shift: TShiftState; MouseCellX, MouseCellY: Integer);
procedure com3MouseMoveOverPlot(Sender: TObject;
  OverPlot: Boolean; Shift: TShiftState; MouseCellX, MouseCellY: Integer);


    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);

    
//   procedure Preparedata();
    //PLOT3D//
private
MCellX, MCellY : integer;
    { Private declarations }
public
    { Public declarations }
end;

var
  Form1: TForm1;
  elements: array [0..mas2, 0..mas2]of real;
  elements2: array [0..35]of real;
  implementation

{$R *.dfm}
procedure TForm1.N2Click(Sender: TObject);
begin
  CommPortDriver1.BaudRateValue:=9600;
  CommPortDriver1.PortName:='\\.\Com3';
  CommPortDriver1.DataBits:=db8BITS;
  CommPortDriver1.Connect;
  if CommPortDriver1.Connect=true then
    begin
    radiobutton1.Checked:=true;
    //Memo1.Lines.Add('Connect com port ok.');
    end

  //Memo1.Lines.Add('Connecting error')  ;
  end;

procedure TForm1.N3Click(Sender: TObject);
  begin
  CommPortDriver1.Disconnect;
  radiobutton1.Checked:=false;
  //Memo1.Lines.Add('Disconect');
  end;



procedure TForm1.Button3Click(Sender: TObject);
begin
memo1.Clear;
end;





procedure TForm1.N5Click(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;
procedure TForm1.N6Click(Sender: TObject);
begin
Timer1.Enabled:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);

//îáúÿâëåíèå ïðîöåäóðû ïðèåìà ðåçóëüòàòîâ
  var
  i,j,i1,j1,i2,j2,k,p,pos_semicolon,q1,q2: integer;   //îáúÿâëåíèå ïåðåìåííûõ
  count_high,count_low:integer;
  count_high_times,count_low_times:integer;
  count_high_times_breakable,count_low_times_breakable:integer;
  length_datepack:integer;
  s,s2,cutted,cutted2:ansistring;
  datepack,test_str:string;
  a: Integer;
  obmen:real;
  prov_na_null:string;
  temp: real;
  p1,p2,p3:real;
  begin
  s := '';
  s2 := '';
  count_high:=0;
  count_low:=0;
//  count_high_times:=0;
//  count_low_times:=0;
//  count_high_times_breakable:=0;
//  count_low_times_breakable:=0;
  timer1.tag:=timer1.tag+1;
  label10.Caption:=inttostr(timer1.Tag);



  memo1.text:=memo1.Text+s;
  datepack:=memo1.Lines[memo1.Lines.Count-1];
  length_datepack:=length(datepack);

  memo2.Lines.Add(#13#10);

  for I1 := 2 to mas3-2 do

    for j1 := 2 to mas3-2 do
      begin
      if ((timer1.tag mod 5)<>0) or ((timer1.tag mod 7)<>0) then
      elements[i1,j1]:=(random(100))/100;
      if ((timer1.tag mod 5)=0) or ((timer1.tag>17) and (timer1.tag<21))then
      elements[i1,j1]:=(random(20)+80)/100;
      if ((timer1.tag mod 7)=0) or ((timer1.tag>10) and (timer1.tag<15)) then
      elements[i1,j1]:=(random(20))/100;
      if ((timer1.tag mod 11)=0) then
      begin
      for I2 := 2 to 6 do
      for j2 := 2 to mas3-2 do

      elements[i2,j2]:=(random(20)+80)/100;
      end;



      end;

  for I1 := 0 to 1 do
    for j1 := 0 to mas3 do
      elements[i1,j1]:=0;

  for I1 := mas3-1 to mas3 do
    for j1 := 0 to mas3 do
      elements[i1,j1]:=0;

  for I1 := 0 to mas3 do
    for j1 := 0 to 1 do
      elements[i1,j1]:=0;

  for I1 := 0 to mas3 do
    for j1 := mas3-1 to mas3 do
      elements[i1,j1]:=0;


    for I1 := 0 to mas3 do
    begin
    for j1 := 0 to mas3 do
      memo2.lines.Text:=memo2.lines.Text+floattostr(elements[i1,j1])+'|';

    memo2.lines.add(#13#10);
    end;


   for I1 := 2 to mas3-2 do

    for J1 := 2 to mas3-2 do
    begin
    if  elements[i1,j1]>=0.8 then
    count_high:=count_high+1;
    if  elements[i1,j1]<=0.2 then
    count_low:=count_low+1;

    label6.Caption:=inttostr(count_high);
    label9.Caption:=inttostr(count_low);
    end;
    if count_high=36 then
    begin
    drawgraph();
    count_high_times:=count_high_times+1;
    count_high_times_breakable:=count_high_times_breakable+1;
    count_low_times_breakable:=0;
    label8.Caption:=inttostr(count_high_times);
    label13.Caption:=inttostr(count_high_times_breakable);
    panel2.Visible:=true;
    panel2.Color:=clRed;
    label12.Caption:='ÇÀÔÈÊÑÈÐÎÂÀÍÎ ÂÛÑÎÊÎÅ ÍÀÏÐßÆÅÍÈÅ ÍÀ ÂÑÅÕ ÄÀÒ×ÈÊÀÕ';
    if count_high_times_breakable>3 then
    label12.Caption:='ÇÀÔÈÊÑÈÐÎÂÀÍÎ ÏÐÎÄÎËÆÈÒÅËÜÍÎÅ ÂÛÑÎÊÎÅ ÍÀÏÐßÆÅÍÈÅ ÍÀ ÂÑÅÕ ÄÀÒ×ÈÊÀÕ';
    com2.Clear;
    com3.Clear;
    end
    else if count_low=36 then
    begin
    drawgraph2();
    count_low_times:=count_low_times+1 ;
    count_low_times_breakable:=count_low_times_breakable+1;
    count_high_times_breakable:=0;
    label7.Caption:=inttostr(count_low_times);
    label11.Caption:=inttostr(count_low_times_breakable);
    panel2.Visible:=true;
    panel2.Color:=clAqua;
    label12.Caption:='ÇÀÔÈÊÑÈÐÎÂÀÍÎ ÍÈÇÊÎÅ ÍÀÏÐßÆÅÍÈÅ ÍÀ ÂÑÅÕ ÄÀÒ×ÈÊÀÕ';
    if count_low_times_breakable>3 then
    label12.Caption:='ÇÀÔÈÊÑÈÐÎÂÀÍÎ ÏÐÎÄÎËÆÈÒÅËÜÍÎÅ ÍÈÇÊÎÅ ÍÀÏÐßÆÅÍÈÅ ÍÀ ÂÑÅÕ ÄÀÒ×ÈÊÀÕ';
    com.Clear;
    com3.Clear;
    end
    else if ((count_low>=30) and (count_low<36)) or ((count_high>=30) and (count_high<36)) then
    begin
    panel2.Color:=clYellow;
    label12.Caption:='ÑÈÑÒÅÌÀ ÁËÈÇÊÀ Ê ÏÅÐÅÕÎÄÓ Â ÄÐÓÃÎÉ ÐÅÆÈÌ';
    drawgraph3();
    com2.Clear;
    com.Clear;
    end
    else
    begin
    drawgraph3();
//    panel2.visible:=false;
    panel2.Visible:=true;
    panel2.Color:=clGray;
    label12.Caption:='ÍÀÏÐßÆÅÍÈÅ Â ÍÎÐÌÅ';
    count_low_times_breakable:=0;
    count_high_times_breakable:=0;
    com2.Clear;
    com.Clear;
    end;



      for q1 := 2 to mas3-2 do
    for q2 := 2 to mas3-2 do
  stringgrid1.Cells[q1-2,q2-2]:=floattostr(elements[q1,q2]);

  end;


 //--------------------------------------------------------- /Ýìóëÿòîð  --------------------------------------------------//






//--------------------------------------------------------- Áîåâàÿ ôóíêöèÿ --------------------------------------------------//
procedure TForm1.CommPortDriver1ReceiveData(Sender: TObject; DataPtr: Pointer; DataSize: Cardinal);
//îáúÿâëåíèå ïðîöåäóðû ïðèåìà ðåçóëüòàòîâ
  var
  i,j,i1,j1,k,p,pos_semicolon,q1,q2: integer;   //îáúÿâëåíèå ïåðåìåííûõ
  countlines:integer;
  length_datepack:integer;
  s,s2,cutted,cutted2:ansistring;
  datepack,test_str:string;
  a: Integer;
  obmen:real;
  prov_na_null:string;
  temp: real;
  p1,p2,p3:real;
  begin
  s := '';
  s2 := '';
  
  for i := 0 to DataSize-1  do
  //ñ÷åò÷èê, ïîçâîëÿùèé áåñïðåðûâíî ñ÷èòûâàòü ðåçóëüòàòû, ïîñòóïàþùèå ñ äàò÷èêîâ
    begin
    s :=  s+ (PAnsiChar(DataPtr)[i]); //ïðèñâàèâàíèå ïåðåìåííîé ñòðîêîâîãî òèïà äàííûõ, ïðèõîäÿùèõ ñ äàò÷èêîâ
    s:=StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
    end;
  label1.Caption:=inttostr(datasize);
  memo1.text:=memo1.Text+s;
  datepack:=memo1.Lines[memo1.Lines.Count-1];
  length_datepack:=length(datepack);
  if (length_datepack>180) and(  datepack<>'') then //ïðîâåðêà ñòðîêè íà ïîëíîòó
  begin
    for I := 0 to 35 do
    begin
      prov_na_null:=copy(datepack,1,(pos(';',datepack))-1);
      if prov_na_null <> '' then
      begin
      elements2[i]:=strtofloat(prov_na_null);
      if (i=2) or (i=6) or (i=10) or (i=14) or (i=18) or (i=22) or (i=26) or (i=30) or (i=34) then
        begin
        obmen:=elements2[i];
        elements2[i]:=elements2[i-1];
        elements2[i-1]:=obmen;
        end;
      delete(datepack,1,(pos(';',datepack)));
      edit1.Text:=edit1.Text+floattostr(elements2[i])+' ';
      end;
    end;
  //  stringgrid1.Cells[i,1]:=floattostr(elements2[i]);
  memo2.Lines.Add(#13#10);

  for I1 := 2 to mas3-2 do

    for j1 := 2 to mas3-2 do
      begin
      elements[i1,j1]:=elements2[j1-2+(mas+1)*(i1-2)];
      end;



  for I1 := 0 to 1 do
    for j1 := 0 to mas3 do
      elements[i1,j1]:=0;

  for I1 := mas3-1 to mas3 do
    for j1 := 0 to mas3 do
      elements[i1,j1]:=0;

  for I1 := 0 to mas3 do
    for j1 := 0 to 1 do
      elements[i1,j1]:=0;

  for I1 := 0 to mas3 do
    for j1 := mas3-1 to mas3 do
      elements[i1,j1]:=0;


    for I1 := 0 to mas3 do
    begin
    for j1 := 0 to mas3 do
      memo2.lines.Text:=memo2.lines.Text+floattostr(elements[i1,j1])+'|';

    memo2.lines.add(#13#10);
    end;


  end;



  drawgraph();

      for q1 := 2 to mas3-2 do
    for q2 := 2 to mas3-2 do
  stringgrid1.Cells[q1-2,q2-2]:=floattostr(elements[q1,q2]);

  end;
 //--------------------------------------------------------- /Áîåâàÿ ôóíêöèÿ --------------------------------------------------//










//--------------------------------------------------------- PLOT3d --------------------------------------------------//






procedure TForm1.comBeforeRenderPolygon(Sender: TObject;
  canvas: Tcanvas; var Handled: Boolean; CellX, CellY: Integer;
  quad: TQuad; var color: TColor);


begin
if CheckBox1.Checked then
  if (CellX = MCellX) or (CellY = MCellY) then
    color := clRed;
end;

procedure TForm1.com2BeforeRenderPolygon(Sender: TObject;
  canvas: Tcanvas; var Handled: Boolean; CellX, CellY: Integer;
  quad: TQuad; var color: TColor);


begin
if CheckBox1.Checked then
  if (CellX = MCellX) or (CellY = MCellY) then
    color := clRed;
end;

procedure TForm1.com3BeforeRenderPolygon(Sender: TObject;
  canvas: Tcanvas; var Handled: Boolean; CellX, CellY: Integer;
  quad: TQuad; var color: TColor);


begin
if CheckBox1.Checked then
  if (CellX = MCellX) or (CellY = MCellY) then
    color := clRed;
end;


procedure TForm1.comDataRendered(Sender: TObject; canvas: Tcanvas);
  begin
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Color := clWhite;
  Canvas.TextOut(50,50,'Mining University System Analysis Department');
  end;

procedure TForm1.com2DataRendered(Sender: TObject; canvas: Tcanvas);
  begin
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Color := clWhite;
  Canvas.TextOut(50,50,'Mining University System Analysis Department');
  end;

procedure TForm1.com3DataRendered(Sender: TObject; canvas: Tcanvas);
  begin
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Color := clWhite;
  Canvas.TextOut(50,50,'Mining University System Analysis Department');
  end;

procedure TForm1.comMouseMoveOverPlot(Sender: TObject;
  OverPlot: Boolean; Shift: TShiftState; MouseCellX, MouseCellY: Integer);

begin
MCellX := MouseCellX;
MCellY := MouseCellY;
if OverPlot
  then begin
       Edit4.Text := IntToStr(MouseCellX);
       Edit3.Text := IntToStr(MouseCellY);
       Edit2.Text := FloatToStr(elements[MouseCellX, MouseCellY]);

       end
  else begin
       Edit2.Clear;
       Edit3.Clear;
       edit4.Clear;
       end;
com.Repaint;
end;

procedure TForm1.com2MouseMoveOverPlot(Sender: TObject;
  OverPlot: Boolean; Shift: TShiftState; MouseCellX, MouseCellY: Integer);

begin
MCellX := MouseCellX;
MCellY := MouseCellY;
if OverPlot
  then begin
       Edit4.Text := IntToStr(MouseCellX);
       Edit3.Text := IntToStr(MouseCellY);
       Edit2.Text := FloatToStr(elements[MouseCellX, MouseCellY]);

       end
  else begin
       Edit2.Clear;
       Edit3.Clear;
       edit4.Clear;
       end;
com.Repaint;
end;

procedure TForm1.com3MouseMoveOverPlot(Sender: TObject;
  OverPlot: Boolean; Shift: TShiftState; MouseCellX, MouseCellY: Integer);

begin
MCellX := MouseCellX;
MCellY := MouseCellY;
if OverPlot
  then begin
       Edit4.Text := IntToStr(MouseCellX);
       Edit3.Text := IntToStr(MouseCellY);
       Edit2.Text := FloatToStr(elements[MouseCellX, MouseCellY]);

       end
  else begin
       Edit2.Clear;
       Edit3.Clear;
       edit4.Clear;
       end;
com.Repaint;
end;

procedure TForm1.DrawGraph();
  var
  i,j : integer;
  min, max :real;
  count_high_times,count_high_times_breakable,count_low_times_breakable:integer;
  begin
  count_high_times:=0     ;
    count_high_times_breakable:=0;
    count_low_times_breakable:=0;
  com.GridMat.Resize (XRes-1,YRes-1);
  for i:=0 to XRes do
    for j:=0 to YRes do
    com.GridMat.Elem[i,j] := elements[i,j]*100;
  min := elements[0,0];
  for i:=0 to XRes do
    for j:=0 to YRes do
    if elements[i,j] < min then min := elements[i,j];
  max := elements[0,0];
  for i:=0 to XRes do
    for j:=0 to YRes do
    if elements[i,j] > max then max := elements[i,j];
  com.RangeZLow := int(min) - 100;
  com.ColorScaleLow := int(min);
  com.RangeZHigh := int(max) + 100;
  com.ColorScaleHigh := int(max);
  com.Repaint;
//      count_high_times:=count_high_times+1 ;
//    count_high_times_breakable:=count_high_times_breakable+1;
//    count_low_times_breakable:=0;
    label8.Caption:=inttostr(count_high_times);
    label13.Caption:=inttostr(count_high_times_breakable);

  end;

procedure TForm1.DrawGraph2();
  var
  i,j : integer;
  min, max :real;
  begin
  com2.GridMat.Resize (XRes-1,YRes-1);
  for i:=0 to XRes do
    for j:=0 to YRes do
    com2.GridMat.Elem[i,j] := elements[i,j]*100;
  min := elements[0,0];
  for i:=0 to XRes do
    for j:=0 to YRes do
    if elements[i,j] < min then min := elements[i,j];
  max := elements[0,0];
  for i:=0 to XRes do
    for j:=0 to YRes do
    if elements[i,j] > max then max := elements[i,j];
  com2.RangeZLow := int(min) - 100;
  com2.ColorScaleLow := int(min);
  com2.RangeZHigh := int(max) + 100;
  com2.ColorScaleHigh := int(max);
  com2.Repaint;
  end;

  procedure TForm1.DrawGraph3();
  var
  i,j : integer;
  min, max :real;
  begin
  com3.GridMat.Resize (XRes-1,YRes-1);
  for i:=0 to XRes do
    for j:=0 to YRes do
    com3.GridMat.Elem[i,j] := elements[i,j]*100;
  min := elements[0,0];
  for i:=0 to XRes do
    for j:=0 to YRes do
    if elements[i,j] < min then min := elements[i,j];
  max := elements[0,0];
  for i:=0 to XRes do
    for j:=0 to YRes do
    if elements[i,j] > max then max := elements[i,j];
  com3.RangeZLow := int(min) - 100;
  com3.ColorScaleLow := int(min);
  com3.RangeZHigh := int(max) + 100;
  com3.ColorScaleHigh := int(max);
  com3.Repaint;
  end;








end.





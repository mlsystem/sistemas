unit UControllerAtivacao;

interface
uses
   ExtCtrls, SysUtils, MaskUtils, UclassAtivacao,  Classes,
   DB,Generics.Collections, UniProvider, DBAccess, Uni, MemDS;

   type
   TControllerAtivacao = class
      protected

      private
         class function dia(pdia:integer):string;
         class function mes(piMes:integer) : String;
         class function ano(piAno:integer) : String;
         class function CNPJ(psCnpj:String) : String;
         class function Micro(piMicro:Integer) : String;
         class function Abcd(psAbcd:String) : String;
      public
         class function Chave(ativador:TAtivacao) : String;
         class Procedure InseriChave;
   end;

implementation

{ TControllerAtivacao }

class function TControllerAtivacao.Abcd(psAbcd: String): String;
Var
  sAbcd: Array['A'..'Z'] of String;
begin
    sAbcd['A'] := '6j3';
    sAbcd['B'] := 'F3I';
    sAbcd['C'] := '27c';
    sAbcd['D'] := 'DrD';
    sAbcd['E'] := 'C9y';
    sAbcd['F'] := '4DC';
    sAbcd['G'] := '7ic';
    sAbcd['H'] := '99m';
    sAbcd['I'] := '36q';
    sAbcd['J'] := '6zi';
    sAbcd['L'] := '75g';
    sAbcd['M'] := '4i7';
    sAbcd['N'] := 'Cko';
    sAbcd['O'] := 'A9q';
    sAbcd['P'] := '1m7';
    sAbcd['Q'] := 'ECk';
    sAbcd['R'] := '11A';
    sAbcd['S'] := '64x';
    sAbcd['T'] := '4Dq';
    sAbcd['U'] := 'Ekj';
    sAbcd['V'] := '6qi';
    sAbcd['X'] := '7rj';
    sAbcd['Z'] := '7Im';
    sAbcd['Y'] := '9cb';
    sAbcd['W'] := '868';
    sAbcd['K'] := 'B9F';
    psAbcd := UpperCase(trim(psAbcd));
    result := sAbcd[psAbcd[1]];
end;

class function TControllerAtivacao.ano(piAno: integer): String;
Var
  iAno : Array[2015..2030] of String;
begin
    iAno[2015] := 'Fsf';
    iAno[2016] := 'Di7';
    iAno[2017] := 'Czy';
    iAno[2018] := '487';
    iAno[2019] := '33w';
    iAno[2020] := '4x9';
    iAno[2021] := 'm6u';
    iAno[2022] := '88j';
    iAno[2023] := 'vr2';
    iAno[2024] := '6Ie';
    iAno[2025] := '3F0';
    iAno[2026] := '5h6';
    iAno[2027] := 'wqF';
    iAno[2028] := '38o';
    iAno[2029] := 'D37';
    iAno[2030] := '96G';
  result := iAno[piAno];
end;

class function TControllerAtivacao.Chave(ativador: TAtivacao): String;
var
  wdia, wmes, wano: Word;
begin
   DecodeDate( ativador.data_expira, wano, wmes, wdia);
   result := mes(wmes)+'-'+ CNPJ(ativador.CPFCNPJ)+'-'+Abcd( ativador.razao_social )+'-'+ano(wano)+'-'+Micro(ativador.quantidade_micro)+'-'+dia(wdia);
end;

class function TControllerAtivacao.CNPJ(psCnpj: String): String;
Var
  iCnpj : Array[1..9] of String;
  soma, dig1, dig2, dig3,x : Integer;
begin
    soma := 0;
    For x := 1 to Length(psCnpj) do
    begin
      soma := soma + strToInt(psCnpj[x]);
    end;
    dig1 := StrToIntDef(copy(inttostr(soma),1,1),0);
    dig2 := StrToIntDef(copy(inttostr(soma),2,1),0);
    dig3 := StrToIntDef(copy(inttostr(dig1*dig2),1,1),0);
    iCnpj[1] := 'K';
    iCnpj[2] := 'Y';
    iCnpj[3] := 'I';
    iCnpj[4] := 'A';
    iCnpj[5] := 'W';
    iCnpj[6] := 'Z';
    iCnpj[7] := 'D';
    iCnpj[8] := 'F';
    iCnpj[9] := 'O';
    result := iCnpj[dig1]+iCnpj[dig2]+iCnpj[dig3];
end;

class function TControllerAtivacao.dia(pdia: integer): string;
Var
  iDia : Array[1..31] of String;
begin
    iDia[1] :='ecj';
    iDia[2] :='tBI';
    iDia[3] :='ljb';
    iDia[4] :='0wt';
    iDia[5] :='gly';
    iDia[6] :='oHo';
    iDia[7] :='cCd';
    iDia[8] :='t2d';
    iDia[9] :='vE2';
    iDia[10]:='ey9';
    iDia[11]:='6D3';
    iDia[12]:='51D';
    iDia[13]:='25a';
    iDia[14]:='w7c';
    iDia[15]:='Gr8';
    iDia[16]:='7D3';
    iDia[17]:='Gd4';
    iDia[18]:='8ra';
    iDia[19]:='Erp';
    iDia[20]:='2q6';
    iDia[21]:='mCD';
    iDia[22]:='x2u';
    iDia[23]:='mBH';
    iDia[24]:='3IB';
    iDia[25]:='56B';
    iDia[26]:='50a';
    iDia[27]:='qzr';
    iDia[28]:='F9b';
    iDia[29]:='oqw';
    iDia[30]:='vxf';
    iDia[31]:='ABh';
    Result:=idia[pdia];
end;


class procedure TControllerAtivacao.InseriChave;
begin

end;

class function TControllerAtivacao.mes(piMes: integer): String;
Var
  iMes : Array[1..12] of String;
begin
    iMes[1] := '43q';
    iMes[2] := 'dvC';
    iMes[3] := '0wF';
    iMes[4] := '15l';
    iMes[5] := 'l42';
    iMes[6] := 'sst';
    iMes[7] := 'eoq';
    iMes[8] := 'q27';
    iMes[9] := 'o00';
    iMes[10] := '7lB';
    iMes[11] := 'B8v';
    iMes[12] := '8l6';
    result := iMes[piMes];
end;

class function TControllerAtivacao.Micro(piMicro: Integer): String;
Var
  iMicro : Array[1..30] of String;
begin
    iMicro[1] := 'yEj';
    iMicro[2] := '2ya';
    iMicro[3] := '38t';
    iMicro[4] := '359';
    iMicro[5] := 'ivG';
    iMicro[6] := 'Hoq';
    iMicro[7] := '12r';
    iMicro[8] := '18o';
    iMicro[9] := 'dnw';
    iMicro[10] := 'vC9';
    iMicro[11] := 'oaC';
    iMicro[12] := 'ta5';
    iMicro[13] := 'l2C';
    iMicro[14] := 'm2A';
    iMicro[15] := 'b67';
    iMicro[16] := 'w2u';
    iMicro[17] := 'qg4';
    iMicro[18] := 'm1d';
    iMicro[19] := 'cgs';
    iMicro[20] := 'G5f';
    iMicro[21] := '7xB';
    iMicro[22] := 'wI3';
    iMicro[23] := 'v6I';
    iMicro[24] := 'k73';
    iMicro[25] := 'woj';
    iMicro[26] := 'rmu';
    iMicro[27] := 'ir4';
    iMicro[28] := 'yzl';
    iMicro[29] := 'q5w';
    iMicro[30] := '8qE';
    result := iMicro[piMicro];
end;

end.

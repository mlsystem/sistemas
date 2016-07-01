unit UFuncoesUtils;

interface

 uses  ExtCtrls, SysUtils, Math;

function retiraCaractereEspecial(const value:string):string;
function retornaMascaraIE(uf:string):string;
function cnpjValido(CNPJ: string): boolean;
function validaCPF(cpf:string):Boolean;
function dataValida(data:string):Boolean;
function zeroAEsquerda(quantidade:Integer; str:string):string;
function letrasENumeros(key:string):Boolean;
function geraCodigoDeBarra(codigo:string):string;
Function colocamascaraCPFCNPJ(num: String; tipo: Integer): string;
function retornaNumeroColunaCentral(TamanhoQteColunas, tamanhoTexto :Integer):Integer;


implementation

function zeroAEsquerda(quantidade:Integer; str:string):string;
begin
   Result:=StringOfChar('0', quantidade-Length(Trim(str)))+trim(str);
end;

function retiraCaractereEspecial(const value:string):string;
var
   aux:string;
begin
   aux:=StringReplace(value, '.', '', [rfReplaceAll]);
   aux:=StringReplace(aux, '/', '', [rfReplaceAll]);
   aux:=StringReplace(aux, '-', '', [rfReplaceAll]);
   aux:=StringReplace(aux, ':', '', [rfReplaceAll]);
   aux:=StringReplace(aux, '(', '', [rfReplaceAll]);
   aux:=StringReplace(aux, ')', '', [rfReplaceAll]);
   Result:=aux;
end;

function retornaMascaraIE(uf:string):string;
begin
   if uf='AC' then
      Result:='##.###.###/###-##;1;_'
   else
   if uf='AL' then
      Result:='#########;1;_'
   else
   if uf='AP' then
      Result:='#########;1;_'
   else
   if uf='AM' then
      Result:='##.###.###-#;1;_'
   else
   if uf='BA' then
      Result:='###.###.##-#;1;_'
   else
   if uf='CE' then
      Result:='########-#'
   else
   if uf = 'DF' then
      Result:='###########-##;1;_'
   else
   if uf='ES' then
      Result:='###.###.##-#;1;_'
   else
   if uf='GO' then
      Result:='##.###.###-#;1;_'
   else
   if uf='MA' then
      Result:='#########;1;_'
   else
   if uf='MT' then
      Result:='#########;1;_'
   else
   if uf='MS' then
      Result:='#########;1;_'
   else
   if uf='MG' then
      Result:='###.###.###/####;1;_'
   else
   if uf='PA' then
      Result:='##-######-#;1;_'
   else
   if uf='PB' then
      Result:='########-#;1;_'
   else
   if uf='PR' then
      Result:='########-##;1;_'
   else
   if uf='PE' then
      Result:='##.#.###.#######-#;1;_'
   else
   if uf='PI' then
      Result:='#########;1;_'
   else
   if uf='RJ' then
      Result:='##.###.##-#;1;_'
   else
   if uf='RN' then
      Result:='##.###.###-#;1;_'
   else
   if uf='RS' then
      Result:='###-#######;1;_'
   else
   if uf='RO' then
      Result:='###.#####-#;1;_'
   else
   if uf='RR' then
      Result:='########-#;1;_'
   else
   if uf='SC' then
      Result:='###.###.###;1;_'
   else
   if uf='SP' then
      Result:='###.###.###.###;1;_'
   else
   if uf='SE' then
      Result:='#########-#;1;_'
   else
   if uf='TO' then
      Result:='###########;1;_';

end;

function cnpjValido(CNPJ: string): boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
    aux:string;
begin
    aux:=StringReplace(CNPJ, '.','',[rfReplaceAll]);
    aux:=StringReplace(aux, '/','',[rfReplaceAll]);
    aux:=StringReplace(aux, '-','',[rfReplaceAll]);
    CNPJ:=aux;
   // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
    if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
        (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
        (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
        (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
        (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
        (length(CNPJ) <> 14))
    then
    begin
       Result := false;
       exit;
    end;
    try
      { *-- Cálculo do 1o. Digito Verificador --* }
      sm := 0;
      peso := 2;
      for i := 12 downto 1 do
      begin
          // StrToInt converte o i-ésimo caractere do CNPJ em um número
          sm := sm + (StrToInt(CNPJ[i]) * peso);
          peso := peso + 1;
         if (peso = 10) then
            peso := 2;
      end;
      r := sm mod 11;
      if ((r = 0) or (r = 1)) then
          dig13 := '0'
      else
          str((11-r):1, dig13); // converte um número no respectivo caractere numérico
     { *-- Cálculo do 2o. Digito Verificador --* }
      sm := 0;
      peso := 2;
      for i := 13 downto 1 do
      begin
        sm := sm + (StrToInt(CNPJ[i]) * peso);
        peso := peso + 1;
        if (peso = 10) then
            peso := 2;
      end;
      r := sm mod 11;
      if ((r = 0) or (r = 1)) then
          dig14 := '0'
      else
         str((11-r):1, dig14);

  { Verifica se os digitos calculados conferem com os digitos informados. }
      if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
         Result := true
      else
          Result := false;
    except
         Result := false
    end;
end;
function validaCPF(cpf:string):Boolean;
const
    basecalculo: array [1..10] of Integer = (11,10,9,8,7,6,5,4,3,2); //contante para base de calculo
var
    tamanho, novotamanho,i, somacpf, restoDivisao, digito_1, digito_2:Integer;
    cpf1,cpf2:string; //variaveis para manipular e tirar mascara caso haja
begin
   cpf1:=StringReplace(cpf,'.','',[rfReplaceAll]);
   cpf1:=StringReplace(cpf1,'-','',[rfReplaceAll]);
   if Length(Trim(cpf1))<11 then //verificando se estar todos os 11 numeros do cpf para validação
      Result:=False
   else
   begin
        if trim(cpf1)='00000000000' then
	      result:=false
		    else
        if trim(cpf1)='11111111111' then
            result:=false
        else
        if trim(cpf1)='22222222222' then
            result:=false
        else
        if trim(cpf1)='33333333333' then
            result:=false
        else
        if trim(cpf1)='44444444444' then
            result:=false
        else
        if trim(cpf1)='55555555555' then
            result:=false
        else
        if trim(cpf1)='66666666666' then
            result:=false
        else
        if trim(cpf1)='88888888888' then
            result:=false
        else
        if trim(cpf1)='99999999999' then
            result:=false
        else
        begin
          // Faz o primeiro teste de primeiro digito do cpf
           for I := 1 to Length(Trim(cpf1))-2 do
           begin
              somacpf:=somacpf+(basecalculo[i+1]*StrToInt(cpf1[i]));
           end;
           restoDivisao:=(somacpf mod 11);
           if  restoDivisao>=2 then
              digito_1:=11-restoDivisao
           else
              digito_1:=0;
           if digito_1=StrToInt(cpf1[10]) then //Verificando primeiro digito se estar de acordo com o cpf passado como parametro
           begin
               //zera a variavel para uma nova verificação
               somacpf:=0;
               restoDivisao:=0;
               //Faz a segunda verificação do segundo digito do cpf
               for i := 1 to Length(Trim(cpf1))-1 do
               begin
                somacpf:=somacpf+(basecalculo[i]*StrToInt(cpf1[i]));
               end;
               restoDivisao:=(somacpf mod 11);
               if  restoDivisao>=2 then
                digito_2:=11-restoDivisao
               else
                digito_2:=0;
               if digito_2=StrToInt(cpf1[11]) then //Verificando o segundo digito se estar de acordo com o cpf passado como parametro
                Result:=True
               else
                Result:=False;
           end
           else
            Result:=False;
        end;
   end;
end;
function dataValida(data:string):Boolean;
begin
   try
      StrToDate(data);
      Result:=true;
   except
      Result:=False;
    end;
end;

function letrasENumeros(key:string):Boolean;
var
   i:Integer;
   texto:string;
begin
    Result:=True;
    texto:=UpperCase(Key);
    for i :=1 to Length(texto) do
    begin
      if (not (texto[i] in ['0'..'9','%'])) AND (not (texto[i] in ['A'..'Z'])) then
        Result := false;
    end;
end;

function geraCodigoDeBarra(codigo:string):string;
var
   nX    : Integer;
   nPeso  : Integer;
   nSoma  : Double;
   nMaior  : Double;
   nDigito : Integer;
begin
     nPeso := 3;
     nSoma := 0;
     For nX := 12 DownTo 1 do
     Begin
         nSoma := nSoma + StrToInt( codigo[ nX ] ) * nPeso;
         If nPeso = 3 Then
             nPeso := 1
         Else
             nPeso := 3;
     End;
     nMaior:= ( ( Trunc( nSoma / 10 ) + 1 ) * 10 );
     nDigito:= Trunc( nMaior ) - Trunc( nSoma );
     If nDigito = 10 Then
        nDigito := 0;
     Result := codigo+IntToStr( nDigito );
end;


Function colocamascaraCPFCNPJ(num: String; tipo: Integer): string;
begin
    case tipo of
        1: //CPF
        begin
            Result := copy(num,1,3)+'.'+copy(num,4,3)+'.'+copy(num,7,3)+'-'+copy(num,10,2);
        end;
        2: //CNPJ
        begin
            Result := copy(num,1,2)+'.'+copy(num,3,3)+'.'+copy(num,6,3)+'/'+copy(num,9,4)+'-'+copy(num,13,2);
        end;
    end;
end;

function retornaNumeroColunaCentral(TamanhoQteColunas, tamanhoTexto :Integer):Integer;
var
   tamanho, meio, meio1, posicao:Integer;
begin
   tamanho:=TamanhoQteColunas-tamanhoTexto;
   meio:=tamanho div 2;
   meio1:=tamanhoTexto div 2;
   posicao:=meio;
   Result:=posicao-meio1;
end;

end.

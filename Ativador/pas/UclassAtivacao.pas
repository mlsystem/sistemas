unit UclassAtivacao;

interface

uses
   ExtCtrls, SysUtils, MaskUtils;

   type
   TAtivacao = class
      protected

      private
           FCPFCNPJ : String;
           FRAZSOC : String;
           FData : Tdatetime;
           FQdtMicro : Integer;
      public
          property CPFCNPJ:string  read FCPFCNPJ write FCPFCNPJ;
          property razao_social:string  read FRAZSOC write FRAZSOC;
          property data_expira:TDateTime  read FData write FData;
          property quantidade_micro:integer  read FQdtMicro write FQdtMicro;
   end;

implementation

end.

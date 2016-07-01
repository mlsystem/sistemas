unit UfrmAtivadorSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxGDIPlusClasses, StdCtrls, Mask, JvExStdCtrls, JvEdit,
  JvValidateEdit, rxToolEdit, Buttons;

type
  TfrmAtivadorSistema = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    rdTipoPessoa: TRadioGroup;
    edtRazaoSocial: TEdit;
    lblTipo: TLabel;
    edtCPFCNPJ: TMaskEdit;
    Label3: TLabel;
    edtQtdMicros: TJvValidateEdit;
    Label4: TLabel;
    edtDataExpira: TDateEdit;
    btnGerarChave: TBitBtn;
    edtChave: TEdit;
    procedure rdTipoPessoaClick(Sender: TObject);
    procedure btnGerarChaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtivadorSistema: TfrmAtivadorSistema;

implementation

uses
    UclassAtivacao, UControllerAtivacao, UFuncoesUtils;

{$R *.dfm}

procedure TfrmAtivadorSistema.btnGerarChaveClick(Sender: TObject);
var
   ativador:TAtivacao;
   controller:TControllerAtivacao;
begin
   if Length(Trim(edtRazaoSocial.Text))>0 then
   begin
       if Length(trim(retiraCaractereEspecial(edtCPFCNPJ.Text)))>0 then
       begin
           if edtQtdMicros.Value>0 then
           begin
               if dataValida(edtDataExpira.Text) then
               begin
                  ativador:=TAtivacao.Create;
                  controller:=TControllerAtivacao.Create;
                  try
                      ativador.CPFCNPJ:=trim(retiraCaractereEspecial(edtCPFCNPJ.Text));
                      ativador.razao_social:=edtRazaoSocial.Text;
                      ativador.quantidade_micro:=edtQtdMicros.Value;
                      ativador.data_expira:=StrToDate(edtDataExpira.Text);
                      edtChave.Text:='CHAVE DE ATIVAÇÃO: '+controller.Chave(ativador);
                  finally
                      FreeAndNil(ativador);
                      FreeAndNil(controller);
                  end;
               end
               else
               begin
                  Application.MessageBox('Informe uma data válida.', 'Aviso',
                    MB_OK + MB_ICONWARNING + MB_TOPMOST);
                    edtDataExpira.SetFocus;
               end;
           end
           else
           begin
              Application.MessageBox('Informe a quantidade de micros', 'Aviso',
                    MB_OK + MB_ICONWARNING + MB_TOPMOST);
              edtQtdMicros.SetFocus;
           end;

       end
       else
       begin
           Application.MessageBox('Informe o CPF/CNPJ', 'Aviso',
                    MB_OK + MB_ICONWARNING + MB_TOPMOST);
           edtCPFCNPJ.SetFocus;
       end;
   end
   else
   begin
       Application.MessageBox('Informe a Razão Social.', 'Aviso',
                    MB_OK + MB_ICONWARNING + MB_TOPMOST);
       edtRazaoSocial.SetFocus;
   end;
end;

procedure TfrmAtivadorSistema.rdTipoPessoaClick(Sender: TObject);
begin
   case rdTipoPessoa.ItemIndex of
        0:
        begin
           lblTipo.Caption:='CPF:';
           edtCPFCNPJ.Clear;
           edtCPFCNPJ.EditMask:='999.999.999-99;1;_';
           edtCPFCNPJ.SetFocus;
        end;
        1:
        begin
           lblTipo.Caption:='CNPJ:';
           edtCPFCNPJ.Clear;
           edtCPFCNPJ.EditMask:='99.999.999/9999-99;1;_';
           edtCPFCNPJ.SetFocus;
        end;
   end;

end;

end.

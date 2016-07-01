program Ativador;

uses
  Forms,
  UfrmAtivadorSistema in '..\pas\UfrmAtivadorSistema.pas' {frmAtivadorSistema},
  UFuncoesUtils in '..\pas\UFuncoesUtils.pas',
  UclassAtivacao in '..\pas\UclassAtivacao.pas',
  UControllerAtivacao in '..\pas\UControllerAtivacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAtivadorSistema, frmAtivadorSistema);
  Application.Run;
end.

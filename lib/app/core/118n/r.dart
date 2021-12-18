class R {
  static final strings = Strings();
}

class Strings {
  String get projetosView => "Meus Projetos";

  String get msgNoInternet => "Internet indisponível, verifique sua conexão.";
  String get msgTimeoutException =>
      "Internet indisponível, verifique sua conexão.";
  String get msgGenericError => "Oops, algo deu errado.";
  String get msgApiFailure => "Oops, servidor indisponível.";

  String get projetos_list_is_empty => "A lista de projetos está vazia.";

  String get loginRequired => "Login é obrigatório";
  String get passwordRequired => "Senha é obrigatório";
  String get passwordMinLength => "Senha precisa ter ao menos 3 números";

  String get headerComplete => "Carregamento concluído";
  String get headerFailed => 'Erro ao carregar os dados';
  String get headerRefresh => 'Carregando...';
  String get footerFailed => 'Erro ao carregar os dados';
  String get footerNoData => "Todos os dados carregados";
  String get footerRelease => "Solte para carregar mais dados";
}

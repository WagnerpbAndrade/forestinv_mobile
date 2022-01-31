class FirebaseAuthError implements Exception {
  final String codigoErro;

  FirebaseAuthError(this.codigoErro);

  String retornoErro() {
    switch (codigoErro) {
      case "user-not-found":
        return "Usuário não encontrado";
      case "wrong-password":
        return "Email ou senha incorretos";
      case "too-many-requests":
        return "Muitas tentativas. Tente mais tarde";
      case "email-already-exists":
        return "Email informado já está cadastrado";
      case "invalid-email":
        return "Email inválido";
      default:
        return "Ops! Algo de errado aconteceu";
    }
  }
}

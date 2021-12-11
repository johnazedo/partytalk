

class Strings {
  // Shared
  static const appName = "PartyTalk";
  static const fontFamily = "Avenir";

  // AuthScreen
  static const googleTextButton = "Entrar com o Google";
  static const appDescription = "O aplicativo de conversas para o seu evento. Efetue o login para expandir o seu network.";

  // ChatsScreen
  static const chats = "Conversas";
  static const events = "Eventos";
  static const search = "Pesquisar";
  static const noMessages = "Nenhum registro de conversa recente";

  // UsernameScreen
  static const createUser = "Criar usuário";
  static const usernameIsUnavailable = "Este username já está sendo usado!";
  static const usernameIsInvalid = "Este username é inválido!";

  static String getWelcomeMessage(String name) {
    return "Bem vindo, $name! 🎊 \nPor favor digite o seu nome de usuário:";
  }
}

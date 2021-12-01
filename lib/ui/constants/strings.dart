

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

  // UsernameScreen
  static const createUser = "Criar usuário";
  static const usernameIsNotValid = "Este username já existe!";

  static String getWelcomeMessage(String name) {
    return "Bem vindo, $name! 🎊 \nPor favor digite o seu nome de usuário:";
  }
}

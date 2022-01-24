class Strings {
  // Shared
  static const appName = "PartyTalk";
  static const fontFamily = "Avenir";

  // AuthScreen
  static const googleTextButton = "Entrar com o Google";
  static const appDescription =
      "O aplicativo de conversas para o seu evento. Efetue o login para expandir o seu network.";

  // ChatsScreen
  static const chats = "Conversas";
  static const noMessages = "Nenhum registro de conversa recente";
  static const message = "Mensagem";

  // UsernameScreen
  static const createUser = "Criar usuário";
  static const usernameIsUnavailable = "Este username já está sendo usado!";
  static const usernameIsInvalid = "Este username é inválido!";

  // EventPaticipantsScreen
  static const emptyContacts = "Sem contatos no evento";
  static const error = "erro";

  // EventsScreen
  static const events = "Eventos";
  static const noEvents = "Nenhum evento registrado";

  // SearchScreen
  static const search = "Pesquisar";
  static const noResults = "Nenhum resultado encontrado";

  static String getWelcomeMessage(String name) {
    return "Bem vindo, $name! 🎊 \nPor favor digite o seu nome de usuário:";
  }
}

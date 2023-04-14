class ConstantsStrings {
  static const String todos = 'Tarefas';
  static const String todosSubtitle =
      'Lista de tarefas criadas para teste técnico';
  static const String todo = 'Tarefa';
  static String todoSubtitle(bool isEdit) =>
      isEdit ? 'Edite a sua tarefa' : 'Crie uma nova tarefa';
  static const String defaultErrorMessage = "Ocorreu um erro";
  static const String defaultErrorDetails = "Por favor tente novamente";
  static const String todosEmpty = 'Você precisa adicionar novas tarefas';
  static const String tryAgain = "Tentar novamente";
  static const String close = "Fechar";
  static const String error404 = "Rota não encontrada";
  static const String titleHelper = 'Máximo de 100 e mínimo de 3 letras';
}

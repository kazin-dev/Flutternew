class Usuario{
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({ int? codigo,String? senha,String? login, String? nome}){
    _codigo = codigo;
    _nome = nome;
    _login = login;
    _senha = senha;
  }

  //getters
  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get senha => _senha;
  //exemplo tradicional

  String? get login{
    return _login;
  }

  //metodo estilo dart



  //setters
  set nome(String? nome) => _nome = nome;
  set codigo(int? codigo) => _codigo = codigo;
  set senha(String? senha) => _senha = senha;


  //metodo set ao estilo dart
  set login(String? login){
    _login = login;
  }

}
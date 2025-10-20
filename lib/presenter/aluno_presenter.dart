import 'dart:convert'; // Importa o pacote para codificação e decodificação JSON.
import 'package:app_aluno/model/aluno.dart'; // Importa o modelo Aluno.
import 'package:http/http.dart'
    as http; // Importa o pacote HTTP para fazer requisições web.
import '../view/aluno_view.dart'; // Importa a interface de visualização AlunoView.
import 'package:cloud_firestore/cloud_firestore.dart';

class AlunoPresenter {
  final AlunoView
      view; // Instância de AlunoView para comunicação entre o Presenter e a View.

  final CollectionReference alunosRef =
      FirebaseFirestore.instance.collection('alunos');

  // Construtor da classe AlunoPresenter, que inicializa a instância de view.
  AlunoPresenter(this.view);

  //firebase
  // Método que busca os alunos do Firestore.
  Future<void> fetchAlunosFirebase() async {
    try {
      // Obtém os dados da coleção 'alunos' no Firestore.
      QuerySnapshot snapshot = await alunosRef.get();

      // Mapeia os dados para uma lista de objetos Aluno.
      List<Aluno> alunos = snapshot.docs.map((doc) {
        return Aluno.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Exibe a lista de alunos na view.
      view.displayAlunos(alunos);
    } catch (e) {
      // Captura exceções e exibe a mensagem de erro.
      view.showError('Erro ao buscar dados: $e');
    }
  }

  // Método para adicionar um aluno ao Firestore.
  Future<void> addAlunoFirebase(Aluno aluno) async {
    try {
      print("Salvando aluno no Firestore: ${aluno.toJson()}");
      // Adiciona um novo documento na coleção 'alunos'.
      await alunosRef.add(aluno.toJson());

      // Atualiza a lista após adicionar o aluno.
      fetchAlunosFirebase();
    } catch (e) {
      // Captura exceções e exibe a mensagem de erro.
      view.showError('Erro ao adicionar aluno: $e');
    }
  }
}

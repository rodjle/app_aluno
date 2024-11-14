import 'package:app_aluno/view/CameraInterface.dart';

import '../repository/camera_repository.dart';

/// Classe responsável pela lógica de negócios da câmera
/// Comunica-se com `CameraView` e `CameraRepository`
class CameraPresenter {
  final CameraInterface view;
  final CameraRepository _repository = CameraRepository();

  CameraPresenter(this.view); // Inicializa com a View

  /// Método para capturar uma foto
  Future<void> takePhoto() async {
    try {
      // Chama o repositório para capturar imagem
      final imagePath = await _repository.captureImage();
      if (imagePath != null) {
        view.showImage(imagePath); // Exibe a imagem capturada na View
      } else {
        view.showError("Erro ao capturar imagem.");
      }
    } catch (e) {
      view.showError("Erro: ${e.toString()}"); // Exibe mensagem de erro
    }
  }

  /// Método para gravar um vídeo
  Future<void> recordVideo() async {
    try {
      // Chama o repositório para capturar vídeo
      final videoPath = await _repository.captureVideo();
      if (videoPath != null) {
        view.showVideo(videoPath); // Exibe o vídeo capturado na View
      } else {
        view.showError("Erro ao gravar vídeo.");
      }
    } catch (e) {
      view.showError("Erro: ${e.toString()}"); // Exibe mensagem de erro
    }
  }
}

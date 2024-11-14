/// Interface da View para a funcionalidade de captura de câmera
/// Define métodos para exibir imagem, vídeo e mensagens de erro
abstract class CameraInterface {
  void showImage(String imagePath); // Exibe a imagem capturada
  void showVideo(String videoPath); // Exibe o vídeo capturado
  void showError(String message); // Exibe uma mensagem de erro
}

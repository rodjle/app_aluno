import 'package:image_picker/image_picker.dart';

/// Classe responsável por lidar com a câmera
/// Captura imagens e vídeos e retorna o caminho do arquivo
class CameraRepository {
  final ImagePicker _picker = ImagePicker();

  /// Método para capturar uma imagem da câmera
  Future<String?> captureImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    return photo?.path; // Retorna o caminho da imagem capturada
  }

  /// Método para capturar um vídeo da câmera
  Future<String?> captureVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    return video?.path; // Retorna o caminho do vídeo capturado
  }
}

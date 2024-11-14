import 'package:flutter/material.dart';
import 'dart:io';

import '../presenter/camera_presenter.dart';
import 'CameraInterface.dart';

/// Tela principal para captura de fotos e vídeos
/// Implementa a interface `CameraView`
class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> implements CameraInterface {
  late CameraPresenter _presenter;
  String? _mediaPath; // Caminho da mídia capturada (imagem ou vídeo)

  @override
  void initState() {
    super.initState();
    _presenter = CameraPresenter(this); // Inicializa o presenter
  }

  /// Exibe a imagem capturada na interface
  @override
  void showImage(String imagePath) {
    setState(() {
      _mediaPath = imagePath;
    });
  }

  /// Exibe o vídeo capturado na interface
  @override
  void showVideo(String videoPath) {
    setState(() {
      _mediaPath = videoPath;
    });
  }

  /// Exibe uma mensagem de erro na interface
  @override
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Constrói a interface da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Verifica se há uma mídia para exibir
            if (_mediaPath != null)
              _mediaPath!.endsWith('.mp4')
                  ? Text('Vídeo capturado: $_mediaPath') // Exibe vídeo
                  : Image.file(File(_mediaPath!)), // Exibe imagem
            SizedBox(height: 20),
            // Botão para tirar foto
            ElevatedButton(
              onPressed: _presenter.takePhoto,
              child: Text('Tirar Foto'),
            ),
            // Botão para gravar vídeo
            ElevatedButton(
              onPressed: _presenter.recordVideo,
              child: Text('Gravar Vídeo'),
            ),
          ],
        ),
      ),
    );
  }
}

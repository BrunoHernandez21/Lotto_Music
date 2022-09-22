import 'dart:io';

import 'package:flutter/material.dart';

import '../localStorage/file_storage.dart';
import 'image_repository.dart';

class ImageP extends StatelessWidget {
  final String url;
  final bool min;
  // ignore: use_key_in_widget_constructors
  const ImageP({required this.url, this.min = false});

  @override
  Widget build(BuildContext context) {
    if (url.length < 10) {
      return const Image(
        image: AssetImage('assets/appUtils/no-image.jpg'),
        fit: BoxFit.cover,
      );
    }

    if (url.startsWith("temp")) {
      return FutureBuilder<File?>(
          future: FileRepository.loadTempImage(url),
          initialData: null,
          builder: (context, snap) {
            if (snap.data == null) {
              return const Image(
                image: AssetImage('assets/appUtils/loading.gif'),
                fit: BoxFit.cover,
              );
            } else {
              try {
                return Image.file(
                  snap.data!,
                  fit: BoxFit.cover,
                );
              } catch (e) {
                return _primaryImage(context);
              }
            }
          });
    }

    return _primaryImage(context);
  }

  FutureBuilder<File?> _primaryImage(BuildContext context) {
    return FutureBuilder<File?>(
      future: ImageRepository.fileImage(url, context, min),
      initialData: null,
      builder: (context, snap) {
        if (snap.data == null) {
          return const Image(
            image: AssetImage('assets/appUtils/loading.gif'),
            fit: BoxFit.cover,
          );
        } else {
          return Image.file(
            snap.data!,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}

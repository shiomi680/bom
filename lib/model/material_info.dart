import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class MaterialInfo {
  const MaterialInfo(this.name, this.partsId, this.explanation,
      {this.imagePath});
  final String? imagePath;
  final String name;
  final String partsId;
  final String explanation;

  MaterialInfo copyWith(
          {String? name,
          String? partsId,
          String? explanation,
          String? imagePath}) =>
      MaterialInfo(name ?? this.name, partsId ?? this.partsId,
          explanation ?? this.explanation,
          imagePath: imagePath ?? this.imagePath);

  AssetImage getImage() {
    if (imagePath != null) {
      return AssetImage(imagePath!);
    } else {
      return const AssetImage("assets/images/no_image.png");
    }
  }
}

class MaterialInfoNotifier extends StateNotifier<MaterialInfo> {
  MaterialInfoNotifier()
      : super(MaterialInfo("name", "partsId", "explanation"));
  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setExplanation(String explanation) {
    state = state.copyWith(explanation: explanation);
  }

  void setMaterialInfo(MaterialInfo mat) {
    state = mat.copyWith();
  }
}

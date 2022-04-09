import 'material_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

@immutable
class BomInfo {
  const BomInfo(this.materialInfo, this.partsInfoList);
  final List<PartsInfo> partsInfoList;
  final MaterialInfo materialInfo;
}

@immutable
class PartsInfo {
  const PartsInfo(this.materialInfo, this.count, {this.note});
  final MaterialInfo materialInfo;
  final int count;
  final String? note;

  PartsInfo copyWith({MaterialInfo? materialInfo, int? count, String? note}) =>
      PartsInfo(materialInfo ?? this.materialInfo, count ?? this.count,
          note: note ?? this.note);

  String get name => materialInfo.name;
  String get partsId => materialInfo.partsId;
  String get explanation => materialInfo.explanation;
  AssetImage getImage() {
    return materialInfo.getImage();
  }
}

class PartsInfoNotifier extends StateNotifier<PartsInfo> {
  PartsInfoNotifier(PartsInfo partsInfo) : super(partsInfo.copyWith());

  void setName(String name) {
    state =
        state.copyWith(materialInfo: state.materialInfo.copyWith(name: name));
  }

  void setCount(int count) {
    state = state.copyWith(count: count);
  }

//
  void increaseCount() {
    state = state.copyWith(count: state.count + 1);
  }

  void decreaseCount() {
    int next = 0 < state.count - 1 ? state.count - 1 : 0;
    state = state.copyWith(count: next);
  }

  void setPartsInfo(PartsInfo info) {
    state = info.copyWith();
  }
}

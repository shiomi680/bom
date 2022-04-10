import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'material_info.dart';
import 'parts_info.dart';
import 'file_info.dart';

@immutable
class BomInfo {
  const BomInfo(this.mainInfo,
      {this.partsList = const [], this.fileInfoList = const []});
  final MaterialInfo mainInfo;
  final List<PartsInfo> partsList;
  final List<FileInfo> fileInfoList;
}

class BomInfoNotifier extends StateNotifier<BomInfo> {
  BomInfoNotifier(BomInfo bom) : super(bom);
}

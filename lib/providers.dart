import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/parts_info.dart';
import 'model/material_info.dart';

class PartsListNotifier extends StateNotifier<List<PartsInfo>> {
  PartsListNotifier() : super([]);
}

// 現在ページの部品の情報
final topInfoProvider =
    StateNotifierProvider<MaterialInfoNotifier, MaterialInfo>(
        (ref) => MaterialInfoNotifier());

// 現在ページの部品リスト
final partsListProvider =
    StateNotifierProvider<PartsListNotifier, List<PartsInfo>>(
        (ref) => PartsListNotifier());

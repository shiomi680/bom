import '../model/material_info.dart';
import '../model/parts_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const SUSHI = MaterialInfo("maguro nigiri", "stdmenu-1",
    "This is most important nigiri in usual sushi restrant.",
    imagePath: "assets/parts/sushi/icon.jpg");

const MAGURO = MaterialInfo("maguro", "maguro-1", "large fish",
    imagePath: "assets/parts/maguro/icon.png");

final sushiPartsProvider = StateNotifierProvider<PartsInfoNotifier, PartsInfo>(
    (ref) => PartsInfoNotifier(PartsInfo(SUSHI, 1)));

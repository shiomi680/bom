import '../model/material_info.dart';
import '../model/parts_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/bom_info.dart';

const SUSHI = MaterialInfo("maguro nigiri", "stdmenu-1",
    "This is most important nigiri in usual sushi restrant.",
    imagePath: "assets/parts/sushi/icon.jpg");

const MAGURO = MaterialInfo("maguro", "maguro-1", "large fish",
    imagePath: "assets/parts/maguro/icon.png");

const SHARI = MaterialInfo("shari", "rice-1", "Koshihikari from Nigata",
    imagePath: "assets/parts/shari/icon.jpg");

const SUSHI_INFO =
    BomInfo(SUSHI, partsList: [PartsInfo(MAGURO, 1), PartsInfo(SHARI, 1)]);

// final sushiBomProvider = StateNotifierProvider<

final sushiPartsProvider = StateNotifierProvider<PartsInfoNotifier, PartsInfo>(
    (ref) => PartsInfoNotifier(PartsInfo(SUSHI, 1)));

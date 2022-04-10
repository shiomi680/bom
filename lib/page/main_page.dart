import 'package:bom/model/bom_info.dart';
import 'package:bom/model/file_info.dart';

import '../model/material_info.dart';
import '../model/parts_info.dart';
import '../widget/parts_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/parts_list_widget.dart';
import '../providers.dart';
import '../sample_data/sushi.dart';
import '../widget/file_list_widget.dart';
import '../widget/main_info_widget.dart';

void main() {
  PartsInfo sampleParts = PartsInfo(SUSHI, 2);
  runApp(ProviderScope(child: MaterialApp(home: MainPage())));
}

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BomInfo bomInfo = SUSHI_INFO;
    MaterialInfo topInfo = bomInfo.mainInfo;
    return MaterialApp(
        title: 'Flutter test',
        theme: ThemeData(
            // primarySwatch: Colors.deepPurple,
            ),
        home: Scaffold(
            body: Column(children: [
          Container(child: MainInfoWidget(topInfo)),
          Container(height: 500, child: DataTableView(bomInfo.partsList, []))
        ])));
  }
}

class DataTableView extends ConsumerWidget {
  DataTableView(this.partsList, this.fileList, {Key? key}) : super(key: key);
  List<PartsInfo> partsList;
  List<FileInfo> fileList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          // height: 300,
          child: Row(children: [
        Container(
          child: PartsListWidget(partsInfoList: this.partsList),
          width: constraints.maxWidth - 400,
          // height: 300,
        ),
        Container(
          child: FileListWidget(["abc", "test"]),
          width: 400,
          // height: 300,
        )
      ]));
    });
  }
}

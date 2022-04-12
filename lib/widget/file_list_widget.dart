import 'package:bom/model/file_info.dart';

import '../model/parts_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../sample_data/sushi.dart';
import 'package:flutter/src/material/icon_button.dart';
import 'package:flutter/src/material/icons.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(home: FileListWidget([FileInfo("path")]))));
}

class FileTileCard extends ConsumerWidget {
  final String fileName;
  const FileTileCard(this.fileName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.file_open),
      title: Text(fileName),
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(child: Text("change...")),
            PopupMenuItem(child: Text("delete")),
          ];
        },
      ),
    ));
  }
}

class FileListWidget extends ConsumerWidget {
  final List<FileInfo> fileNameList;
  const FileListWidget(this.fileNameList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final PartsInfo partsInfo = ref.watch(partsInfoProvider);
    // final ThemeData themeData = Theme.of(context);
    // double padding = 25;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Container(
        child: ListView.builder(
            controller: ScrollController(),
            itemCount: fileNameList.length,
            itemBuilder: (context, index) =>
                FileTileCard(fileNameList[index].path)));
  }
}

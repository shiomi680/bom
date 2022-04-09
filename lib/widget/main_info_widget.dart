import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../sample_data/sushi.dart';
import '../model/material_info.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: MainInfoWidget(SUSHI))));
}

// class MyApp extends ConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//         title: 'Flutter test',
//         theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//         ),
//         home: Scaffold(
//             body: Column(children: [
//           const MainInfoWidget(),
//           ElevatedButton(
//               onPressed: () => ref
//                   .read(partsInfoProvider.notifier)
//                   .setPartsInfo(PartsInfo(SUSHI, 1)),
//               child: const Text("testbutton")),
//         ])));
//   }
// }

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//         title: 'Flutter test',
//         theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//         ),
//         home: Scaffold(
//             body: Column(children: [
//           const MainInfoWidget(),
//           ElevatedButton(
//               onPressed: () => ref
//                   .read(partsInfoProvider.notifier)
//                   .setPartsInfo(PartsInfo(SUSHI, 1)),
//               child: const Text("testbutton")),
//         ])));
//   }
// }

class MainInfoWidget extends ConsumerWidget {
  const MainInfoWidget(this.materialInfo, {Key? key}) : super(key: key);
  final MaterialInfo materialInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MaterialInfo partsInfo = ref.watch(partsInfoProvider);
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    double paddingBottom = 20;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Container(
        color: themeData.backgroundColor,
        // width: 200,
        height: 120,
        padding: EdgeInsets.symmetric(vertical: paddingBottom),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // #Image(image: Image.asset(name),)

            Padding(
                padding: sidePadding,
                child: Image(width: 200, image: materialInfo.getImage())),
            // Padding(padding: )
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    materialInfo.name,
                    style: themeData.textTheme.headline4,
                  ),
                  Text(materialInfo.partsId,
                      style: themeData.textTheme.bodyText1)
                ]),
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Text(
                      materialInfo.explanation,
                      style: themeData.textTheme.bodyText1,
                    )))
          ],
        ));
  }
}

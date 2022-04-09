import '../providers.dart';
import '../sample_data/sushi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../sample_data/sushi.dart';
import '../model/parts_info.dart';

void main() {
  PartsInfo sampleParts = PartsInfo(SUSHI, 2);

  runApp(ProviderScope(child: MaterialApp(home: PartsCardTestWidget())));
}

class PartsCardTestWidget extends ConsumerWidget {
  const PartsCardTestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PartsCard.builder(
        ref.watch(sushiPartsProvider), ref.watch(sushiPartsProvider.notifier));
  }
}

class NumBoxForCard extends ConsumerWidget {
  final int count;
  final Function on_increase;
  final Function on_decrease;
  const NumBoxForCard(
    this.count,
    this.on_increase,
    this.on_decrease, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData themeData = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          children: [
            IconButton(
              onPressed: () => on_increase(),
              icon: const Icon(Icons.add_circle),
              color: themeData.primaryColor,
            ),
            // IconButton(icon: Icons.abc,)
            Text(
              count.toString(),
              style: themeData.textTheme.headline6,
            ),
            IconButton(
              onPressed: () => on_decrease(),
              icon: const Icon(Icons.remove_circle),
              color: themeData.primaryColor,
            ),
          ],
        ));
  }
}

class PartsCard extends ConsumerWidget {
  const PartsCard(this.partsInfo, this.onIncrease, this.onDecrease, {Key? key})
      : super(key: key);
  final PartsInfo partsInfo;
  // final PartsInfoNotifier notifiers;
  final Function onIncrease;
  final Function onDecrease;

  static PartsCard builder(
      PartsInfo partsInfo, PartsInfoNotifier partsInfoNotifier) {
    return PartsCard(partsInfo, partsInfoNotifier.increaseCount,
        partsInfoNotifier.decreaseCount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData themeData = Theme.of(context);
    return Card(child: LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                //数
                // NumBoxForCard(partsInfo.count, notifiers.increaseCount,
                //     notifiers.decreaseCount),
                NumBoxForCard(
                    partsInfo.count, this.onIncrease, this.onDecrease),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      //画像アイコン
                      Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // border: Border.all(width: 2),
                              color: themeData.scaffoldBackgroundColor),
                          child: Image(image: partsInfo.getImage())),

                      //タイトル
                      Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                partsInfo.name,
                                style: themeData.textTheme.headline5,
                              ),
                              Text(
                                partsInfo.partsId,
                                style: themeData.textTheme.bodyText2,
                              )
                            ],
                          )),
                      Expanded(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                partsInfo.explanation,
                                overflow: TextOverflow.fade,
                              )))
                    ])),
              ],
            ));
      },
    ));
  }
}

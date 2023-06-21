import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realm/realm.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/db/area_formats/area_format.dart';
import 'package:weather_app/model/area.dart';

class SearchPage2 extends StatefulWidget {
  const SearchPage2({super.key});

  @override
  SearchPage2State createState() => SearchPage2State();
}

class SearchPage2State extends State<SearchPage2> {
  late RealmResults<AreaFormatRealm> areaResult;
  final List<AreaFormatRealm> searchHistory = <AreaFormatRealm>[];

  @override
  void initState() {
    super.initState();

    getAreaResult();
  }

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map((AreaFormatRealm area) {
      String itemVal = '${area.province}, ${area.city}, ${area.district}';
      return ListTile(
        leading: const Icon(Icons.history),
        title: Text(itemVal),
        trailing: IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            controller.text = itemVal;
            controller.selection =
                TextSelection.collapsed(offset: controller.text.length);
          },
        ),
      );
    });
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String val = controller.value.text;
    if (val.isEmpty) return [];

    if (areaResult.isEmpty) return [];

    final results = areaResult.query(
      "province LIKE '*$val*' OR city LIKE '*$val*' OR district LIKE '*$val*'",
    );

    if (results.isEmpty) return [];

    final List<AreaFormatRealm> searchResults = results.toList();

    return List.generate(
      searchResults.length,
      (index) {
        final AreaFormatRealm result = searchResults[index];
        final String itemVal =
            '${result.province}, ${result.city}, ${result.district}';

        return ListTile(
          title: Text(itemVal),
          onTap: () {
            controller.closeView(itemVal);
            // handle select result for and add search hository
            handleSelection(result);
            // jump to the weather details page
            redirectEvent(result);
          },
        );
      },
    );
  }

  void redirectEvent(AreaFormatRealm result) {
    if (!result.isValid) return;

    context.pushNamed(
      '/weather/detail/china',
      pathParameters: {
        'city': result.district,
        'cityId': result.stationid,
      },
    );
  }

  void handleSelection(AreaFormatRealm result) {
    setState(() {
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Bar Sample')),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SearchAnchor.bar(
              barHintText: '查询城市',
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                if (controller.text.isEmpty) {
                  if (searchHistory.isNotEmpty) {
                    return getHistoryList(controller);
                  }

                  return [
                    const Center(
                      child: Text(
                        'No search history.',
                      ),
                    )
                  ];
                }

                return getSuggestions(controller);
              },
            ),
          ],
        ),
      ),
    );
  }

  void getAreaResult() async {
    // 获取realm存储对象
    final Realm areaRealm = generateAreaFormatRealm();
    areaResult = areaRealm.all<AreaFormatRealm>();

    if (areaResult.isNotEmpty) return;

    final List<Area> areas = await getAreas();

    final List<AreaFormatRealm> areaList = [];
    for (Area area in areas) {
      for (CityList citys in area.cityList!) {
        for (DisList dis in citys.disList!) {
          areaList.add(AreaFormatRealm(
              area.province!, citys.city!, dis.district!, dis.stationid!));
        }
      }
    }

    areaRealm.write(() => areaRealm.addAll(areaList));
  }
}

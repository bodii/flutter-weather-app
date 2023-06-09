import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:realm/realm.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/db/area_formats/area_format.dart';
import 'package:weather_app/model/area.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final FocusNode cancelFocus = FocusNode();

  List<AreaFormatRealm> searchResults = [];
  GlobalKey textGlobalKey = GlobalKey();

  OverlayEntry? searchPopup;
  int selectIndex = -1;

  late Realm areaRealm;
  late RealmResults<AreaFormatRealm> areaResult;

  // late OverlayEntry searchPopup;

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {});
    // 添加焦点事件
    searchFocus.addListener(() {
      if (searchFocus.hasFocus) {
        FocusScope.of(context).requestFocus(searchFocus);
      } else {
        FocusScope.of(context).requestFocus(cancelFocus);
      }
    });

    // 设置realm存储对象
    final config = Configuration.local(
      [
        AreaFormatRealm.schema,
      ],
      // path: './assets/realm/area.realm',
    );
    areaRealm = Realm(config);
    areaResult = areaRealm.all<AreaFormatRealm>();
    getAreaResult();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('搜索城市'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 55,
                child: TextField(
                  key: textGlobalKey,
                  controller: searchController,
                  focusNode: searchFocus,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "查询城市",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      gapPadding: 30.0,
                    ),
                    suffixIcon: IconButton(
                      onPressed: cancelSearchContent,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: inputEvent,
                  onSubmitted: submitEvent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cancelSearchContent() {
    searchController.clear();

    cancelSearchPopup();
  }

  void search(String val) {
    if (val.isEmpty) return;

    if (areaResult.isEmpty) return;

    final results = areaResult.query(
      "province LIKE '*$val*' OR city LIKE '*$val*' OR district LIKE '*$val*'",
    );
    if (results.isEmpty) return;

    setState(() {
      searchResults = results.toList();
      cancelSearchPopup();

      searchPopup = createSearchPopup();
      if (searchPopup != null) {
        Overlay.of(context).insert(searchPopup!);
      }
    });
  }

  void inputEvent(String val) {
    search(val);
  }

  void submitEvent(String provcn) {
    search(provcn);

    cancelSearchPopup();

    redirectEvent();
  }

  void redirectEvent() {
    if (searchController.text.isEmpty) return;
    if (selectIndex < 0) return;

    AreaFormatRealm result = searchResults[selectIndex];
    if (!result.isValid) return;

    context.pushNamed(
      '/weather/detail/china',
      pathParameters: {
        'city': result.district,
        'cityId': result.stationid,
      },
    );
  }

  void getAreaResult() async {
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

  void cancelSearchPopup() {
    if (searchPopup != null) {
      searchPopup!.remove();
      searchPopup = null;
    }
  }

  OverlayEntry createSearchPopup() {
    OverlayEntry overlay = OverlayEntry(
      builder: (context) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom]);
        return Positioned(
          width: 345,
          top: 132,
          left: 33,
          child: Material(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                border: Border.all(width: 1, color: Colors.grey.shade300),
              ),
              child: generateSearchPopupData(),
            ),
          ),
        );
      },
    );

    return overlay;
  }

  Widget generateSearchPopupData() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1, color: Colors.grey.shade300),
      shrinkWrap: true,
      itemCount: searchResults.length,
      itemBuilder: (BuildContext context, int index) {
        AreaFormatRealm result = searchResults[index];
        String itemVal =
            '${result.province}, ${result.city}, ${result.district}';

        return ListTile(
          title: Text(itemVal),
          // selected: selectIndex == index,
          onTap: () {
            setState(() {
              selectIndex = index;
              updateSearchController(itemVal);
            });
          },
        );
      },
    );
  }

  void updateSearchController(String val) {
    searchController.value = TextEditingValue(
      text: val,
      selection: TextSelection.fromPosition(
        TextPosition(
          affinity: TextAffinity.downstream,
          offset: val.length,
        ),
      ),
    );
  }
}

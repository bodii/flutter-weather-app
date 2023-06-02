import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realm/realm.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/db/areas/area.dart';
import 'package:weather_app/model/city_station_dis_data.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchController;
  late Realm areaRealm;

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
    searchController.addListener(() {});

    final config = Configuration.local(
      [
        AreaRealm.schema,
        CityListRealm.schema,
        DisListRealm.schema,
      ],
      // path: './assets/realm/area.realm',
    );
    areaRealm = Realm(config);
  }

  @override
  void dispose() {
    searchController.dispose();
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
                  controller: searchController,
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
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: search,
                  onSubmitted: submit,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void search(String provcn) {
    if (provcn.isEmpty) return;

    debugPrint(provcn);

    createOverly();
  }

  void submit(String provcn) async {
    if (provcn.isEmpty) return;

    final cityRes = areaRealm.all<AreaRealm>();
    final tt = cityRes.query("province LIKE '*$provcn*'");

    List<String> ss = [];
    tt.forEach((e) {
      // debugPrint(e.province);
      e.cityList.forEach((c) {
        c.disList.forEach((d) {
          ss.add(d.district);
        });
      });
    });

    debugPrint(ss.join(','));
  }

  void createOverly() {
    OverlayEntry overlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 230,
          top: 220,
          left: 50,
          child: CompositedTransformFollower(
            offset: const Offset(5, 31),
            link: LayerLink(),
            child: Material(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 180),
                color: Colors.amber.shade100,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(title: Text('上海'));
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
    final over = Overlay.of(context);
    over.insert(overlay);
  }
}

import 'package:demo_catalog_app/models/img.dart';
import 'package:demo_catalog_app/models/locations.dart';
import 'package:demo_catalog_app/models/tab_titles.dart';
import 'package:demo_catalog_app/modules/Product/controllers/group_controller.dart';
import 'package:demo_catalog_app/modules/Product/controllers/groups_controller.dart';
import 'package:demo_catalog_app/modules/Product/controllers/product_controller.dart';
import 'package:demo_catalog_app/modules/Tabs/controllers/tabs_controller.dart';
import 'package:demo_catalog_app/utils/providers/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestWidget extends ConsumerStatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends ConsumerState<TestWidget> {
  bool chaloTest = true;
  @override
  Widget build(BuildContext context) {
    Locations.locations = [
      "Gujarat",
      "Maharashtra",
      "Rajasthan",
      "PE",
    ];
    TabTitles.tabTitles = [
      "Seasonal Scheme",
      "Price List",
      "Product Offer",
      "Others"
    ];
    var locationIndex = ref.watch(locationIndexProvider.state);
    var tabIndex = ref.watch(tabIndexProvider.state);
    locationIndex.state = 1;
    tabIndex.state = 1;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  TabsController(reader: ref.read).add(index: 0);
                },
                child: Container(
                  child: Text("GetData"),
                ),
              ),
              InkWell(
                onTap: () {
                  TabsController(reader: ref.read).add(index: 0);
                },
                child: Container(
                  child: Text("Add Tab"),
                ),
              ),
              InkWell(
                onTap: () {
                  TabsController(reader: ref.read).delete(index: 0);
                },
                child: Container(
                  child: Text("Delete Tab"),
                ),
              ),
              InkWell(
                onTap: () {
                  TabsController(reader: ref.read)
                      .reorder(oldIndex: 1, newIndex: 4);
                },
                child: Container(
                  child: Text("Reorder Tab"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
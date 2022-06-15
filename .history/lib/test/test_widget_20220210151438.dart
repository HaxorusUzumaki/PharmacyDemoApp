import 'package:demo_catalog_app/models/locations.dart';
import 'package:demo_catalog_app/models/tab_titles.dart';
import 'package:demo_catalog_app/modules/Product/controllers/group_controller.dart';
import 'package:demo_catalog_app/modules/Tabs/controllers/folder_controller.dart';
import 'package:demo_catalog_app/modules/Tabs/controllers/location_folders_controller.dart';
import 'package:demo_catalog_app/modules/Tabs/controllers/tabs_controller.dart';
import 'package:demo_catalog_app/modules/Tabs/controllers/tab_controller.dart';
import 'package:demo_catalog_app/modules/Tabs/providers/tab_providers.dart';
import 'package:demo_catalog_app/utils/providers/top_level_providers.dart';
import 'package:flutter/material.dart' hide Tab, TabController;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestWidget extends ConsumerStatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends ConsumerState<TestWidget> {
  @override
  void initState() {
    super.initState();
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
  }

  bool chaloTest = true;
  @override
  Widget build(BuildContext context) {
    final locationIndex = ref.watch(locationIndexProvider.state);
    final tabIndex = ref.watch(tabTitleIndexProvider.state);
    Future.delayed(Duration.zero, () {
      locationIndex.state = 0;
      tabIndex.state = 3;
    });
    final asyncTabs = ref.watch(tabsStreamProvider);
    Future.delayed(Duration.zero, () {
      asyncTabs.when(
        data: (data) {
          final tabState = ref.read(tabsProvider.state);
          tabState.state = data;
        },
        error: (e, st) => print("Error $e"),
        loading: () => {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 InkWell(
                onTap: () {
                  GroupController(reader: ref.read).add(index: 0);
                },
                child: Container(
                  child: Text("Add Group"),
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
              ),
              InkWell(
                onTap: () {
                  TabController(index: 0, reader: ref.read).rename("taby-kun");
                },
                child: Container(
                  child: Text("Rename Tab"),
                ),
              ),
              InkWell(
                onTap: () {
                  LocationFoldersController(reader: ref.read, tabIndex: 0)
                      .addFolder(0);
                },
                child: Container(
                  child: Text("Add Folder"),
                ),
              ),
              InkWell(
                onTap: () {
                  LocationFoldersController(reader: ref.read, tabIndex: 0)
                      .deleteFolder(0);
                },
                child: Container(
                  child: Text("Delete Folder"),
                ),
              ),
              InkWell(
                onTap: () {
                  LocationFoldersController(reader: ref.read, tabIndex: 0)
                      .reorderFolder(1, 4);
                },
                child: Container(
                  child: Text("Reorder Folder"),
                ),
              ),
              InkWell(
                onTap: () {
                  FolderController(
                          reader: ref.read, tabIndex: 0, folderIndex: 0)
                      .rename("dudu folder");
                },
                child: Container(
                  child: Text("Rename Folder"),
                ),
              ),
              InkWell(
                onTap: () {
                  FolderController(
                          reader: ref.read, tabIndex: 0, folderIndex: 0)
                      .addImage(0);
                },
                child: Container(
                  child: Text("Add image"),
                ),
              ),
              InkWell(
                onTap: () {
                  FolderController(
                          reader: ref.read, tabIndex: 0, folderIndex: 0)
                      .deleteImage(0);
                },
                child: Container(
                  child: Text("Delete image"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

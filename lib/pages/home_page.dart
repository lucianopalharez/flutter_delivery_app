import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_current_location.dart';
import 'package:flutter_food/components/my_description_box.dart';
import 'package:flutter_food/components/my_drawer.dart';
import 'package:flutter_food/components/my_sliver_app_bar.dart';
import 'package:flutter_food/components/my_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                const MyCurrentLocation(),

                const MyDescriptionBox(),


              ],
            ), 
            
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Text('Hello'),
            Text('Flutter'),
            Text('code')
          ]
        )
      )
    );
  }
}
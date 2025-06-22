import 'package:flutter/material.dart';
import 'package:news_app_c14_online_sun/core/routes_manager.dart';
import 'package:news_app_c14_online_sun/presentation/home/home_drawer/home_drawer.dart';
import 'package:news_app_c14_online_sun/providers/home_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget
{
  const Home({super.key});

  @override
  Widget build(BuildContext context)
  {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, RoutesManager.search);
        }, icon: Icon(Icons.search))],
        title: Text(homeProvider.title),
      ),
      drawer: HomeDrawer(),
      body: homeProvider.homeView
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/widgets/ContentsHome.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/widgets/GridViewinHome.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/widgets/RowAppbar.dart';
import 'package:flutter_project/Features/Home/Presentation/Views/widgets/RowCategories.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 5, left: 13, right: 13),
                  child: Column(
                    children: [
                      //Text(state.getproducts.data.products[0].name.toString()),
                      RowAppBar(),
                      SizedBox(height: 10),
                      ContentsHome(),
                      SizedBox(height: 25),
                      Rowcategories(),
                      SizedBox(height: 20,),
                      GridViewInHome()
                    ],
                  ),
                ),
              ),
            );
          } 
        } 
   
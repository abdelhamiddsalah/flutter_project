import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Features/Home/Presentation/Views_model/HomeCubit/home_cubit_cubit.dart';

class GridViewInHome extends StatelessWidget {
  const GridViewInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeCubitLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeCubitSuccess) {
          if (state.getproducts.data.products.isEmpty) {
            return Center(child: Text('No products found'));
          }
          return Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 13,
                  ),
                  itemBuilder: (_, index) => Column(
                    children: [
                     Image.network(state.getproducts.data.products[index].image.toString(), width: 120,height: 130,),
                     SizedBox(height: 10,),
                      Text(state.getproducts.data.products[index].name, maxLines: 2,),
                      SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('price:'),
                        Text('\$${state.getproducts.data.products[index].price.toString()}',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    )
                    ],
                  ),
                  itemCount: state.getproducts.data.products.length,
                ),
            ),
            
          );
        } else if (state is HomeCubitFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Container();
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/theme/colors.dart';

import 'category_detail_viewmodel.dart';

class CategoryDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteData routeData = RouteData.of(context);

    return ViewModelBuilder<CategoryDetailViewModel>.reactive(
      viewModelBuilder: () => CategoryDetailViewModel(
        categoryId: routeData.pathParams['categoryId'].intValue,
      ),
      builder: (
        BuildContext context,
        CategoryDetailViewModel model,
        Widget child,
      ) {
        double height = MediaQuery.of(context).size.height;

        return SafeArea(
          child: Scaffold(
            body: Hero(
              tag: model.heroTag,
              child: model.isBusy
                  ? Text('Loading...')
                  : categoryDetailViewStack(model: model, height: height),
            ),
          ),
        );
      },
    );
  }

  Widget categoryDetailViewStack(
      {@required CategoryDetailViewModel model, @required double height}) {
    return Stack(
      children: [
        Container(
          height: height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(model.data.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              model.data.title,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  model.data.farmers + ' are selling ' + model.data.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  // color: Colors.blue,
                  height: height * 0.50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: model.farmers.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      Farmer farmer = model.farmers[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(farmer.image),
                          radius: 30,
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              farmer.fullName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: getColor(
                                    type: ColorType.primary,
                                  ),
                                  size: 16,
                                ),
                                SizedBox(width: 2),
                                Text(farmer.rating.toString()),
                                SizedBox(width: 5),
                                Text(
                                  '·',
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(width: 5),
                                Text(farmer.ships)
                              ],
                            ),
                          ],
                        ),
                        trailing: Text(
                          'Connect',
                          style: TextStyle(
                            color: getColor(
                              type: ColorType.primary,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'category_detail_viewmodel.dart';

class CategoryDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteData routeData = RouteData.of(context);

    return ViewModelBuilder<CategoryDetailViewModel>.reactive(
      viewModelBuilder: () => CategoryDetailViewModel(
        categoryId: routeData.pathParams['categoryId'].stringValue,
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
              image: NetworkImage(model.data['image']),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              model.data['title'],
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
                  model.data['farmers'] + ' are selling ' + model.data['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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

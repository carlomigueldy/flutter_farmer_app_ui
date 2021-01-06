import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/ui/views/farmer_detail/farmer_detail_viewmodel.dart';

class FarmerDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteData routeData = RouteData.of(context);
    double height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<FarmerDetailViewModel>.reactive(
      viewModelBuilder: () => FarmerDetailViewModel(
        farmerId: routeData.pathParams['farmerId'].intValue,
      ),
      builder: (
        BuildContext context,
        FarmerDetailViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: Scaffold(
            body: Hero(
              tag: model.heroTag,
              child: model.isBusy
                  ? Text('Loading...')
                  : farmerDetailViewStack(
                      model: model,
                      height: height,
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget farmerDetailViewStack(
      {@required FarmerDetailViewModel model, @required double height}) {
    return Stack(
      children: [
        Container(
          height: height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(model.data.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              model.data.fullName,
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
                  model.data.fullName,
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
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

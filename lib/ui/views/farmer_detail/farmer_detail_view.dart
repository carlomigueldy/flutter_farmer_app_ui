import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/theme/colors.dart';
import 'package:stacked_architecture_starter/ui/views/farmer_detail/farmer_detail_viewmodel.dart';

class FarmerDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteData routeData = RouteData.of(context);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

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
                      width: width,
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget farmerDetailViewStack({
    @required FarmerDetailViewModel model,
    @required double height,
    @required double width,
  }) {
    return Stack(
      children: [
        Container(
          height: height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green[100],
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
                SizedBox(height: 115),
                Text(
                  model.data.fullName,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: getColor(
                        type: ColorType.primary,
                      ),
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Text(model.data.rating.toString()),
                    SizedBox(width: 5),
                    Text(
                      '·',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 5),
                    Text('10 ton veg shipped successfully')
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'About his firm and process',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(model.data.description),
                ),
                Container(
                  height: 55,
                  width: width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: MaterialButton(
                    color: Colors.green[50],
                    elevation: 0,
                    child: Text(
                      'Connect with ${model.data.firstName}',
                      style: TextStyle(
                        color: getColor(
                          type: ColorType.primary,
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => model.navigateToChatViewWithFarmer(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.25,
          left: width * 0.25,
          right: width * 0.25,
          child: Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(model.data.image),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green[300],
              radius: 80,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => model.navigateBack(),
                  color: getColor(type: ColorType.primary),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: PopupMenuButton(
                  child: Icon(
                    Icons.more_vert,
                    color: getColor(type: ColorType.primary),
                  ),
                  onSelected: (String value) =>
                      model.onSelectPopupMenuItem(value),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'write_feedback',
                      child: Row(
                        children: [
                          Icon(Icons.rate_review_outlined),
                          SizedBox(width: 10),
                          Text('Write Feedback'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'report',
                      child: Row(
                        children: [
                          Icon(Icons.report),
                          SizedBox(width: 10),
                          Text('Report'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

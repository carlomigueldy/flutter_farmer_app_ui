import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../theme/colors.dart';
import 'farmer_customer_feedback_viewmodel.dart';

class FarmerCustomerFeedbackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteData routeData = RouteData.of(context);

    return ViewModelBuilder<FarmerCustomerFeedbackViewModel>.reactive(
      viewModelBuilder: () => FarmerCustomerFeedbackViewModel(
        farmerId: routeData.pathParams['farmerId'].intValue,
      ),
      builder: (
        BuildContext context,
        FarmerCustomerFeedbackViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: model.isBusy
                  ? Text('Loading...')
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(model.data.image),
                        ),
                        SizedBox(width: 10),
                        Text(
                          model.data.fullName,
                          style: TextStyle(
                            color: getColor(type: ColorType.primary),
                          ),
                        ),
                      ],
                    ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => null,
                ),
              ],
              elevation: 0,
              // backgroundColor: Colors.grey[50],
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: getColor(type: ColorType.primary),
              ),
            ),
            body: Center(
              child: Text(
                'FarmerCustomerFeedbackView',
              ),
            ),
          ),
        );
      },
    );
  }
}

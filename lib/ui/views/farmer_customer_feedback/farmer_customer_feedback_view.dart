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
                        Flexible(
                          child: Text(
                            'Write feedback for ' + model.data.fullName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: getColor(type: ColorType.primary),
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: getColor(type: ColorType.primary),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            SectionHeader(
                              title: 'Product Quality',
                              icon: Icons.high_quality,
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 300,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://cdn.shopify.com/s/files/1/0288/4747/2700/products/BabyPotatoes_1589x.jpg?v=1591947479'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            boxShadow: []),
                                      ),
                                      Text('Potato'),
                                    ],
                                  ),
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        hintText:
                                            'What did you like or dislike specifically about this product? Share your experience with others!',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        hintMaxLines: 4,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SectionHeader(
                        title: 'Shipping and Handling',
                        icon: Icons.delivery_dining,
                      ),
                      SectionHeader(
                        title: 'Farmer Overall Feedback',
                        icon: Icons.baby_changing_station,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[700],
          size: 20,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

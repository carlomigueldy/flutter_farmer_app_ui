import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/theme/box_shadow.dart';

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
                        child: productQualitySection(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 15,
                        ),
                        child: shippingAndHandlingSection(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 15,
                        ),
                        child: farmerOverallFeedbackSection(),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () => model.onSubmitFeedback(),
                      color: Colors.green,
                      child: Text('Submit Feedback'),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Column farmerOverallFeedbackSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Farmer Overall Feedback',
          icon: Icons.wb_sunny,
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Rating5Stars(),
        ),
      ],
    );
  }

  Column shippingAndHandlingSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Shipping and Handling',
          icon: Icons.delivery_dining,
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Rating5Stars(),
        ),
      ],
    );
  }

  Column productQualitySection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Product Quality',
          icon: Icons.high_quality,
        ),
        SizedBox(height: 10),
        Container(
          height: 440,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0288/4747/2700/products/BabyPotatoes_1589x.jpg?v=1591947479'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        kBoxShadowPrimary,
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Potato',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Amount: 10 kgs'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Rating5Stars(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 5),
                          Text('Upload Photo'),
                        ],
                      ),
                      onPressed: () => null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.video_call_outlined),
                          SizedBox(width: 5),
                          Text('Upload Video'),
                        ],
                      ),
                      onPressed: () => null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText:
                        'What did you like or dislike specifically about this product? Share your experience with others!',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    hintMaxLines: 4,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool value) => value),
                  Text('As anonymous')
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Rating5Stars extends StatelessWidget {
  const Rating5Stars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[700],
          size: 40,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[700],
          size: 40,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[700],
          size: 40,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[700],
          size: 40,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[700],
          size: 40,
        ),
      ],
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

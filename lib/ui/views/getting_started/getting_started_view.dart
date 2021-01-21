import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'getting_started_viewmodel.dart';

class GettingStartedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<GettingStartedViewModel>.nonReactive(
      viewModelBuilder: () => GettingStartedViewModel(),
      builder: (
        BuildContext context,
        GettingStartedViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green[50],
                      Colors.green[50],
                      Colors.green[50],
                      Colors.green[50],
                      Colors.green[50],
                      Colors.green[50],
                      Colors.green[50],
                      Colors.green[50],
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ]),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Howdy!',
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Get connected with real farmers and cut down third party cost',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 50),
                    child: SvgPicture.asset(
                      'assets/svg/farm_girl.svg',
                      height: 300,
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 60,
                      child: Center(
                        child: ListTile(
                          onTap: () => model.navigateToHomeView(),
                          title: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green[50],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_right_alt,
                                size: 34,
                              ),
                              onPressed: () => model.navigateToHomeView(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 10),
                      Text(
                        'How it works',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

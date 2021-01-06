import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart' show HomeViewModel;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                deliveryAddressSection(),
                SizedBox(height: 30),
                searchBar(),
                SizedBox(
                  height: 30,
                ),
                ...popularCategories()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row searchBar() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 45),
          child: Text(
            'Search',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget deliveryAddressSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.location_on,
              color: Colors.green,
              size: 40,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '221B Baker Street',
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> popularCategories() {
    List<Map<String, dynamic>> categories = [
      {
        'title': 'Milk',
        'farmers': '27 Farmers',
        'image':
            'https://images.pexels.com/photos/248412/pexels-photo-248412.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      },
      {
        'title': 'Cauliflower',
        'farmers': '14 Farmers',
        'image':
            'https://images.pexels.com/photos/6316515/pexels-photo-6316515.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      },
      {
        'title': 'Carrot',
        'farmers': '10 Farmers',
        'image':
            'https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      },
      {
        'title': 'Potato',
        'farmers': '10 Farmers',
        'image':
            'https://images.pexels.com/photos/2286776/pexels-photo-2286776.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      },
      {
        'title': 'Papayas',
        'farmers': '10 Farmers',
        'image':
            'https://images.pexels.com/photos/286948/pexels-photo-286948.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      },
      {
        'title': 'Banana',
        'farmers': '10 Farmers',
        'image':
            'https://images.pexels.com/photos/2238309/pexels-photo-2238309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      },
    ];

    return [
      Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            bool isFirst = index == 0;
            bool isLast = index == categories.length - 1;
            var category = categories[index];
            return Container(
              margin: isFirst
                  ? const EdgeInsets.only(left: 10)
                  : isLast
                      ? const EdgeInsets.only(right: 10)
                      : null,
              child: AppCategory(
                title: category['title'],
                image: category['image'],
                farmers: category['farmer'],
              ),
            );
          },
        ),
      ),
    ];
  }
}

class AppCategory extends StatelessWidget {
  final String title;

  final String farmers;

  final String image;

  const AppCategory({
    Key key,
    @required this.title,
    this.farmers,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      height: 180,
      width: 120,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              image,
            ),
          ),
          Text(title),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(3, 2),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/theme/colors.dart';

import 'home_viewmodel.dart' show HomeViewModel;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: getColor(type: ColorType.primary),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: getColor(type: ColorType.primary),
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.contacts,
                  color: getColor(type: ColorType.primary),
                ),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: getColor(type: ColorType.primary),
                ),
                label: 'Account',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                deliveryAddressSection(),
                SizedBox(height: 15),
                searchBar(),
                SizedBox(
                  height: 30,
                ),
                ...popularCategoriesSection(categories: model.categories),
                ...monthlyBestSellersSection(
                  monthlyBestSellers: model.monthlyBestSellers,
                )
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

  List<Widget> popularCategoriesSection({
    @required List<Map<String, dynamic>> categories,
  }) {
    return [
      AppHomeListHeader(
        title: 'Popular Categories',
      ),
      if (categories != null)
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
                child: AppCategoryListItem(
                  title: category['title'],
                  image: category['image'],
                  farmers: category['farmers'],
                ),
              );
            },
          ),
        ),
    ];
  }

  List<Widget> monthlyBestSellersSection({
    @required List<Map<String, dynamic>> monthlyBestSellers,
  }) {
    return [
      AppHomeListHeader(
        title: 'Monthly Best Sellers',
      ),
      if (monthlyBestSellers != null)
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: monthlyBestSellers.length,
            itemBuilder: (context, index) {
              bool isFirst = index == 0;
              bool isLast = index == monthlyBestSellers.length - 1;
              var bestSeller = monthlyBestSellers[index];
              return Container(
                margin: isFirst
                    ? const EdgeInsets.only(left: 10)
                    : isLast
                        ? const EdgeInsets.only(right: 10)
                        : null,
                child: AppMonthlyBestSellerItem(
                  fullName: bestSeller['full_name'],
                  image: bestSeller['image'],
                  ships: bestSeller['ships'],
                  rating: bestSeller['rating'],
                ),
              );
            },
          ),
        ),
    ];
  }
}

class AppHomeListHeader extends StatelessWidget {
  final String title;

  const AppHomeListHeader({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
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
    );
  }
}

class AppCategoryListItem extends StatelessWidget {
  final String title;

  final String farmers;

  final String image;

  const AppCategoryListItem({
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            farmers,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
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

class AppMonthlyBestSellerItem extends StatelessWidget {
  final String fullName;

  final String ships;

  final double rating;

  final String image;

  const AppMonthlyBestSellerItem({
    Key key,
    @required this.fullName,
    this.rating,
    this.ships,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 175;
    double width = 175;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ships, style: TextStyle(color: Colors.white)),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: getColor(type: ColorType.primary),
                  ),
                  SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
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

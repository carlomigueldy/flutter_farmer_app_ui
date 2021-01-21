import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/models/food_crop.dart';
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
                icon: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(
                      'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f47d4de7637290765bce495%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1398%26cropX2%3D3908%26cropY1%3D594%26cropY2%3D3102'),
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
                ...popularCategoriesSection(
                  model: model,
                  foodCrops: model.categories,
                ),
                ...monthlyBestSellersSection(
                  model: model,
                  farmers: model.farmers,
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
    @required HomeViewModel model,
    @required List<FoodCrop> foodCrops,
  }) {
    return [
      AppHomeListHeader(
        title: 'Popular Categories',
      ),
      if (foodCrops != null)
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodCrops.length,
            itemBuilder: (context, index) {
              bool isFirst = index == 0;
              bool isLast = index == foodCrops.length - 1;
              var category = foodCrops[index];
              return Container(
                margin: isFirst
                    ? const EdgeInsets.only(left: 10)
                    : isLast
                        ? const EdgeInsets.only(right: 10)
                        : null,
                child: AppCategoryListItem(
                  model: model,
                  category: category,
                  index: index,
                ),
              );
            },
          ),
        ),
    ];
  }

  List<Widget> monthlyBestSellersSection({
    @required HomeViewModel model,
    @required List<Farmer> farmers,
  }) {
    return [
      AppHomeListHeader(
        title: 'Monthly Best Sellers',
        withViewAll: false,
      ),
      if (farmers != null)
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: farmers.length,
            itemBuilder: (context, index) {
              bool isFirst = index == 0;
              bool isLast = index == farmers.length - 1;
              Farmer farmer = farmers[index];
              return Container(
                margin: isFirst
                    ? const EdgeInsets.only(left: 10)
                    : isLast
                        ? const EdgeInsets.only(right: 10)
                        : null,
                child: AppFarmerListItem(
                  farmer: farmer,
                  model: model,
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
  final bool withViewAll;

  const AppHomeListHeader({
    Key key,
    @required this.title,
    this.withViewAll: true,
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
          if (withViewAll)
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
  final HomeViewModel model;

  final FoodCrop category;

  final int index;

  const AppCategoryListItem({
    Key key,
    @required this.model,
    @required this.category,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'category-' + category.id.toString(),
      child: GestureDetector(
        onTap: () =>
            model.navigateToCategoryDetailView(categoryId: category.id),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          height: double.infinity,
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                category.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                category.farmers,
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
              image: NetworkImage(category.image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0),
                BlendMode.darken,
              ),
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
        ),
      ),
    );
  }
}

class AppFarmerListItem extends StatelessWidget {
  final Farmer farmer;
  final HomeViewModel model;

  const AppFarmerListItem({
    Key key,
    @required this.farmer,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 175;

    return Hero(
      tag: 'farmer-' + farmer.id.toString(),
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () => model.navigateToFarmerDetailView(
            farmerId: farmer.id,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: double.infinity,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(farmer.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0),
                  BlendMode.darken,
                ),
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
            child: Stack(
              children: [
                if (farmer.isPesticideFreeFarm == null)
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(15),
                        //   bottomRight: Radius.circular(15),
                        // ),
                      ),
                      child: Icon(
                        Icons.eco_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        farmer.fullName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(farmer.ships,
                            style: TextStyle(color: Colors.white)),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: getColor(type: ColorType.primary),
                            ),
                            SizedBox(width: 5),
                            Text(
                              farmer.rating.toString(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

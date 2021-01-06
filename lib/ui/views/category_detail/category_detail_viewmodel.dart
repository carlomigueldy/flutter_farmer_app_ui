import 'package:auto_route/auto_route.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/services/api/category_service.dart';

class CategoryDetailViewModel extends FutureViewModel<Map<String, dynamic>> {
  final CategoryService _categoryService = locator<CategoryService>();

  final String categoryId;

  CategoryDetailViewModel({
    @required this.categoryId,
  });

  String get heroTag => data != null ? 'category-' + data['title'] : 'hero-tag';

  @override
  Future<Map<String, dynamic>> futureToRun() async {
    var category = await _categoryService.findById(categoryId: categoryId);

    // print('(categoryDetailViewModel) heroTag: category-' + category['title']);

    return category;
  }
}

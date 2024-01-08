class CarouselImagesModel {
  final String image;
  final String link;
  final String category;

  CarouselImagesModel(
      {required this.image, required this.link, required this.category});
}

class TopCategoriesModel {
  final String catEnglish;
  final String catSpanish;
  final String titleEnglish;
  final String titleSpanish;

  TopCategoriesModel(
      {required this.titleSpanish,
      required this.titleEnglish,
      required this.catEnglish,
      required this.catSpanish});
}

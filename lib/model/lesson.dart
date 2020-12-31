class Lesson {

  final String title;
  final String subTitle;
  final String image;
  bool isBookmarked;
  final int completedStages;
  
  Lesson({
    this.title,
    this.subTitle,
    this.image,
    this.isBookmarked,
    this.completedStages,
  }) : assert(completedStages <= 3, 'Completed stages can not be greater than 3');

}

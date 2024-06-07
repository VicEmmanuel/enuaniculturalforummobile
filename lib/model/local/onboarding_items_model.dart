import 'package:enuaniculturalforummobile/config/app_images.dart';

class OnBoardingItemModel {
  String title;
  String subTitle;
  String image;

  OnBoardingItemModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<OnBoardingItemModel> onboardingItemModel = [
  OnBoardingItemModel(
    title: "Pay bills easily.\nAnytime. Anywhere.",
    image: AppImages.onboardingOne,
    subTitle: 'Instant payment of bills wherever you are',
  ),
  OnBoardingItemModel(
    title: "Always have access to\nUSSD codes.",
    image: AppImages.onboardingTwo,
    subTitle: 'No need to memorize them, just use BunchPay',
  ),
];

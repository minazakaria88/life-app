import 'package:life/generated/assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel(
      {required this.image, required this.title, required this.description});
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: Assets.sliderImage1,
    title: 'Welcome to Life – Your Care, Our Priority',
    description:
        'Life brings professional nursing care directly to your doorstep. Whether it’s for recovery, health management, or routine check-ups, we ensure that every patient receives the care they deserve, in the comfort of their own home',
  ),
  OnBoardingModel(
    image: Assets.sliderImage2,
    title: 'Simple & Easy Process',
    description:
        'Booking a nurse is just a few clicks away. Choose your service, select the right nurse for your needs, and schedule a convenient time. We take care of the rest to ensure you or your loved ones get the best possible care, wherever you ar',
  ),
  OnBoardingModel(
    image: Assets.sliderImage3,
    title: 'Compassionate & Professional Care',
    description:
        'Our team of certified nurses is dedicated to providing personalized, compassionate care that fits your unique needs. Trust Life to provide high-quality, in-home healthcare with a focus on safety, comfort, and reliability',
  )
];

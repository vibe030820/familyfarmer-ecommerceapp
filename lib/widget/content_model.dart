class OnboardingContent {
  String image;
  String title;
  String description;
  OnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      description:
          "Discover the best organic products for your farm and garden. Let's grow naturally!",
      image: "images/logo.png",
      title: 'Lets cultivate Success Organically!'),
  OnboardingContent(
      description: "We deliver to Your Doorstep",
      image: "images/screen3.png",
      title: 'Hastle free Return Options'),
  OnboardingContent(
      description:
          "Select from our varoius Categories\n   Unique Products with High Quality",
      image: "images/screen2.png",
      title: 'Browse our Products')
];

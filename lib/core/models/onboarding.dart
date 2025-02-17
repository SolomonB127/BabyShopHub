class OnboardingItem {
  final String title;
  final String description;
  final String imageAsset;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  static const List<OnboardingItem> items = [
    OnboardingItem(
      title: 'Welcome to BabyShopHub',
      description: 'Your one-stop shop for all baby essentials. Browse through our wide selection of quality products.',
      imageAsset: '../../../assets/images/shopping.png',
    ),
    OnboardingItem(
      title: 'Easy Shopping Experience',
      description: 'Add items to cart, manage quantities, and checkout securely with multiple payment options.',
      imageAsset: '../../../assets/images/shopping.png',
    ),
    OnboardingItem(
      title: 'Track Your Orders',
      description: 'Stay updated with real-time order tracking and get notifications about your delivery status.',
      imageAsset: '../../../assets/images/tracking.png',
    ),
  ];
} 
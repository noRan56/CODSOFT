import 'package:tracker/presentation/Widgets/onboardingInfo.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      logo: "assets/icon/logo.png",
      image: "assets/img/expenseTracker.png",
      title: "Welcome to Expense Tracker",
      descriptions:
          "Welcome to Expense Tracker! Take control of your finances and achieve your financial goals with ease.",
    ),
    OnboardingInfo(
        logo: "assets/icon/logo.png",
        image: "assets/img/expense.png",
        title: " Track Your Expenses",
        descriptions:
            "Easily log your daily expenses and keep track of where your money goes. Stay informed about your spending habits."),
    OnboardingInfo(
      logo: "assets/icon/logo.png",
      image: "assets/img/income.png",
      title: "Set Budgets and Save Money",
      descriptions:
          "Set monthly budgets and receive alerts when you're close to exceeding them. Save money and plan for the future.",
    )
  ];
}

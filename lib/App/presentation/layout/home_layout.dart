import 'package:ecommerce_app/App/presentation/controller/app_cubit.dart';
import 'package:ecommerce_app/App/presentation/screens/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).shadowColor,
                  ),
                ),
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "ابحث في المنتجات",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: StreamBuilder<InternetConnectionStatus>(
            stream: AppCubit.get(context).getConnectionStatus(),
            initialData: InternetConnectionStatus.connected,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final isConnected =
                    snapshot.data == InternetConnectionStatus.connected;
                if (isConnected) {
                  return appCubit.screens[appCubit.currentIndex];
                } else {
                  return const OfflineScreen();
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  label: Text(
                    "0",
                  ),
                  isLabelVisible: false,
                  child: Icon(Icons.shopping_cart),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Account",
              ),
            ],
            currentIndex: appCubit.currentIndex,
            onTap: (value) {
              appCubit.changeCurrentIndex(value);
            },
            selectedIconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            selectedItemColor: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}

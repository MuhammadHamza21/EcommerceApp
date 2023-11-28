// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/store/presentation/components/title_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:ecommerce_app/Core/utils/enums.dart';
import 'package:ecommerce_app/store/presentation/components/product_widget.dart';
import 'package:ecommerce_app/store/presentation/controller/store_cubit.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        final storeCubit = StoreCubit.get(context);
        if (storeCubit.featuredProducts.isEmpty) {
          StoreCubit.get(context).getFeaturedProducts();
        }
        if (storeCubit.popularProducts.isEmpty) {
          StoreCubit.get(context).getPopularProducts();
        }
        return;
      },
      [],
    );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          final storeCubit = StoreCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (state.gettingFeaturedProductsState ==
                        RequestState.loading ||
                    state.gettingFeaturedProductsState == RequestState.loaded &&
                        storeCubit.featuredProducts.isNotEmpty)
                  TitleRowWidget(
                    title: "Featured",
                    onSeeAllPressed: () {},
                  ),
                if (state.gettingFeaturedProductsState == RequestState.loading)
                  const Center(child: CircularProgressIndicator()),
                if (state.gettingFeaturedProductsState == RequestState.error ||
                    state.gettingFeaturedProductsState ==
                            RequestState.offline &&
                        state.gettingPopularProductsState ==
                            RequestState.error ||
                    state.gettingPopularProductsState == RequestState.offline)
                  Text(
                    storeCubit.featuredProductsMessage,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (state.gettingFeaturedProductsState == RequestState.loaded &&
                    storeCubit.featuredProducts.isNotEmpty)
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var product = storeCubit.featuredProducts[index];
                        return ProductWidget(product: product);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: storeCubit.featuredProducts.length,
                    ),
                  ),
                if (state.gettingPopularProductsState == RequestState.loading ||
                    state.gettingPopularProductsState == RequestState.loaded &&
                        storeCubit.popularProducts.isNotEmpty)
                  TitleRowWidget(
                    title: "Popular",
                    onSeeAllPressed: () {},
                  ),
                if (state.gettingPopularProductsState == RequestState.loading)
                  const Center(child: CircularProgressIndicator()),
                if (state.gettingPopularProductsState == RequestState.loaded &&
                    storeCubit.popularProducts.isNotEmpty)
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var product = storeCubit.popularProducts[index];
                        return ProductWidget(product: product);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: storeCubit.popularProducts.length,
                    ),
                  ),
                if (state.gettingFeaturedProductsState == RequestState.loaded &&
                    state.gettingPopularProductsState == RequestState.loaded &&
                    storeCubit.featuredProducts.isEmpty &&
                    storeCubit.popularProducts.isEmpty)
                  const Text(
                    "لا يوجد منتجات في الوقت الحالي",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}

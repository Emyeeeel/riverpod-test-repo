

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../provider/api_providers.dart';
import '../../provider/ui_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosAsyncValue = ref.watch(unsplashPhotosProvider);
    return Scaffold(
        body: photosAsyncValue.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          data: (photos) {
            return MasonryGridView.builder(
              itemCount: photos.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ),
              itemBuilder: (context,index) => Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          photos[index]['urls']['regular'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () async {
                          final uiService = ref.watch(uiServiceProvider); 
                          uiService.displayDetails(context, photos[index]['user']['username']);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: List.generate(3, (index) => Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ), 
            );
          },
        ),
      );
  }
}


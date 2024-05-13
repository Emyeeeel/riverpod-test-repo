

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'provider/ui_providers.dart';
import 'test_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unsplashPhotosAsyncValue = ref.watch(unsplashPhotosProvider);
    return Scaffold(
      body: unsplashPhotosAsyncValue.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          data: (photos) {
            return MasonryGridView.builder(
              itemCount: photos.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ),
              itemBuilder: (context,index) {
                final photo = photos[index];
                return Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          photo.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () async {
                          final uiService = ref.watch(uiServiceProvider); 
                          uiService.displayDetails(context, photo.photographerUsername);
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
              );
              } 
            );
          },
        )
    );
  }
}
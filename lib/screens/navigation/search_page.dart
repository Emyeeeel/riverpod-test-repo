
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../provider/api_providers.dart';
import '../../provider/ui_providers.dart';


class SearchPage extends ConsumerWidget {
  SearchPage({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = _textController.text;
    final provider = query.isEmpty ? unsplashPhotosProvider : searchPhotoProvider(_textController.text);
    final photosAsyncValue = ref.watch(provider); 
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, 
          centerTitle: true,
          title: Container(
            width: MediaQuery.of(context).size.width-100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2, color: const Color(0xFF000000))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, size: 25,),
                  hintText: 'Search Pinterest',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
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
      ),
    );
  }
}
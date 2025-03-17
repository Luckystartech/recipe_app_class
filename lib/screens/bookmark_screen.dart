import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/bookmark_provider.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookMark = ref.watch(bookMarkProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookMark'),
        ),
        body: bookMark.isEmpty
            ? const Center(
                child: Text('Bookmark is empty'),
              )
            : ListView.builder(
                itemCount: bookMark.length,
                itemBuilder: (context, index) {
                  final recipe = bookMark[index];
                  return ListTile(
                    title: Text(recipe.name),
                    trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(bookMarkProvider.notifier)
                              .deleteFromBookMark(recipe);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                }));
  }
}

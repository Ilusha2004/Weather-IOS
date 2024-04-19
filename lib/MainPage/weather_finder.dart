import 'package:flutter/material.dart';
import 'package:weather_ios/System/container/shared_prefernces.dart';
import 'package:weather_ios/System/weather_parser/remote_source.dart';
import 'package:weather_ios/System/weather_parser/repository.dart';

class WeatherSearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  List<String> history = [];
  List<String> findedItems = [];

  final WeatherRepositoryForPrefWay _history = WeatherRepositoryForPrefWay(
  remoteSource: RemoteSource(MySharedPreferences()),
  mySharedPreferences: MySharedPreferences());

  SearchController controller = SearchController();

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: controller,
      viewHintText: "Search...",
      viewTrailing: [
        IconButton(
          onPressed: () {
            history.add(controller.text);
            controller.closeView(controller.text);
          },
          icon: const Icon(Icons.search)
        ),
        IconButton(
          onPressed: () {
            controller.clear();
          },
          icon: const Icon(Icons.clear),
        )
      ],
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: "Search a new location",
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          controller: controller,

          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 25.0)),
            onTap: () {
              _searchItem(controller.text);
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return List.generate(findedItems.isNotEmpty ? findedItems.length : history.length, (int index) {
            final String item = findedItems.isNotEmpty ? findedItems[index] : history[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                history.remove(item); // Удаляем элемент из списка результатов
              },
              child: ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
                trailing: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      history.remove(item);
                    });
                  },
                ),
              ),
            );
          });
        }
    );
  }

  void _searchItem(String query) {
    if (query.isEmpty) {
      setState(() {
        findedItems = history;
      });
    }
    else {
      setState(() {
        findedItems = history.where((element) => element.contains(query.toLowerCase())).toList();
      });
      print(findedItems);
    }
  }
}

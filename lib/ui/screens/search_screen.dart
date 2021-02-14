import 'package:flutter/material.dart';
import 'package:minibieb/core/models/google_volume.dart';
import 'package:stacked/stacked.dart';
import 'package:pagination/pagination.dart';
import '../../core/viewmodels/search_screen_model.dart';
import '../theming/paddings.dart';
import '../widgets/drawer.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchScreenModel>.reactive(
      viewModelBuilder: () => SearchScreenModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Zoek een boek'),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Paddings.screenPadding),
            child: model.volumes != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Zoekresultaten',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                          'Er zijn ${model.totalSearchResultCount} boeken gevonden'),
                      Expanded(
                        child: PaginationList<GoogleVolume>(
                          shrinkWrap: true,
                          separatorWidget: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          itemBuilder: (context, GoogleVolume item) {
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              leading: Image.network(
                                model.getImage(
                                  ImageSize.Large,
                                  item,
                                ),
                                fit: BoxFit.contain,
                                width: 100,
                                height: 200,
                              ),
                              title: Text(item.title),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.authors.join(', '),
                                  ),
                                  Text(item.subtitle ?? ''),
                                ],
                              ),
                            );
                          },
                          initialData: model.volumes,
                          pageFetch: model.fetchNext,
                          onEmpty: Center(
                            child: Text('Geen resultaten meer'),
                          ),
                          onError: (dynamic err) => Center(
                            child: Text('Er ging iets mis: ${err.toString()}'),
                          ),
                        ),

                        /* 
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.volumes.length,
                          itemBuilder: (context, idx) => ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            leading: Image.network(
                              model.getImage(
                                ImageSize.Large,
                                model.volumes[idx],
                              ),
                              fit: BoxFit.contain,
                              width: 100,
                              height: 200,
                            ),
                            title: Text(model.volumes[idx].title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.volumes[idx].authors.join(', '),
                                ),
                                Text(model.volumes[idx].subtitle ?? ''),
                              ],
                            ),
                          ),
                        ), */
                      ),
                    ],
                  )
                : model.isWorking
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Titel'),
                                  onChanged: (val) => model.title = val,
                                ),
                                SizedBox(
                                  height: Paddings.dividerHeight,
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Auteur'),
                                  onChanged: (val) => model.author = val,
                                ),
                                SizedBox(
                                  height: Paddings.dividerHeight,
                                ),
                                ElevatedButton(
                                  child: Text('Zoeken'),
                                  onPressed: () => {model.startSearch()},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}

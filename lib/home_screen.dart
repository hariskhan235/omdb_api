import 'package:flutter/material.dart';
import 'package:omdb_api_flutter/services/omdb_api_service.dart';
import 'package:omdb_api_flutter/widgets/resuable_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchMovieController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    OmdbApiService service = OmdbApiService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1,
        title: Expanded(
          flex: 1,
          child: TextField(
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            enabled: true,
            cursorColor: Colors.white,
            textCapitalization: TextCapitalization.none,
            showCursor: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            autofocus: false,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              setState(() {});
            },
            controller: searchMovieController,
          ),
        ),
      ),
      body: searchMovieController.text.isEmpty
          ? const Center(
              child: Text('Search Movie By Title'),
            )
          : FutureBuilder(
              future: service.getMoviesData(
                searchMovieController.text.toLowerCase(),
              ),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      .067),
                              child: Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06,
                                    ),
                                    ReusableRow(
                                      title: 'Title',
                                      value: snapshot.data['Title'] ??
                                          snapshot.data!['Title'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Year',
                                      value: snapshot.data['Year'] ??
                                          snapshot.data!['Year'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Rated',
                                      value: snapshot.data['Rated'] ??
                                          snapshot.data!['Rated'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Released',
                                      value: snapshot.data['Released'] ??
                                          snapshot.data['Released'].toString(),
                                    ),
                                    ReusableRow(
                                        title: 'Runtime',
                                        value: snapshot.data['Runtime'] ??
                                            snapshot.data['Runtime']
                                                .toString()),
                                    ReusableRow(
                                        title: 'Genre',
                                        value: snapshot.data['Genre'] ??
                                            snapshot.data['Genre'].toString()),
                                    ReusableRow(
                                      title: 'Director',
                                      value: snapshot.data['Director'] ??
                                          snapshot.data['Director'].toString(),
                                    ),
                                    ReusableRow(
                                        title: 'Writer',
                                        value: snapshot.data['Writer'] ??
                                            snapshot.data['Writer'].toString()),
                                    ReusableRow(
                                        title: 'Actors',
                                        value: snapshot.data['Actors'] ??
                                            snapshot.data['Actors'].toString()),
                                    ReusableRow(
                                      title: 'Language',
                                      value: snapshot.data['Language'] ??
                                          snapshot.data['Language'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Country',
                                      value: snapshot.data['Country'] ??
                                          snapshot.data['Country'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Type',
                                      value: snapshot.data['Type'] ??
                                          snapshot.data['Type'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'DVD',
                                      value: snapshot.data?['DVD'].toString() ??
                                          snapshot.data['DVD'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'imdbRating',
                                      value: snapshot.data['imdbRating'] ??
                                          snapshot.data['imdbRating']
                                              .toString(),
                                    ),
                                    ReusableRow(
                                      title: 'Metascore',
                                      value: snapshot.data['Metascore'] ??
                                          snapshot.data['Metascore'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'imdbID',
                                      value: snapshot.data['imdbID'] ??
                                          snapshot.data['imdbID'].toString(),
                                    ),
                                    ReusableRow(
                                      title: 'BoxOffice',
                                      value: snapshot.data['BoxOffice'] ??
                                          snapshot.data['BoxOffice'].toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                snapshot.data['Poster'] ??
                                    snapshot.data['Poster'].toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
    );
  }
}

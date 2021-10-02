# news
An App to display the news articles using apis

## ScreenShots of the App
<p float = "left">
<img src = "https://github.com/HimeshNayak/NewsApp/blob/master/assets/ss2.jpeg" alt="drawing" width="200" />
<img src = "https://github.com/HimeshNayak/NewsApp/blob/master/assets/ss1.jpeg" alt="drawing" width="200" />
  </p>
## Working of the App
Used http package for using http.read() on api: https://hubblesite.org/api/v3/news
```
List<dynamic> newsList = [];
Future<List<dynamic>> getNewsMap() async {
  await http.read(Uri.parse('https://hubblesite.org/api/v3/news'))
    .then((value) {
      newsList = jsonDecode(value);
  });
  return newsList;
}
```

Used FutureBuilder to get the response from http request
```
FutureBuilder<List<dynamic>>(
  future: getNewsMap(),
  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
    if (snapshot.hasData) {
      return buildNewsList(snapshot.data);
  }
  return CircularProgressIndicator();
})
```

Displayed the response in a ListView.builder()
```
ListView.builder(
  itemCount: newsList?.length,
  itemBuilder: (context, item) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Article(news: newsList?[item]),
    );
  },
);
```

import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';

class GraphConfig {
  HttpLink httpLink;
  ErrorLink errorLink;

  GraphConfig() {
    this.init();
  }

  void init() {
    const baseUrl = 'https://covid-193.p.rapidapi.com';

    httpLink = HttpLink(
      uri: 'https://covidnigeria.herokuapp.com/api',
      useGETForQueries: true,
    );

    errorLink = ErrorLink(errorHandler: (ErrorResponse response) {
      FetchResult result = response.fetchResult;
      if (response.exception is OperationException) {
        print("graphql-error:::: ${result.errors}");
      }
    });
  }

  ValueNotifier<GraphQLClient> initClient() {
    final Link link = httpLink.concat(errorLink);
    ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        // cache: InMemoryCache(),
        link: link
    )
    );
    return client;
  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}

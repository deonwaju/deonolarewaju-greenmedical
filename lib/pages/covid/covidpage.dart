import 'package:deon_greenmed/constants.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/util/graph/graph_config.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/util/graph/query/covid_query.dart';
import 'package:deon_greenmed/widgets/covidcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class covidPage extends StatefulWidget {
  @override
  _covidPageState createState() => _covidPageState();
}

class _covidPageState extends State<covidPage> {
  int totalConfirmedCases  = 0;
  int totalActiveCases = 0;
  int discharged = 0;
  int death = 0;

  GraphConfig config = GraphConfig();

  getCovidResult() async {
    GraphQLClient client = config.clientToQuery();
    QueryResult queryResult = await client.query(
        QueryOptions(
            documentNode: gql(CovidQuery.getCovidQuery())
        )
    );
    print("gql-result:::: ${queryResult.data.data}");
    if (queryResult.hasException) {
      print("gql-exception:::: ${queryResult.exception}");
      return Center(
        child: Text(
            "${queryResult.exception.toString()}"
        ),
      );
    }
    if (queryResult.loading) {
      return Center (
        child: CircularProgressIndicator(),
      );
    }
    if (queryResult.data.data != null) {
      Map<String, dynamic> data = queryResult.data.data;
      setState(() {
        totalActiveCases = data["totalActiveCases"];
        totalConfirmedCases = data["totalConfirmedCases"];
        discharged = data["discharged"];
        death = data["death"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getCovidResult();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CovidCard(
            cardTitle: "Total Cases",
            caseTitle: "Total",
            currentData: totalConfirmedCases,
            newData: 0,
            percentChange: calculateGrowthPercentage(1000, 10),
            icon: showGrowthIcon(1000, 10),
            color: Colors.red,
            cardColor: Colors.green,
          ),
          CovidCard(
            cardTitle: "Total Deaths",
            caseTitle: "Deaths",
            currentData: death,
            newData: 0,
            percentChange: calculateGrowthPercentage(1000, 10),
            icon: showGrowthIcon(1000, 10),
            color: Colors.red,
            cardColor: Colors.red,
          ),
          CovidCard(
            cardTitle: "Total recovered",
            caseTitle: "Recovered",
            currentData: discharged,
            newData: 0,
            percentChange: calculateGrowthPercentage(1000, 10),
            icon: showGrowthIcon(1000, 10),
            color: Colors.red,
            cardColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class CovidQuery {
  static String covidData = """
    totalSamplesTested
    totalConfirmedCases
    totalActiveCases
    discharged
    death
    states {
        _id
        state
        confirmedCases
        casesOnAdmission
        discharged
    }
  """;


  static getCovidQuery() {
    String query = """ 
    query {
        covidData {
            $covidData
        }
    }
    """;
    return query;
  }
}

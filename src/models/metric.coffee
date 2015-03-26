app.factory 'Metric', (Parse) ->
  class Metric extends Parse.Model
    @configure "Metric", "value", "date"

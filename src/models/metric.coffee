app.factory 'Metric', (Parse) ->
  class Metric extends Parse.Model
    @configure "Metric", "value", "date"

    @findByRiderId: (riderId) ->
      return this.query(
        where:
          rider:
            __type: "Pointer"
            className: "Rider"
            objectId: riderId
        keys: 'date,value'
      )

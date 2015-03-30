app.factory 'Metric', (Parse) ->
  class Metric extends Parse.Model
    @configure "Metric", "value", "date"

    @findByRiderId: (riderId, startDate, endDate) ->

      startDate ?= moment().subtract(30, 'days')
      endDate ?= moment()

      return this.query(
        where:
          rider:
            __type: "Pointer"
            className: "Rider"
            objectId: riderId
          createdAt:
            $gte: startDate
            $lte: endDate
        keys: 'date,value'
      )

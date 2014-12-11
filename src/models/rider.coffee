app.factory 'Rider', (Parse) ->
  class Rider extends Parse.Model
    @configure "Rider", "username", "id", "name", "type"

    @getRiders: ->
      return this.query(
        order: '-followers'
        where:
          type: 'rider'
      )

    @getCompanie: ->
      return this.query(
        order: '-followers'
        where:
          type: 'company'
      )

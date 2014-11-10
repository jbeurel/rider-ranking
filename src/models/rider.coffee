app.factory 'Rider', (Parse) ->
  class Rider extends Parse.Model
    @configure "Rider", "username", "id", "name"

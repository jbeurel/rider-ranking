app.factory 'Proposal', (Parse) ->
  class Rider extends Parse.Model
    @configure "Proposal", "username"

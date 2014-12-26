app.filter 'instagram', ($filter) ->
  (text) ->
    addLink = (url, text) ->
      return '<a href="' + url + '">' + text + '</a>'

    text = text.replace /@[^.]+?(?=\s|$)/g, (username) ->
      addLink "http://instagram.com/" + username.replace("@", ""), username


    return text

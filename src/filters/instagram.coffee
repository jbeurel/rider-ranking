app.filter 'instagram', ($filter) ->
  (text) ->
    addLink = (url, text) ->
      return '<a href="' + url + '">' + text + '</a>'

    text = text.replace /@[^.]+?(?=\s|$)/g, (s) ->
      addLink "http://instagram.com/" + s.replace("@", ""), s


    return text

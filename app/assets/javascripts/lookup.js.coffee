$ ->
  #get the onclick event
  #submit ajax to google finance
  #

  $("#lookup_quote").click (e) ->
    e.preventDefault()
    symbol = $("#symbol").val()
    data = "q="+symbol
    $.ajax
      type: 'GET'
      format: 'json'
      url:  "http://www.google.com/finance/info?infotype=infoquoteall"
      data: data
      success: (result) ->
        alert("Success")
        populateSymbolQuote(result)

populateSymbolQuote = (result) ->
    $("#quote_details").html(result)


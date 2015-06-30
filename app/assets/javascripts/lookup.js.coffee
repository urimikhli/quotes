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
      dataType: "text"
      crossDomain: true
      url:  "http://www.google.com/finance/info?infotype=infoquoteall"
      data: data
      success: (result) ->
        populateSymbolQuote(result)
      error: -> alert("Invalid Symbol")

populateSymbolQuote = (result) ->
    data = JSON.parse(result.replace /\/\//,'')
    #alert(data)
    #Need to templify this...

    $("#quote_details").html("<table width=\"50%\">")
    $("#quote_details").append("<td>"+ data[0].t + "</td>")
    $("#quote_details").append("<td>" + data[0].name + "</td>")
    $("#quote_details").append("<tr>")
    $("#quote_details").append("<td> Last: " + data[0].l + "</td>")
    $("#quote_details").append("<td> High: " + data[0].hi + "</td>")
    $("#quote_details").append("</tr>")
    $("#quote_details").append("<tr>")
    $("#quote_details").append("<td> Change: " + data[0].c + "</td>")
    $("#quote_details").append("<td> Low: " + data[0].lo + "</td>")
    $("#quote_details").append("</tr>")
    $("#quote_details").append("<tr>")
    $("#quote_details").append("<td> Change %: " + data[0].cp + "</td>")
    $("#quote_details").append("<td> Exchange: " + data[0].e + "</td>")
    $("#quote_details").append("</tr>")
    $("#quote_details").append("<tr>")
    $("#quote_details").append("<td> Volume: " + data[0].vo + "</td>")
    $("#quote_details").append("<td></td>")
    $("#quote_details").append("</tr>")


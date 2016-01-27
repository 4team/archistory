// After the API loads, call a function to enable the search box.
function handleAPILoaded() {
  $('#search-button').attr('disabled', false);
}

// Search for a specified string.
function search() {

  console.log('Search Started');
  var apiKey = 'AIzaSyARCn5THIU3dV2UZFgO9c8UMIIiVfISFgE';
  q = $('#query').val();

  gapi.client.setApiKey(apiKey);
  gapi.client.load('youtube', 'v3', function() {
    isLoad = true;
  });
  console.log('Search Request');

  var request = gapi.client.youtube.search.list({
    q: q,
    part: 'id, snippet',
    type: 'video',
    order: 'date'
  });


  request.execute(function(response) {
    var str = JSON.stringify(response.result);
    $('#search-container').html('<pre>' + str + '</pre>');
  });
}

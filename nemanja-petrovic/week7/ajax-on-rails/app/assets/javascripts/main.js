console.log('hellow');
DOGS_BASE_URL = 'http://localhost:3000/dogs'

$(document).ready(function() {
  console.log('doc');

  $('#findDog').on('click', () => {
    const dogQuery = $('#dogSearch').val();
    const searchURL = `/dogs/search/${dogQuery}`;
    console.log('searchURL', searchURL);
    $.getJSON(searchURL)
    .done( data => {
      data.forEach( dog => {

        $('#dogSearchResults').append(`
          <p>
          <strong>Name:</strong>${dog.name}
          <strong>Roundness:</strong>${dog.name}
          <strong>Goodboy:</strong>${dog.name}
          </p>`
        );

      });
    })
    .fail(err => console.warn(err));
  });

  $('#dogSearchResults').empty();
  // $('#searchText').focus();
  // $('#searchForm').on('submit', function (ev) {
  //   var query = $('#searchText').val();
  //   getSearchResults(query);
  //   ev.preventDefault();
  // }); //searchForm
  //
  // var getSearchResults = function getSearchResults(queryText) {
  //
  //   console.log('getSearchResults():', queryText);
  //   const doggies = Dogs.name;
  //   $.getJSON(DOGS_BASE_URL, {
  //     method: doggies,
  //     text: queryText,
  //     format: 'json',
  //     // nojsoncallback: 1,
  //   });
  // }

  $.getJSON('/uptime')
  .done( data => {
    $('#uptime').html( data.output );
  })
  .fail( err => console.log(err));

  $.getJSON('/cpuhog')
  .done( data => {
    $('#hog').html( data.cpuHog );
  })
  .fail( err => console.log(err));

  $.getJSON('/dogs')
  .done( data => {
    data.forEach( dog => {
      $('#dogsList').append(`<li>${dog.name}</li>`)
    });

  })
  .fail( err => console.log(err));


});

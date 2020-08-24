const FLICKR_BASE_URL = "https://api.flickr.com/services/rest"
const FLICKR_API_KEY = "2f5ac274ecfac5a455f38745704ad084"
let pageNumber = 1;

$(document).ready(function(){

  console.log("Flickr Search!")
  $('#searchText').focus();
  $('#searchForm').on('submit', function(ev){
    const query = $('#searchText').val();
    getSearchResults( query );
    ev.preventDefault();
  }); //searchForm

  $('#nextPage').on('click', function(ev){
    console.log("Next Page clicked");
    pageNumber ++;
    const query = $('#searchText').val();
    getSearchResults( query );
  }); //nextPage

  $('#previousPage').on('click', function(ev){
    console.log("Previous Page clicked");
    pageNumber --;
    const query = $('#searchText').val();
    getSearchResults( query );
  }); //previousPage
}); //document ready

const getSearchResults = (queryText) => {

  console.log('getSearchResults():', queryText);
  $.getJSON( FLICKR_BASE_URL, {
    method: "flickr.photos.search",
    api_key: FLICKR_API_KEY,
    text: queryText,
    format: 'json',
    nojsoncallback: 1,
    page: pageNumber
  }) //json
  .done( data => displaySearchResults(data.photos) )
  .fail( err => console.warn(err) );
}; // getSearchResults

const displaySearchResults = (results) => {
  console.log('displaySearchResults():', results );
  const $results = $('#results');
  $results.empty();
  results.photo.forEach( photo => {
    const thumbnailURL = generatePhotoURL( photo );
    console.log( thumbnailURL );
    $results.append(`<img src="${ thumbnailURL }"> `);
  }); //results
}; // displaySearchResults

const generatePhotoURL = (photo, size='q') => {
  return `https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_${size}.jpg`;
}; //generatePhotoURL

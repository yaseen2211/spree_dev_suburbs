// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'


$(document).ready(function () {
  'use strict'
  if ($('#new_suburb_link').length) {
    $('#state').on('change', function () {
      var newSuburbLinkHref = $('#new_suburb_link').prop('href')
      var selectedStateId = $('#state option:selected').prop('value')
      var newLink = newSuburbLinkHref.replace(/states\/(\d+)/,
        'states/' + selectedStateId)
      $('#new_suburb_link').attr('href', newLink)
    })
  };
})

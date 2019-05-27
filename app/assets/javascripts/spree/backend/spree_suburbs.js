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



$(function () {
  var countryBased = $('#country_based')
  var stateBased = $('#state_based')
  var suburbBased = $('#suburb_based')

  countryBased.click(show_country)
  stateBased.click(show_state)
  suburbBased.click(show_suburb)

  suburbBased.click()

  if (countryBased.is(':checked')) {
    show_country()
  } else if (stateBased.is(':checked')) {
    show_state()
  } else {
    show_suburb()
  }
})
// eslint-disable-next-line camelcase
function show_country () {
  $('#state_members :input').each(function () {
    $(this).prop('disabled', true)
  })
  $('#state_members').hide()
  
  $('#country_members :input').each(function () {
    $(this).prop('disabled', false)
  })
  $('#country_members').show()

  $('#suburb_members :input').each(function () {
    $(this).prop('disabled', true)
  })
  $('#suburb_members').hide()
}
// eslint-disable-next-line camelcase
function show_state () {
  $('#country_members :input').each(function () {
    $(this).prop('disabled', true)
  })
  $('#country_members').hide()

  $('#suburb_members :input').each(function () {
    $(this).prop('disabled', true)
  })
  $('#suburb_members').hide()

  $('#state_members :input').each(function () {
    $(this).prop('disabled', false)
  })
  $('#state_members').show()
}

function show_suburb () {
  $('#country_members :input').each(function () {
    $(this).prop('disabled', true)
  })
  $('#country_members').hide()

  $('#state_members :input').each(function () {
    $(this).prop('disabled', true)
  })
  $('#state_members').hide()

  $('#suburb_members :input').each(function () {
    $(this).prop('disabled', false)
  })
  $('#suburb_members').show()
}

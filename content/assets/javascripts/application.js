// =require modernizr
// =require jquery
// =require jquery-ui
// =require jquery-h5validate
// =require redactor

$(function() {
  // validation form init
  $('form').h5Validate();
  $('#eight_hours_date').hide();
  $('#six_hours_date').hide();
  $('#twelve_hours_date').hide();
  $('#tech_date').hide();
  $('#flow_date').hide();
  $('#both_date').hide();

  // pickup the right date for the package
  $('#pack_checkbox > .checkbox > input').on('click', function() {
    if ($('#six_hours_pack').is(':checked')) {
      $('#six_hours_date').show();
      $('#eight_hours_date').hide();
      $('#twelve_hours_date').hide();
    } else if ($('#eight_hours_pack').is(':checked')) {
      $('#eight_hours_date').show();
      $('#six_hours_date').hide();
      $('#twelve_hours_date').hide();
    } else {
      $('#twelve_hours_date').show();
      $('#six_hours_date').hide();
      $('#eight_hours_date').hide();
    }
  });

  // pickup the right date for the package
  $('#pack_checkbox_2 > .checkbox > input').on('click', function() {
    if ($('#tech').is(':checked')) {
      $('#tech_date').show();
      $('#flow_date').hide();
      $('#both_date').hide();
    } else if ($('#flow').is(':checked')) {
      $('#flow_date').show();
      $('#tech_date').hide();
      $('#both_date').hide();
    } else {
      $('#both_date').show();
      $('#tech_date').hide();
      $('#flow_date').hide();
    }
  });
});

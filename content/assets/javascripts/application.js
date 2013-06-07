// =require modernizr
// =require jquery
// =require jquery-ui
// =require jquery-h5validate

$(function() {
  // validation form init
  $('form').h5Validate();

  // pickup the right date for the package
  $('#pack_checkbox > .checkbox > input').on('click', function() {
    if ($('#six_hours_pack').is(':checked')) {
      $('.bigRow > #six_hours_date').show();
      $('.bigRow > #eight_hours_date').hide();
      $('.bigRow > #twleve_hours_date').hide();
    } else if ($('#eight_hours_pack').is(':checked')) {
      $('.bigRow > #eight_hours_date').show();
      $('.bigRow > #six_hours_date').hide();
      $('.bigRow > #twelve_hours_date').hide();
    } else {
      $('.bigRow > #twelve_hours_date').show();
      $('.bigRow > #six_hours_date').hide();
      $('.bigRow > #eight_hours_date').hide();
    }
  });

  // pickup the right date for the package
  $('#pack_checkbox_2 > .checkbox > input').on('click', function() {
    if ($('#tech').is(':checked')) {
      $('.bigRow > #tech_date').show();
      $('.bigRow > #flow_date').hide();
      $('.bigRow > #both_date').hide();
    } else if ($('#flow').is(':checked')) {
      $('.bigRow > #flow_date').show();
      $('.bigRow > #tech_date').hide();
      $('.bigRow > #both_date').hide();
    } else {
      $('.bigRow > #both_date').show();
      $('.bigRow > #tech_date').hide();
      $('.bigRow > #flow_date').hide();
    }
  });
});
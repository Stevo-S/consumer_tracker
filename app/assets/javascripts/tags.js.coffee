# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

console.log('Loading random_strings.js ...')                                                                                                                                                  
                                                                                                                                                                                              
$ ->                                                                                                                                                                                          
  $('#all_tags').change ->                                                                                                                                                   
      currentValue = $('#all_tags').prop('checked')                                                                                                                            
      $('input[type="checkbox"]').prop('checked', currentValue)                                                                                                                                 
console.log('Loaded random_strings.js')

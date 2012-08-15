// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

	$('.typeahead').typeahead({
	      source: function (typeahead, query) {
        	return $.get('/users.json', { query: query }, function (data) {
        		var return_list = [];
        		var i = 0;

        		while(i < data.length) {
        			var user = data[i];
        			return_list.push({value: user.first_name + " " + user.last_name, id: user.id});
        			i++;
        		}
        		
        		return typeahead.process(return_list);
    		});
        },
        property: 'value',
    	items: 5,
    });

});

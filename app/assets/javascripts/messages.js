// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

	$('input.typeahead').typeahead({
      	source: function (typeahead, query) {
        	return $.get('/users.json', { query: query }, function (data) {
        		var return_list = [];

        		for (var i = 0; i < data.length; i++) {
        			var user = data[i];
        			user.name = user.first_name + " " + user.last_name;
        			return_list.push({value: user.name, id: user.id, preference: user.preference});
        		}

        		return typeahead.process(return_list);		
    		});
        },
        onselect: function(obj) {
        	$('#message_to_user_id').val(obj.id.toString());
        	$('#message_message_type_id_'+obj.preference).prop('checked', 'checked');
        },
        property: 'value',
    	items: 5,
    });

});
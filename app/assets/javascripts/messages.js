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
							console.log(user.id);
							$("#message_to_user_id").val(user.id);

        		}

						if (user.preference === 1) {
								$("#message_message_type_id_1").prop("checked", true);
								$("#message_message_type_id_2").prop("checked", false);
								$("#message_message_type_id_3").prop("checked", false);
								
								console.log(user.preference);
						} else if ( user.preference === 2 ) {
							$("#message_message_type_id_1").prop("checked", false);
							$("#message_message_type_id_2").prop("checked", true);
							$("#message_message_type_id_3").prop("checked", false);
								console.log(user.preference);
						} else {
							$("#message_message_type_id_1").prop("checked", false);
							$("#message_message_type_id_2").prop("checked", false);
							$("#message_message_type_id_3").prop("checked", true);
								console.log(user.preference);
						}

        		return typeahead.process(return_list);
						
    		});
        },
        property: 'value',
    	items: 5,
    });

});

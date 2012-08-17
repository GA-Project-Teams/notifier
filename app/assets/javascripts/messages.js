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
        	$('#message_user_id').val(obj.id.toString());
        	$('#message_message_type_id_'+obj.preference).prop('checked', 'checked');
        },
        property: 'value',
    	items: 5,
    });
    
	$('#message_content').keyup(function(){
		var messageLength = $(this).val().length;
		var $counter = $("#counter");
		var $submitButton = $('input[type="submit"]');

		$counter.text(160 - messageLength);
		if(messageLength >= 130 && messageLength < 160) {
			$counter.css('color', 'yellow');
			$submitButton.removeAttr('disabled');
		} else if(messageLength >= 160) {
			$counter.css('color', 'red');
			$submitButton.attr('disabled', 'true');
		} else {
			$counter.css('color', 'black');
			$submitButton.removeAttr('disabled');
		}

	});

});

var Photor = {};

Photor.Tags = (function($){

	var editTags = function(target){
		var parent_div = $(target).closest('.tags');
		$(parent_div).find('.add_tags').show();
		$(target).hide();
	}

	var removeTag = function(tag){
		var editable_tag = $(tag).closest('.editable_tag');
		$(editable_tag).hide();
		$.ajax({url: $(tag).attr('href'),
					type: "POST",
					data: {"_method": 'delete'},
					success: function(data){
						$(editable_tag).remove();
						hideErrors(editable_tag);
					},
					error: function(data){
						$(editable_tag).show();
						handleError(data, editable_tag);
					}
		});
	}
	
	var addTags = function(form) {
		$.ajax({url: $(form).attr('action') + ".js",
					type: "POST",
					data: $(form).serialize(),
					dataType: "html",
					success: function(data){
						var tags_div = $(form).closest('.tags');
						$('.editable_tag', tags_div).remove();
						$('.error_messages', tags_div).after(data);
						hideErrors();
						$(form).find('input[type=text]').val("");
					},
					error: function(data){
						handleError(data, form);
					}
		});
	}
	
	var hideErrors = function(wrapper) {
		$(wrapper).parent(".tags").hide().text("");
	}

	var handleError = function(result, wrapper){
		var message = ""
		if(result.length > 0){
			message = result;
		} else {
			message = "An unknown error occurred";
		}
		$(wrapper).parent(".tags").find(".error_messages").text(message).show();
	}

	// public
	return {
		init: function(){
			$('.edit_tags').live('click', function(event){
				event.preventDefault();
				editTags(event.target);
			});

			$('.destroy_tag').live('click', function(event){
				event.preventDefault();
				removeTag(event.target);
			});
			
			$('.add_tags').live('submit', function(event){
				event.preventDefault();
				addTags(event.target);
			});

		}
	}

})(jQuery);

$(document).ready(function(){
	Photor.Tags.init();

});
	


var fn_button_remove_message = function(ev, data) {
    if (ev.target.classList.contains( "button-remove-message" )) {
        var id = ev.target.dataset.id;
    } else {
        var id = ev.target.parentNode.dataset.id;
    }

    var URL_SAVE_MESSAGE = URL_SAVE_MESSAGE_PATTERN.replace("***", id);
    
    var request = $.ajax({
        url: URL_SAVE_MESSAGE,
        method: "POST",
        data: { attribute: "removetask", value: id }
    });

    request.done( function( msg ) {
        var taskrowid = "#messagecontainer" + msg;
        $(taskrowid).remove();
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

$('.button-remove-message').click( fn_button_remove_message );

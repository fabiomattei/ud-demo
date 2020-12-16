var fn_add_flag = function add_flag(ev, data) {

    var request = $.ajax({
        url: URLSAVEFLAG,
        method: "POST",
        data: { attribute: "insert", value: 0, id: APHID },
    });

    request.done( function( msg ) {
        var currentTime = new Date();
        var month = currentTime.getMonth() + 1;
        var day = currentTime.getDate();
        var year = currentTime.getFullYear();

        // Animation to last message
        var container = $('body'),
            lastflag = $('[name=last-flag]');

        container.animate({
            scrollTop: lastflag.offset().top - container.offset().top + container.scrollTop()
        });

        // msg should contain the id of the flag saved

        $(".actionplanflagtable").append("<tr id=\"flagitem" + msg + "\">" +
        "<td class=\"txt-oflo\">" + msg + "</td>" +

        "<td class=\"txt-oflo editable\" " +
        "data-url=\"" + URLSAVEFLAG + "\" " +
        "data-placeholder=\"[Description]\" " +
        "data-attribute=\"editdescription\" " +
        "data-object=\"" + msg + "\"" +
        ">[Description]</td>" +

        "<td class=\"txt-oflo\"><span class=\"editable\" " +
        "data-type=\"select\" " +
        "data-url=\"" + URLSAVEFLAG + "\" " +
        "data-data='[[\"0\", \"Cost\"], [\"1\", \"Schedule\"], [\"2\", \"Performance\"]]' " +
        "data-attribute=\"editcategory\" " +
        "data-object=\"" + msg + "\"" +
        ">[Category]</span></td>" +

        "<td class=\"txt-oflo\"><span class=\"editable\" " +
        "data-type=\"select\" " +
        "data-url=\"" + URLSAVEFLAG + "\" " +
        "data-data='[[\"0\", \"Low\"], [\"1\", \"Medium-Low\"], [\"2\", \"Medium-High\"], [\"3\", \"High\"]]' " +
        "data-attribute=\"editlevel\" " +
        "data-object=\"" + msg + "\"" +
        ">[Level]</span></td>" +

        "<td class=\"txt-oflo editable\" " +
        "data-url=\"" + URLSAVEFLAG + "\" " +
        "data-placeholder=\"[Mitigation]\" " +
        "data-attribute=\"editmitigation\" " +
        "data-object=\"" + msg + "\"" +
        ">[Mitigation]</td>" +

        "<td class=\"txt-oflo\"><span class=\"editable\" " +
        "data-type=\"select\" " +
        "data-url=\"" + URLSAVEFLAG + "\" " +
        "data-data='[[\"3\", \"Mitigated\"], [\"4\", \"Saved\"]]' " +
        "data-attribute=\"editstatus\" " +
        "data-object=\"" + msg + "\"" +
        ">[Status]</span></td>" +

        // todo current user
        "<td class=\"txt-oflo\">" + "you" + "</td>" +

        "<td class=\"txt-oflo\">" + day + "/" + month + "/" + year + "</td>" +

        "<td><button class=\"btn-small btn-default button-remove-flag\" data-id=\"" + msg + "\"><span class=\"icon-trash\"></span></button></td>" +
        "</tr>");

        $('.editable').jinplace( {
            placeholder: 'Click to edit',
            okButton: 'OK',
            cancelButton: 'Cancel',
            submitFunction: function(opts, value) {
                return $.ajax( opts.url, {
                    type: "post",
                    data: {
                        attribute: opts.attribute,
                        id: opts.object,
                        value: value,
                    },
                    dataType: 'text'
                });
            }
        } );

        $('.button-remove-flag').click( fn_button_remove_flag );
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_button_remove_flag = function(ev, data) {
    if (ev.target.classList.contains( "button-remove-flag" )) {
        var id = ev.target.dataset.id;
    } else {
        var id = ev.target.parentNode.dataset.id;
    }

    var request = $.ajax({
        url: URLSAVEFLAG,
        method: "POST",
        data: { attribute: "removeflag", value: id, id: id }
    });

    request.done( function( msg ) {
        var flagrowid = "#flagitem" + msg;
        $(flagrowid).remove();
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

$(document).ready(function() {

    $('.editable').jinplace( {
        placeholder: 'Click to edit',
        okButton: 'OK',
        cancelButton: 'Cancel',
        submitFunction: function(opts, value) {
            return $.ajax( opts.url, {
                type: "post",
                data: {
                    attribute: opts.attribute,
                    id: opts.object,
                    value: value,
                },
                dataType: 'text'
            });
        }
    } );

    $('.button-add-flag').click( fn_add_flag );
    $('.button-remove-flag').click( fn_button_remove_flag );
});

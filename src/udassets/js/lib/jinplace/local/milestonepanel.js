
var fn_add_milestone = function add_milestone(ev, data) {

    var request = $.ajax({
        url: URLSAVEMILESTONE,
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
            lastmilestone = $('[name=last-milestone]');

        container.animate({
            scrollTop: lastmilestone.offset().top - container.offset().top + container.scrollTop()
        });

        // msg should contain the id of the milestone saved

        $(".actionplanmilestonetable").append("<tr id=\"milestoneitem" + msg + "\">" +

        "<td class=\"txt-oflo editable\" " +
        "data-url=\"" + URLSAVEMILESTONE + "\" " +
        "data-placeholder=\"[Milestone name]\" " +
        "data-attribute=\"editname\" " +
        "data-object=\"" + msg + "\"" +
        ">[Milestone name]</td>" +

        "<td class=\"txt-oflo\"><span class=\"milestonedate\" " +
        "data-url=\"" + URLSAVEMILESTONE + "\" " +
        "data-object=\"" + msg + "\"" +
        ">" + day + "/" + month + "/" + year + "</span></td>" +

        "<td><span class=\"text-success editable\" " +
        "data-type=\"select\" " +
        "data-loadurl=\"" + URLLOADPEOPLE + "\" " +
        "data-url=\"" + URLSAVEMILESTONE + "\" " +
        "data-attribute=\"editowner\" " +
        "data-object=\"" + msg + "\"" +
        ">None</span></td>" +

        "<td><span class=\"editable\" " +
        "data-type=\"select\" " +
        "data-url=\"" + URLSAVEMILESTONE + "\" " +
        "data-data='[[\"0\", \"Open\"], [\"1\", \"In progress\"], [\"2\", \"Closed\"]]' " +
        "data-attribute=\"editstatus\" " +
        "data-object=\"" + msg + "\"" +
        ">Open</span></td>" +

        "<td><button class=\"btn-small btn-default button-remove-milestone\" data-id=\"" + msg + "\"><span class=\"icon-trash\"></span></button></td>" +
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
                    dataType: 'text',
                });
            }
        } );

        var date = $('.milestonedate');
        date.editable( fn_make_milestone_date_editable , milestone_date_settings );

        $('.button-remove-milestone').click( fn_button_remove_milestone );
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_button_remove_milestone = function(ev, data) {
    if (ev.target.classList.contains( "button-remove-milestone" )) {
        var id = ev.target.dataset.id;
    } else {
        var id = ev.target.parentNode.dataset.id;
    }

    var request = $.ajax({
        url: URLSAVEMILESTONE,
        method: "POST",
        data: { attribute: "removemilestone", value: id, id: id }
    });

    request.done( function( msg ) {
        var milestonerowid = "#milestoneitem" + msg;
        $(milestonerowid).remove();
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_make_milestone_date_editable = function( value, settings ) {
    var idmilestone = this.dataset.object;
    var thisobject = this;

    var request = $.ajax({
        url: URLSAVEMILESTONE,
        method: "POST",
        data: { attribute: "editduedate", value: value, id: idmilestone }
    });

    request.done( function( msg ) {
        thisobject.innerHTML = '';
        thisobject.appendChild(document.createTextNode(msg));
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Session expired, please login again.");
    });
}

var milestone_date_settings = {
    type: 'datepicker',
    datepicker: {
        dateFormat: 'dd/mm/yy',
        numberOfMonths: 1
    }
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
                dataType: 'text',
            });
        }
    } );

    $('.button-add-milestone').click( fn_add_milestone );
    $('.button-remove-milestone').click( fn_button_remove_milestone );

    var date = $('.milestonedate');
    date.editable(fn_make_milestone_date_editable , milestone_date_settings);
});
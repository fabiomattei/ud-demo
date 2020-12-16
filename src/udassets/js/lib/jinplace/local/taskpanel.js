
var fn_add_task = function add_task(ev, data) {

    var request = $.ajax({
        url: URLSAVETASK,
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
            lasttask = $('[name=last-task]');

        container.animate({
            scrollTop: lasttask.offset().top - container.offset().top + container.scrollTop()
        });

        // msg should contain the id of the task saved

        $(".actionplantasktable").append("<tr id=\"taskitem" + msg + "\"> \
        <td class=\"txt-oflo editable\" \
        data-url=\"" + URLSAVETASK + "\" \
        data-placeholder=\"[Task name]\" \
        data-attribute=\"edit\" \
        data-object=\"" + msg + "\" \
        >[Task name]</td> \
        \
        <td class=\"txt-oflo\"> \
        <span class=\"editable\"\
        data-type=\"select\" \
        data-url=\"" + URLSAVETASK + "\" \
        data-data='[[\"0\", \"Open\"], [\"1\", \"In progress\"], [\"2\", \"Closed\"]]' \
        data-attribute=\"editstatus\" \
        data-object=\"" + msg + "\" \
        >Open</span>\
        </td> \
        \
        <td class=\"txt-oflo\"><span \
        class=\"taskdateeditable\" \
        data-destinationurl=\"" + URLSAVETASK + "\" \
        data-object=\"" + msg + "\" \
        >" + day + "/" + month + "/" + year + "</span></td> \
        \
        <td><span class=\"text-success editable\" \
        data-type=\"select\" \
        data-loadurl=\"" + URLLOADPEOPLE + "\" \
        data-url=\"" + URLSAVETASK + "\" \
        data-attribute=\"editowner\" \
        data-object=\"" + msg + "\" \
        >None</span></td> \
        \
        \<td><button class=\"btn-small btn-default button-remove-task\" data-id=\"" + msg + "\"><span class=\"icon-trash\"></span></button></td> \
        </tr>");

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

        var date = $( '.taskdateeditable' );
        date.editable( fn_make_task_date_editable , task_date_settings );

        $('.button-remove-task').click( fn_button_remove_task );
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_button_remove_task = function(ev, data) {
    if (ev.target.classList.contains( "button-remove-task" )) {
        var id = ev.target.dataset.id;
    } else {
        var id = ev.target.parentNode.dataset.id;
    }

    var request = $.ajax({
        url: URLSAVETASK,
        method: "POST",
        data: { attribute: "removetask", value: id, id: id }
    });

    request.done( function( msg ) {
        var taskrowid = "#taskitem" + msg;
        $(taskrowid).remove();
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_make_task_date_editable = function( value, settings ) {

    var destiantionurl = this.dataset.destinationurl;
    var idtask = this.dataset.object;
    var thisobject = this;
    // date.html(value);

    var request = $.ajax({
        url: destiantionurl,
        method: "POST",
        data: { attribute: "duedate", value: value, id: idtask }
    });

    request.done( function( msg ) {
        thisobject.innerHTML = '';
        thisobject.appendChild(document.createTextNode(msg));
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Session expired, please login again.");
    });
}

var task_date_settings = {
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

    $('.button-add-task').click( fn_add_task );

    $('.button-remove-task').click( fn_button_remove_task );

    var date = $( '.taskdateeditable' );
    date.editable( fn_make_task_date_editable , task_date_settings );
});

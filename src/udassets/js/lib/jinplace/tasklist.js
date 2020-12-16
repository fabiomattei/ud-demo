
var fn_add_task = function add_task(ev, data) {

    var milestone_id = ev.target.dataset.id;
            
    var request = $.ajax({
        url: URLSAVENEWTASK,
        method: "POST",
        data: { attribute: "insert", value: 0, milestoneid: milestone_id }
    });

    // console.log('milesont id' + milestone_id);

    request.done( function( msg ) {
        var URLSAVETASK = URLSAVETASK_PATTERN.replace("***", msg);
        // console.log('url ' + URLSAVETASK);
        var listid = "#tasklist" + milestone_id;
        $(listid).append("<li id=\"taskitem" + msg + "\"><input type=\"checkbox\" class=\"todo-check\">&nbsp; \
                            \
                            <span \
                            class=\"editable\" \
                            data-ok-button=\"Save\" \
                            data-cancel-button=\"Cancel\" \
                            data-url=\"" + URLSAVETASK + "\" \
                            data-placeholder=\"[Task name]\" \
                            data-attribute=\"name\"></span> \
                            \
                            <span class=\"pull-right\"> \
                            <span \
                            class=\"editable\" \
                            data-type=\"select\" \
                            data-url=\"" + URLSAVETASK + "\" \
                            data-loadurl=\"" + URL_PEOPLE_DATA + "\" \
                            data-attribute=\"ownerid\"></span> \
                            \
                            <span class=\"taskdateeditable\" \
                            data-destinationurl=\"" + URLSAVETASK + "\" \
                            ></span> \
                            \
                            <button class=\"btn-small btn-default button-remove-task\" \
                            data-id=\"" + msg + "\"> \
                            <span class=\"icon-trash\"></span></button> \
                            \
                            </span> \
            </li>");

        $('.editable').jinplace();

        var date = $( '.taskdateeditable' );

        date.editable( fn_make_task_date_editable , task_date_settings );

        $('.button-remove-task').click( fn_button_remove_task );
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_add_milestone = function add_milestone(ev, data) {
    var request = $.ajax({
        url: URLSAVENEWMILESTONE,
        method: "POST",
        data: { attribute: "insert", value: 0 }
    });

    request.done( function( msg ) {
        var URLSAVEMILESTONE = URLSAVENEWMILESTONE_PATTERN.replace("***", msg);
        $('#milestones-list').append("<span class=\"label label-default pull-right button-add-task\" \
                       data-id=\"" + msg + "\" id=\"milestoneatttask" + msg + "\">Add task</span> \
            <h4 id=\"milestoneitem" + msg + "\"><span \
                            class=\"editable\" \
                            data-ok-button=\"Save\" \
                            data-cancel-button=\"Cancel\" \
                            data-url=\"" + URLSAVEMILESTONE + "\" \
                            data-placeholder=\"[Milestone name]\" \
                            data-input-class=\"form-control\" \
                            data-attribute=\"name\"></span> \
                            <button class=\"btn-small btn-default button-remove-milestone\" \
                            data-id=\"" + msg + "\"><span class=\"icon-trash\"></span></button> \
                            </h4><ul class=\"connectedSortable\" id=\"tasklist" + msg + "\"></ul>");
        $('.editable').jinplace();
        $('.button-add-task').click( fn_add_task );
        $('.button-remove-milestone').click( fn_button_remove_milestone );
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

    var URLSAVETASK = URLSAVETASK_PATTERN.replace("***", id);
    
    var request = $.ajax({
        url: URLSAVETASK,
        method: "POST",
        data: { attribute: "removetask", value: id }
    });

    request.done( function( msg ) {
        var taskrowid = "#taskitem" + msg;
        $(taskrowid).remove();
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

    var URLSAVEMILESTONE = URLSAVENEWMILESTONE_PATTERN.replace("***", id);
    
    var request = $.ajax({
        url: URLSAVEMILESTONE,
        method: "POST",
        data: { attribute: "removemilestone", value: id }
    });

    request.done( function( msg ) {
        var milestonerowid = "#milestoneitem" + msg;
        $(milestonerowid).remove();
        var tasklistrowid = "#tasklist" + msg;
        $(tasklistrowid).remove();
        var milestoneatttaskrowid = "#milestoneatttask" + msg;
        $(milestoneatttaskrowid).remove();
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed, error!");
    });
}

var fn_make_task_date_editable = function( value, settings ) {

  var destiantionurl = this.dataset.destinationurl;
  var thisobject = this;
  // date.html(value);

  var request = $.ajax({
    url: destiantionurl,
    method: "POST",
    data: { attribute: "duedate", value: value }
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

// it activate jinplace
$('.editable').jinplace();

$('.button-add-milestone').click( fn_add_milestone );

$('.button-remove-milestone').click( fn_button_remove_milestone );

$('.button-add-task').click( fn_add_task );

$('.button-remove-task').click( fn_button_remove_task );

var date = $( '.taskdateeditable' );
date.editable( fn_make_task_date_editable , task_date_settings );

//$( document ).ready();

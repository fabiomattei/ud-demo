
$('.editable').jinplace();

function add_row_to_table( table_id, msg ) {
    $("table[id=" + table_id + "]").append( '<tr><td></td><td><span class="editable" \
        data-url="'+BASEPATHCONST+'user-change/saveajax/'+STAGEIDCONST+'/'+msg+'.html" \
        data-ok-button="Save" \
        data-cancel-button="Cancel" \
        data-attribute="state" \
        data-placeholder="[Edit]"></span> \
        </td><td width="20%"> \
        <span \
        class="editable" \
        data-type="select" \
        data-data=\'[["1","1"],["2","2"],["3","3"],["4","4"],["5","5"]]\' \
        data-url="'+BASEPATHCONST+'user-change/saveajax/'+STAGEIDCONST+'/'+msg+'.html" \
        data-ok-button="Save" \
        data-cancel-button="Cancel" \
        data-attribute="stseverity" \
        data-placeholder="[Edit]">1</span> \
        </td> \
        <td width="20%"> \
        <a href=" ' + BASEPATHCONST + 'user-change/deletepawitem/' + STAGEIDCONST + '/' + msg + '.html"  class="btn btn-default"  >Delete</a> \
        </td> \
        </tr>' );
    $('.editable').jinplace();
}

$('#addtechnologyrow').click( function() {

    var request = $.ajax({
        url: BASEPATHCONST + "user-change/createajaxpawitem/"+STAGEIDCONST+"/5.html",
        method: "GET",
        dataType: "html"
    });

    request.done( function( msg ) {
        add_row_to_table( 'technologytable', msg );
    });

    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed: " + textStatus );
    });

});


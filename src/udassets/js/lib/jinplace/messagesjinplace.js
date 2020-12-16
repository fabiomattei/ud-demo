/**
 * Created by Fabio Mattei <matteif@tcd.ie> on 08/02/2016.
 */

//$('.editablemessage').jinplace();

$(document).ready(function() {


    $('.editablemessage').jinplace( {
            //placeholder: 'Click to edit',
            okButton: 'Send',
            cancelButton: 'Cancel',
            submitFunction: function(opts, value) {
                $.ajax( opts.url, {
                    type: "post",
                    data: {
                        attribute: opts.attribute,
                        id: APHID,
                        value: value,
                    },
                    success: function(message) {
                        console.log(message);
                        // Animation to last message
                        var container = $('body'),
                            lastmessage = $('[name=last-message]');

                        /*container.animate({
                            scrollTop: lastmessage.offset().top - container.offset().top + container.scrollTop()
                        });*/

                        $("[name=last-message]").after(message);
                    },
                    dataType: 'text',
                });

                return undefined;
            }
    });
});


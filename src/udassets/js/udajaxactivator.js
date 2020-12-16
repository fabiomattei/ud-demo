// udajaxactivator.js
// This set of functions designe by Fabio Mattei set up what is necessary

function activateajaxdelete() {
    $(".udbuttonremove").click( function (e) {
        e.preventDefault();
        var udurl = this.getAttribute("data-udurl");
        var curentodomitem = $(this);
        $.ajax({url: udurl,
            success: function(result){
                // curentodomitem.closest(".uditem").remove();
                // curentodomitem.closest(".uditem").animate({'line-height':0},1000).hide(1).remove();
                /*curentodomitem.closest(".uditem").effect("blind", "swing", 400, function(){
                    curentodomitem.closest(".uditem").remove();  // this will run after the effect is finished
                });*/
                curentodomitem.closest('.uditem').fadeOut('fast',
                    function(){
                        curentodomitem.parents('.uditem').remove();
                    });
            }
        });
    })
}

function activateajaxadd() {
    $(".udbuttonappend").click( function (e) {
        e.preventDefault();
        var udurl = this.getAttribute("data-udurl");
        var udiddestination = "#"+this.getAttribute("data-udiddestination");
        $.ajax({url: udurl,
            success: function(html) {
                $(udiddestination).append(html);  // this will run after the effect is finished
                $('.editable').jinplace();

                /*
                $(udiddestination).effect("blind", {
                    size: "50%"
                }, 1000, function(){
                    console.log("entered in interna function");
                    console.log("udiddatadestination: " + udiddestination);
                    console.log("udiddatadestination get attribute: " +  "#"+this.getAttribute("data-udiddestination"));

                });
                */
            }
        });
    })
}

function activateajaxload() {
    $(".udbuttonload").click( function (e) {
        e.preventDefault();
        var udurl = this.getAttribute("data-udurl");
        var udiddestination = "#"+this.getAttribute("data-udiddestination");
        var udidcontainer = "#"+this.getAttribute("data-udidcontainer");
        $(udiddestination).load(udurl+" "+udidcontainer, function () {
            $('.editable').jinplace();
        });
    })
}

function activate_ud_ajax() {
    $('.editable').jinplace();
    activateajaxdelete();
    activateajaxload();
    activateajaxadd();
}

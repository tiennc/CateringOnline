/**
 * @author: quantm.tb@gmail.com
 * @date: 10/28/13 10:32 AM
 */
$(document).ready(function(){
    var _DEBUG_ = true;
    /*^ALL_PAGE*/
    (function(element){
        if(!element)
            return;
        var _import = parseInt($("#import").attr("data-import"));
        var _export = parseInt($("#export").attr("data-export"));
        var pie_data = [{value: _import, color:"#69D2E7"}, {value : _export, color : "#F38630"}];
        new Chart(element.getContext("2d")).Pie(pie_data);

    })(document.getElementById("canvas"));
    $("#user-filter").create_custom_filter();
    $("#filter").create_filter_by_month_year(2009,2050);
    $("#sort-row").create_sort_table();
    //$("#stock_image").create_upload_image(false);
    $("#stock-item-per-page").change(function(){
        var value = $(this).val();
        var data = {action: "change_items_per_page", value: value};
        $.post(location.href, data)
            .done(function(){
                var URL = location.href.replace(/\/all(.*)/, '') + "/all";
                location.href = URL;
            });

    });
    //change brand
    $("#brand-select").change(function(){
       var brand_id = $(this).val();
       var url = location.href.replace(/\/all(.*)/, '') + "/all";
       //log(url);
       location.href = (brand_id > 0) ? url + "?bid=" + brand_id : url;
    });

    $("#searching").create_search_box();

    $("#input_stock_code").create_type_ahead_input();

    //create datepicker
    if( $("#input_stock_date").length > 0){
        $("#input_stock_date").datepicker({ format: "dd-mm-yyyy" });
        $(".datepicker").css("z-index", "9999");
    }
    if($(".icon-calendar").length > 0){
        $(".icon-calendar").click(function(){
            $("#input_stock_date").datepicker("show");
        });
    }
    /*$ALL_PAGE*/
    //input message
    $("#stock input").focus(function(){
        var description = $(this).attr("data-description");
        if(!description)
            description  = $(this).attr("placeholder");
        $("#stock-input-msg").text(description);
    });

    //change stock image thumbnail
    $("#stock_image_url").keyup(function(){
       $("#stock_image_thumbnail").attr("src", $(this).val());
    });
    //
    $("#input_stock_code").change(function(){
        var stock_code = $(this).val();
        var search_url = $("#add-stock-form").attr("data-search-ajax");
        $.post(search_url, {action: "get_product_by_code", product_code: stock_code})
            .done(function(d){
                if(d != "ERROR"){
                     r = $.parseJSON(d);
                    $("#input_stock_name").val(r.Product.product_name);
                    $("#input_brand_id").val(r.Product.brand_id);
                    $("#input_stock_model").val(r.Product.product_model);
                    $("#input_stock_price").val(r.Product.product_sell_price);
                }else{

                }
            }).fail(function(j, q){error(q)});
    });
    //add stock
    $("#add-stock-form").post_form(function(d){
        $("#add-stock").show("hide");
        location.reload();
    });

    //edit stock
    $("#edit-stock-form").post_form(function(d){
        $("#edit-stock-form").message_box("success", "Lưu thành công!");
    });


    //effect for stock table
    $("#stock-table  tr").hover(function(){
        $(this).addClass("info");
    },function(){
        $(this).removeClass("info");
    });

});
// JavaScript Document
//@author: quantm.tb@gmail.com
//@require: jquery 1.10.1,bootstrap 2.3.2

window.__DEBUG__ = true;

function pr(object){
    //print raw level 1 object
    var output = '';
    for (var p in object) {
        output += p + ' => ' + object[p]+'\n ';
    }
    console.log(output);
    //return output;
}

function make_id(len, prefix)
{
    prefix = prefix || false;
    len = len || 5;
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < len; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return prefix ? (prefix + '_' + text) : text;
}

function get_param_by_name(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

Number.prototype.formatMoney = function(c, d, t){
    var n = this,
        c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

function get_sort_field(){
    var URL = location.href;
    var temp = URL.match(/\/sort:(.*?)\//);
    if(temp){
        var sort = temp[1].split(".");
        return (sort == null) ? null : sort[1];
    }
    return null;
}

function get_sort_direction(){
    return (location.href.indexOf(":asc") != -1) ? "asc" : "desc";
}

function get_form_data(form_selector){
    var  data = {};
    var index = 1;
    //get input data
    $(form_selector + " input").each(function(){
        var name = $(this).attr("name");
        var type = $(this).attr("type");
        if(!name) throw("#err: Expected name attribute at input no." + index);
        if(!type) throw("#err: Expected type attribute at input no." + index);
        index++;
        if(type == "file")
            return true;
        if(type == "checkbox"){
            data[name] = $(form_selector + ' input[name="' + name + '"]').is(":checked") ? 1 : 0;
            return true;
        }
        if(type == "radio"){
            data[name] = $(form_selector + ' input[name="' + name + '"]:checked').val();
            return true;
        }

        data[name] = $(this).val();
    });
    //get select data
    index = 1;
    $(form_selector + " select").each(function(){
        var name = $(this).attr("name");
        if(!name) throw("#err: Expected name attribute at select no." + index);
        data[name] = $(this).val();
        index++;

    });
    //get text area data
    index = 1;
    $(form_selector + " textarea").each(function(){
        var name = $(this).attr("name");
        if(!name) throw("#err: Expected name attribute at textarea no." + index);
        data[name] = $(this).val();
        index++;
    });
    //pr(data);
    return data;
}

function error(q){
    alert("Có lỗi không xác định!");
    console.warn(q);
}

function log(s){
    console.log(s);
    //return s;
}

function _W(s){
    if(__DEBUG__)
        console.warn(s);
    return false;
}

function _L(s){
    if(__DEBUG__)
        console.log(s);
    return true;
}


function get_ajax_tag(tag_name, s){
    var m = s.match(new RegExp('<' + tag_name + '>(.*?)<\/' + tag_name + '>'));
    return (m) ? m[1] : '';
}

(function($){
    /*
    * @param:
    * ck_editor: CKEDITOR INSTANCE
    * reload: true/false, reload browser after upload.
    * */
    $.fn.create_upload_image = function(reload){
        if(!this.length)
            return _W("*fn aborted: create_upload_image(): " + this.selector + " is n/a!");

        if(typeof reload == "undefined")
            return _W("*fn aborted: create_upload_image(): reload is_undefined");

        var self = this;
        var upload_url = self.attr("data-upload-url");
        var album_id = self.attr("data-album-id");
        var webroot  = self.attr("data-webroot");
        if(!webroot)
            throw("#error: data-webroot is undefined!");
        var image_input_element = self.attr("data-input-url-element");
        if(!upload_url)
            throw("#error: please insert data-upload-url attribute!");
        if(!album_id)
            album_id = 0;
        var upload_btn = ' <a id="qt-upload-btn"  class="btn btn-small"><i class="icon-picture"></i>&nbsp;&nbsp;Tải ảnh lên</a>';
        var upload_input = '<input type="file" id="qt-upload-input"  style="visibility: hidden; width: 1px; height: 1px" />';
        var upload_progress = '<br/><em id="qt-upload-progress"></em>';
        var progress_bar = '<div id="qt-progress-bar" class="progress" style="display: none;"> <div id="qt-progress-percent" class="bar" style="width: 0%;"></div></div>';
        self.append(upload_btn);
        self.append(upload_input);
        self.append(upload_progress);
        self.append(progress_bar);
        $("#qt-progress-bar").height(10);
        $("#qt-progress-bar").width(200);

        $(document).on("click","#qt-upload-btn",function(){
            $("#qt-upload-input").click();
        });
        $(document).on("change","#qt-upload-input",function(){
            var file = this.files[0];
            if(file.type != "image/jpeg" && file.type != "image/png" &&  file.type != "image/jpg"){
                alert("Chỉ chấp nhận .JPEG, .JPG, .PNG")
                return;
            }
            if(file.size > 1048576){
                alert("Kích thước file "+file.size+" > 1048576 (1MB)");
                return;
            }

            var xhr = new XMLHttpRequest();
            if (xhr.upload) {

                var progress = self.get(0);/*document.body.appendChild(document.createElement("p"));*/

                // progress bar
                xhr.upload.addEventListener("progress", function(e) {
                    var pc = parseInt(e.loaded / e.total * 100);
                    $("#qt-progress-bar").show();
                    $("#qt-upload-progress").text("Uploading: " + pc + " %");
                    $("#qt-progress-percent").css("width",pc+"%");
                }, false);


                // file received/failed
                xhr.onreadystatechange = function(e) {
                    if (xhr.readyState == 4) {
                        if(xhr.status == 200){

                            console.log(xhr.responseText);
                            //HTTP SUCCESS
                            //$("#qt-progress-bar").hide();
                            $("#qt-upload-progress").text("Upload success!");

                            if(reload)
                                return location.reload();
                            var result = xhr.responseText.match(/<src>(.*?)<\/src>/);
                            if(typeof result != "undefined"){

                                var image_url = "http://"+location.hostname + webroot + result[1];
                                if(image_input_element){
                                    $(image_input_element).val(image_url);
                                    $(image_input_element).keyup();
                                }
                                if(typeof CKEDITOR == "undefined")
                                    throw("#error: CKEDITOR is undefined!");
                                CKEDITOR.instances.editor1.insertHtml('<img height="300" width="300" src="'+image_url+'"/><br/>');
                            }
                        }else{
                            //$("#qt-progress-bar").hide();
                            $("#qt-progress-percent").css("width","0%");
                            if(xhr.status == 400) //BAD REQUEST
                                $("#qt-upload-progress").text("File size too big or wrong file type!");
                            else
                                $("#qt-upload-progress").text("Something went wrong!");
                        }
                        //console.log(xhr.responseText);
                    }
                };

                // start upload
                xhr.open("POST", upload_url, true);
                //xhr.setRequestHeader("X_ALBUM_ID",album_id);
                xhr.setRequestHeader("X_FILENAME", file.name);
                xhr.send(file);


            }
        });
    }

    /*
     * @param:
     * type: alert-error, alert-success, alert-info
     * message: message to show
     * @return: void
     * */
    $.fn.message_box = function(type, message){
        if(!this.length)
            return _W("*fn: message_box(): " + this.selector + " is n/a!");

        type = (type.indexOf("alert") == -1) ? "alert-" + type : type;
        $("#message_box").remove();
        var message_box = '<div id="message_box" style="display: none;" class="alert '+type+'">'+message+'<br/><em style="font-size: 11px;">Click to hide message</em></div>';
        this.prepend(message_box);
        $("#message_box").fadeIn();
        $(document).on("click","#message_box",function(){
            $(this).fadeOut();
        });
    }

    /*
    * @: create search box with auto suggestion
    * */

    $.fn.create_search_box = function(){
        if(!this.length)
            return _W("*fn aborted: create_search_box(): " + this.selector + " is n/a!");

        var search_url = this.attr("data-search-ajax");
        var action = this.attr("data-action");
        var base_url = this.attr("data-base-url");
        if(!search_url || !action  || !base_url)
            return _W("*fn aborted: create_search_box():" + this.selector + " Missing data-search-ajax, data-action or base-url!");

        this.html("");
        var input_id = make_id(32);
        var form_id =  make_id(33);
        var search_form = '<form id="' + form_id + '"class="form-search">';
        var input = '<input id= "' + input_id + '" type="text" style="height: 16px;font-size: 11px;" placeholder="Gõ để tìm kiếm">';
        var search_btn = '<button type="submit" class="btn btn-small"><i class="icon-search"></i></button></form>';
        this.append(search_form + input + search_btn);
        //set typeahead source
        var auto_suggest_list = [];
        $("#" + input_id).typeahead({source: auto_suggest_list});

        //auto suggestion for search input
        $("#" + input_id).keyup(function(e){
            if(e.which == 13){
                var key = $(this).val();
                key = ($.trim(key)).replace(/( )/g, '+');
                location.href = base_url + "?" + action + "=" + key;
                return;
            }
            var data = {action: action, key: $(this).val()};
            $.post(search_url, data)
                .done(function(d){
                    var r = $.parseJSON(d);
                    for(var i in r){
                        if(auto_suggest_list.indexOf(r[i]) == -1){
                            auto_suggest_list.push(r[i]);
                        }
                    }
                });
        });

        $("#" + form_id).submit(function(e){
            e.preventDefault();
            var key = $("#" + input_id).val();
            key = ($.trim(key)).replace(/( )/g, '+');
            location.href = base_url + "?" + action + "=" + key;
        });
        //on form submit
    }


    $.fn.create_type_ahead_input = function(fn){
        if(!this.length)
            return _W("*fn: create_type_ahead_input(): " + this.selector + " is n/a!");

        if(!this.is("input"))
            return _W("*fn: create_type_ahead_input(): " + this.selector + " is not a input!");

        var self = this;
        var search_url = self.attr("data-search-ajax");
        var action = self.attr("data-action");
        if(!search_url || !action )
            return _W("*fn: create_type_ahead_input(): Missing data-search-ajax or data-action " + this.selector);

        var auto_suggest_list = [];
        self.typeahead({source: auto_suggest_list});
        self.keyup(function(e){
            if(e.which == 13){
                if(typeof fn == "function")
                    fn.call(self, self.val());
                return;
            }
            var data = {action: action, key: self.val()};
            $.post(search_url, data)
                .done(function(d){
                    var r = $.parseJSON(d);
                    for(var i in r){
                        if(auto_suggest_list.indexOf(r[i]) == -1){
                            auto_suggest_list.push(r[i]);
                        }
                    }
                });
        });
    }

    /*
    * @: create sortable table
    * @param: none
    * */

    $.fn.create_sort_table = function(){
        if(!this.length)
            return _W("*fn: create_sort_table(): " + this.selector + " is n/a!");

        var self = this;
        var trow = self.selector;
        var base_url = self.attr("data-base-url");
        var sort_type = get_sort_direction();
        var _sort_type_tmp = (sort_type == "desc") ? "asc" : "desc";
        if(!base_url)
            return _W("*fn: create_sort_table(): data-base-url  is undefined!");

        //browse a element to find data-model, data-
        $(trow +" a").each(function(){
            var id = $(this).parent().attr("id");
            var model = $(this).parent().attr("data-model");
            if(!id || !model)
                return;
            $(this).attr("href", base_url + "/sort:" + model + "." + id + "/direction:" + _sort_type_tmp);
        });

        //apply display for sorted column
        var sort = get_sort_field();
        var sort_icon = (sort_type == "asc")?'<i class="icon-arrow-down">':'<i class="icon-arrow-up">';
        if(sort){
            $("#"+sort).append(sort_icon);
            $("#"+sort).css("background-color","#e0e0e0");
        };
    }

    /*
    * @: submit form via ajax
    * selector must be a form
    * */

    $.fn.post_form = function(fn){
        if(!this.length)
            return _W("*fn: post_form(): " + this.selector + " is n/a!");


        var self = this;
        var HREF = self.attr("data-href");
        if(!HREF){
            HREF = location.href;
            _L('*fn: post_form(): data-href is undefined, use current href: "' + HREF + '" instead');
        }
        this.submit(function(e){
            e.preventDefault();
            var data = get_form_data(self.selector);
            $.post(HREF, data)
                .done(function(d){
                   if(d == "SUCCESS"){
                       fn(data);//call back function
                   }else{
                       var msg = d.replace(/<br>$/, '');
                       self.message_box("alert-error", msg);
                   }
                }).fail(function(j, q){error(q)});
        });
        return self;
    }

    $.fn.create_filter_by_month_year = function(start_year, end_year){
        start_year = start_year || 1990;
        end_year   = end_year   || 2100;
        var current_month = get_param_by_name("filter_by_month");
        var current_year  = get_param_by_name("filter_by_year");
        if(!current_month) current_month = 0;
        if(!current_year)  current_year = 0;
        var url = location.href.replace(/\/all(.*)/, '') + "/all";
        var month_id = make_id(33, "filter_by_month");
        var year_id  = make_id(34, "filter_by_year");

        //generate month select
        var element = '&nbsp;&nbsp;Tháng: <select style="width:110px;" id="' + month_id + '">';
        element += '<option value="0">Không có</option>';
        for(var i = 1; i <= 12; i++){
            element += '<option value="' + i + '">Tháng ' + i + '</option>';
        }
        element += '</select>';

        //generate year select
        element += '&nbsp;&nbsp;Năm: <select style="width:110px;" id="' + year_id + '">';
        element += '<option value="0">Không có</option>';
        for(var i = start_year; i <= end_year; i++){
            element += '<option value="' + i + '">' + i + '</option>';
        }

        //dispay and set current value
        this.append(element);
        $("#" + month_id).val(current_month);
        $("#" + year_id).val(current_year);
        //redirect to selected value!
        var group_selector = "#" + month_id + ", #" + year_id;
        $(document).on("change", group_selector, function(){
            var v_year = $("#" + year_id).val();
            var v_month = $("#" + month_id).val();
            if(v_year == 0 && v_month == 0)
                return (location.href = url);
            if(v_year == 0 && v_month > 0)
                return (location.href = url + "?filter_by_month=" + v_month);
            if(v_year > 0 && v_month == 0)
                return (location.href = url + "?filter_by_year=" + v_year);
            location.href = url + "?filter_by_month=" + v_month + "&filter_by_year=" + v_year;
        });
    }

    $.fn.create_custom_filter  = function(){
        var filter_name = this.attr("data-filter-name");
        if(!filter_name)
            return _W("*fn: create_custom_filter(): data-filter-name is undefined");
        var select_data = this.attr("data-select");
        if(!select_data)
            return _W("*fn: create_custom_filter(): data-select is undefined");
        var obj = null;
        try{
             obj = $.parseJSON(select_data);
        }catch(e){return _W("create_custom_filter(): data-select must be json")}
        var current_value = get_param_by_name(filter_name);
        if(!current_value)
            current_value = 0;
        //generate select
        var id = make_id(32, filter_name);
        var element = '<select style="width:120px;" id="' + id + '">';
        element += '<option value="0">Không có</option>';
        for(o in obj){
            element += '<option value="' + o + '">' + obj[o] +'</option>';
        }
        element += '</select>';
        //display select
        this.append(element);
        $("#" + id).val(current_value);
        $(document).on("change", "#" + id, function(){
            var _value = $(this).val();
            var url = location.href.replace(/\/all(.*)/, '') + "/all";
            return (_value == 0) ? (location.href=url) : (location.href = url + "?" + filter_name + "=" + _value);
        });
    }

    $.fn.create_upload_panel = function(fn){
        if(!this.length)
            return _W("*fn aborted: create_upload_panel(): " + this.selector + " is n/a!");

        var self = this;
        var upload_url = self.attr("data-upload-url");
        var album_id = self.attr("data-album-id");
        var webroot  = self.attr("data-webroot");
        if(!webroot)
            return _W("create_upload_panel: data-webroot is undefined!");
        if(!upload_url)
            return _W("create_upload_panel: please insert data-upload-url attribute!");
        if(!album_id)
            album_id = 0;
        var btn_id = make_id(32);
        var file_input_id = make_id(33);
        var text_id  = make_id(34);
        var bar_id    = make_id(35);

        var upload_btn = ' <a id="' + btn_id+ '"  class="btn btn-small"><i class="icon-picture"></i>&nbsp;&nbsp;Tải ảnh lên</a>';
        var upload_input = '<input name="temporary" type="file" id="' + file_input_id + '"  style="visibility: hidden; width: 1px; height: 1px" />';
        var upload_progress = '<br/><em id="' +text_id + '"></em>';
        var progress_bar = '<div id="' + bar_id +'" class="progress" style="display: none;height: 10px; width: 200px;"> <div  class="bar" style="width: 0%;"></div></div>';
        self.append(upload_btn + upload_input + upload_progress + progress_bar);


        $(document).on("click", "#" + btn_id,function(){
            $("#" + file_input_id).click();
        });
        $(document).on("change", "#" + file_input_id, function(){
            var file = this.files[0];
            //
            if(["image/jpeg", "image/png","image/jpg"].indexOf(file.type) == -1){
                alert("Chỉ chấp nhận .JPEG, .JPG, .PNG")
                return;
            }
            if(file.size > 1048576){
                alert("Kích thước file " + file.size+" > 1048576 (1MB)");
                return;
            }

            var xhr = new XMLHttpRequest();
            if (xhr.upload) {
                var progress = self.get(0);/*document.body.appendChild(document.createElement("p"));*/
                // progress bar
                xhr.upload.addEventListener("progress", function(e) {
                    var pc = parseInt(e.loaded / e.total * 100);
                    $("#" + bar_id).show();
                    $("#" + text_id).text("Uploading: " + pc + " %");
                    $("#" + bar_id + " .bar").css("width", pc+"%");
                }, false);


                // file received/failed
                xhr.onreadystatechange = function(e) {
                    if (xhr.readyState == 4) {
                        if(xhr.status == 200){
                            //console.log(xhr.responseText);
                            $("#" + text_id).text("Upload success!");
                            var ret_img = "http://" + location.hostname + webroot + get_ajax_tag("src", xhr.responseText);

                                fn.call(self, ret_img); //xhr.responseText
                        }
                    }
                };

                // start upload
                xhr.open("POST", upload_url, true);
                //xhr.setRequestHeader("X_ALBUM_ID",album_id);
                xhr.setRequestHeader("X_FILENAME", file.name);
                xhr.send(file);


            }
        });
        return self;
    }

})(window.jQuery);// JavaScript Document
(function ($) {
    "use strict";

    var Finditem = function (options) {
        this.init('finditem', options, Finditem.defaults);
    };

    //inherit from Abstract input
    $.fn.editableutils.inherit(Finditem, $.fn.editabletypes.abstractinput);

    $.extend(Finditem.prototype, {
        /**
        Renders input from tpl

        @method render()
        **/
        render: function() {
           this.$input = this.$tpl.find('input');
        },

        /**
        Default method to show value in element. Can be overwritten by display option.

        @method value2html(value, element)
        **/
        value2html: function(value, element) {
            if(!value) {
                $(element).empty();
                return;
            }
            var html = $('<div>').text(value.title).html() + ', ' + $('<div>').text(value.price).html() +
            $('<div>').text(value.location).html();
            $(element).html(html);
        },

        /**
        Gets value from element's html

        @method html2value(html)
        **/
        html2value: function(html) {
          /*
            you may write parsing method to get value by element's html
            e.g. "Moscow, st. Lenina, bld. 15" => {title: "Moscow", price: "Lenina", location: "15"}
            but for complex structures it's not recommended.
            Better set value directly via javascript, e.g.
            editable({
                value: {
                    title: "Moscow",
                    price: "Lenina",
                    location: "15"
                }
            });
          */
          return null;
        },

       /**
        Converts value to string.
        It is used in internal comparing (not for sending to server).

        @method value2str(value)
       **/
       value2str: function(value) {
           var str = '';
           if(value) {
               for(var k in value) {
                   str = str + k + ':' + value[k] + ';';
               }
           }
           return str;
       },

       /*
        Converts string to value. Used for reading value from 'data-value' attribute.

        @method str2value(str)
       */
       str2value: function(str) {
           /*
           this is mainly for parsing value defined in data-value attribute.
           If you will always set value by javascript, no need to overwrite it
           */
           return str;
       },

       /**
        Sets value of input.

        @method value2input(value)
        @param {mixed} value
       **/
       value2input: function(value) {
           if(!value) {
             return;
           }
           this.$input.filter('[name="title"]').val(value.title);
           this.$input.filter('[name="price"]').val(value.price);
           this.$input.filter('[name="location"]').val(value.location);
       },

       /**
        Returns value of input.

        @method input2value()
       **/
       input2value: function() {
           return {
              title: this.$input.filter('[name="title"]').val(),
              price: this.$input.filter('[name="price"]').val(),
              location: this.$input.filter('[name="location"]').val()
           };
       },

        /**
        Activates input: sets focus on the first field.

        @method activate()
       **/
       activate: function() {
            this.$input.filter('[name="title"]').focus();
       },

       /**
        Attaches handler to submit form in case of 'showbuttons=false' mode

        @method autosubmit()
       **/
       autosubmit: function() {
           this.$input.keydown(function (e) {
                if (e.which === 13) {
                    $(this).closest('form').submit();
                }
           });
       }
    });

    Finditem.defaults = $.extend({}, $.fn.editabletypes.abstractinput.defaults, {
        tpl: '<div class="form-group"><label><input type="text" name="title" class="form-control" ></label></div>'+
             '<div class="form-group"><label><input type="text" name="price" class="form-control" ></label></div>'+
             '<div class="form-group"><label><input type="text" name="location" class="form-control" ></label></div>',

        inputclass: ''
    });

    $.fn.editabletypes.finditem = Finditem;

}(window.jQuery));

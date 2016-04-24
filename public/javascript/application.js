$(document).ready(function() {

  // var selected_category = 0
  //
  // $('#category-select').change(function(ev){
  //   var category_id = $("#category-select option:selected").data("category-id")
  //
  //   if (category_id == 0){
  //     $(".masonryImage").show("fast");
  //     selected_category = 0
  //   } else if (selected_category == category_id){
  //     return
  //   } else {
  //   $hidden_items = $(".masonryImage").filter(function(){
  //     if(selected_category == 0){
  //       return $(this).data("category-id") != category_id
  //   } else {
  //       return $(this).data("category-id") == selected_category
  //   }
  //   })
  //   $hidden_items.hide("fast");
  //   $hidden_items.removeClass("masonryImage")
  //
  //   $shown_items = $(".masonryImage").filter(function(){
  //     return $(this).data("category-id") == category_id
  //   })
  //   $shown_items.show("fast");
  //
  //   selected_category = category_id;
  //   }
  //
  //   var $container = $('.masonry-container')
  //   var arr = new Array();
  //   $container.masonry('hide', arr.push($hidden_items))
  //   $container.masonry('layout').masonry();
  //   console.log($hidden_items);
    //$container.masonry('reloadItems')
    //
    // console.log("masonry-container " + $(".masonry-container").length);
    // if($(".masonry-container").length > 0){
    //   var $container = $('.masonry-container').masonry({
    //     percentPosition: true,
    //     itemSelector: $(".masonryImage").filter(function(){
    //       return $(this).data("category-id") == category_id
    //     }),
    //     columnWidth: '.grid-sizer',
    //     gutter:10
    //   });
    //   // layout Masonry after each image loads
    //   $container.imagesLoaded().progress( function() {
    //     $container.masonry('layout');
    //   });
    //}
  // });

  $('.collapse').collapse('toggle');
    $('.image-popup-fit-width').magnificPopup({
      type: 'image',
      closeOnContentClick: true,
      image: {
        verticalFit: false
      }
    });

    if($("#container").length > 0){
      var $container = $('#container').masonry({
        percentPosition: true,
        itemSelector: '.masonryImage',
        columnWidth: '.grid-sizer',
        gutter:10
      });
      // layout Masonry after each image loads
      $container.imagesLoaded().progress( function() {
        $container.masonry('layout');
      });
    }


  // like button listener
  $(".like-button").click(function(ev){
    var like_button = $(this);
    var user_id = $("#user-id").attr("data-user-id");

    // Return unless user logged in
    if (!user_id) return;

    var item_id = $(this).attr("data-item-id");
    var likes_url = 'http://localhost:3000/likes'

    //the .hasClass method doesn't work for SVG objects
    if (/(^|\s)is-liked(\s|$)/.test(like_button.attr("class"))){

      like_button.attr('class', like_button.attr("class").replace(" is-liked", ""));

      $(".likes-count-" + String(item_id)).text(String(parseInt($(this).siblings(".likes-count-" + String(item_id)).text()) - 1));

      $.post(
        likes_url,
        {
          item_id: item_id,
          user_id: user_id
        },
        'json'
      )
      .done(function(resp){
      })
      .fail(function(err){
      });

    } else {
      like_button.attr('class', like_button.attr("class") + ' is-liked');
      $(".likes-count-" + String(item_id)).text(String(parseInt($(this).siblings(".likes-count-" + String(item_id)).text()) + 1));
      $.post(likes_url, {
        item_id: item_id,
        user_id: user_id
      })
      .then(function(resp){})
      .fail(function(err){});
    }
  });

  $('#postNewSpot')
      .bootstrapValidator({
          message: 'This value is not valid',
          feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
              title: {
                  message: 'The title is not valid',
                  validators: {
                      notEmpty: {
                          message: 'Please enter a title'
                      },
                      stringLength: {
                          max: 50,
                          message: 'Character limit of 50'
                      }
                  }
              },
             description: {
                 message: 'The description is not valid',
                 validators: {
                     notEmpty: {
                         message: 'Please enter a description'
                     },
                     stringLength: {
                         max: 300,
                         message: 'Character limit of 300'
                     }
                 }
             },
              image: {
                  message: 'The image is not valid',
                  validators: {
                      notEmpty: {
                          message: 'Please upload an image'
                      }
                  }
              },
              location: {
                  message: 'The image is not valid',
                  validators: {
                      notEmpty: {
                          message: 'Please enter a location'
                      }
                  }
              },

          }
      })
      $('#loginForm')
          .bootstrapValidator({
              message: 'This value is not valid',
              feedbackIcons: {
                  valid: 'glyphicon glyphicon-ok',
                  invalid: 'glyphicon glyphicon-remove',
                  validating: 'glyphicon glyphicon-refresh'
              },
              fields: {
                  username: {
                      message: 'The username is not valid',
                      validators: {
                          notEmpty: {
                              message: 'Please enter your username'
                          }
                      }
                  },
                 password: {
                     message: 'The password is not valid',
                     validators: {
                         notEmpty: {
                             message: 'Please enter your password'
                         }
                     }
                 }

              }
          })
          $('#postNewComment')
              .bootstrapValidator({
                  message: 'This value is not valid',
                  feedbackIcons: {
                      valid: 'glyphicon glyphicon-ok',
                      invalid: 'glyphicon glyphicon-remove',
                      validating: 'glyphicon glyphicon-refresh'
                  },
                  fields: {

                      text: {
                          message: 'The text is not valid',
                          validators: {
                              notEmpty: {
                                  message: 'Please enter a comment'
                              }
                          }
                      }

                  }
              })
          $('#signupForm')
              .bootstrapValidator({
                  message: 'This value is not valid',
                  feedbackIcons: {
                      valid: 'glyphicon glyphicon-ok',
                      invalid: 'glyphicon glyphicon-remove',
                      validating: 'glyphicon glyphicon-refresh'
                  },
                  fields: {

                      email: {
                          message: 'The email is not valid',
                          validators: {
                              notEmpty: {
                                  message: 'Please enter your email address'
                              }
                          }
                      },
                      name: {
                          message: 'The name is not valid',
                          validators: {
                              notEmpty: {
                                  message: 'Please enter your name'
                              }
                          }
                      },
                      username: {
                          message: 'The username is not valid',
                          validators: {
                              notEmpty: {
                                  message: 'Please enter your username'
                              }
                          }
                      },
                      password: {
                          message: 'The password is not valid',
                          validators: {
                              notEmpty: {
                                  message: 'Please enter your password'
                              },
                              identical: {
                                  field: 'password_confirmation',
                                  message: 'Password confirmation was not a match'
                              }
                          }
                      },
                      password_confirmation: {
                          message: 'The username is not valid',
                          validators: {
                              notEmpty: {
                                  message: 'Please enter your password confirmation'
                              },
                              identical: {
                                  field: 'password',
                                  message: 'Password confirmation was not a match'
                              }
                          }
                      },

                  }
              })
      .on('error.field.bv', function(e, data) {
          var messages = data.bv.getMessages(data.field);
          $('#errors').find('li[data-bv-for="' + data.field + '"]').remove();
          for (var i in messages) {
              $('<li/>').attr('data-bv-for', data.field).html(messages[i]).appendTo('#errors');
          }
          $('#errors').parents('.form-group').removeClass('hide');
      })
      .on('success.field.bv', function(e, data) {
          $('#errors').find('li[data-bv-for="' + data.field + '"]').remove();
      })
      .on('success.form.bv', function(e) {
          $('#errors')
              .html('')
              .parents('.form-group').addClass('hide');
      });


});

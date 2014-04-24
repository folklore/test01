// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){

  $("#uploader").plupload({
    runtimes : 'html5,flash,silverlight,html4',
    url : "/images",
    rename : true,
    multipart: true,

    preinit: attachCallbacks,

    multipart_params: {
      "authenticity_token" : $('meta[name="csrf-token"]').attr('content')
    },

    filters : {
      mime_types: [
        { title : "Image files", extensions : "jpg,gif,png" }
      ]
    },

    file_name: 'image[title]',
    file_data_name: 'image[file]',

    rename: true
  });

  function attachCallbacks(uploader) {
    uploader.bind('FileUploaded', function(Up, File, Response){
      $('#images').prepend(Response.response);
    });
  }

});
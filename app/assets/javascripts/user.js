$(document).on('turbolinks:load', function(){
    $(document).on('keyup', '#form', function(e){
      e.preventDefault();
      var input = $.trim($(this).val());
      $.ajax({
        url: '/users/search',
        type: 'GET',
        data: ('keyword=' + input),
        processData: false,
        contentType: false,
        dataType: 'json'
      })

      .done(function(data){
        $('#result').find('tr').remove();
        $(data).each(function(i, user){
          $('#result').append('<tr>' + '<td>' + user.profile_image + '</td>' + '</tr>'
              )
        });
      })
    });
  });

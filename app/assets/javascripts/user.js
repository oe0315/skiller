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
                $('#result').append(
                    '<tr>' + '<td>' + '<a href="/users/' + user.id + '">' + '<img src ="' + user.profile_image.url + '"width=64 height=64 class="rounded-circle" onerror="this.onerror = null; this.src=' + "'no-image-icon.jpg'" + '">' + '</a>' + '</td>'
                    + '<td>' + user.nickname + '</td>'
                    + '<td>' + user.skill + '</td>'
                    + '<td>' + user.second_skill + '</td>'
                    + '<td>' + user.introduction + '</td>'
                    + '</tr>'
                    )
            });
      })
    });
  });
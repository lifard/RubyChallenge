$(function() {
  $('.like .fa').click(function(){

    var id = $(this).data('news-id')
    var likedStatus = $(this).data('like-status')
    if ( likedStatus != 'reset' ) {
      $.ajax({
        url: "/update_liked_status/" + likedStatus + "/" + id,
        method: 'PUT'
      })

      hideLikeText($(this));
      showResultedLikeStatus($(this));
      changeHeartClass($(this), likedStatus);
    }
  })
})

function hideLikeText(selector){
  selector.parent('.text').addClass('hidden');
}

function showResultedLikeStatus(selector){
  selector.parent().next().removeClass('hidden');
}

function changeHeartClass(selector, likedStatus){
  resultedSelector = selector.parent().next()
  if ( likedStatus == 'liked' ) {
    resultedSelector.addClass('red-heart');
  }
}

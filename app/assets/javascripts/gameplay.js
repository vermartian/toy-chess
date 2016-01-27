$('#chessboard td').click(function() {
  $this = $(this)
  var isSelected = $('#chessboard td').hasClass('selected');

  if (isSelected) {

    var $piece = pieceSelected();

    if ($piece.data('piece_id') === $this.data('piece_id')) {
      pieceDeselect($this);
    }
    else {
      makeMove($piece, $this)
    }
  }
  else {
    pieceSelect($this);
  };

});

function pieceSelect($piece) {
  $piece.addClass('selected');
};
function pieceDeselect($piece) {
  $piece.removeClass('selected');
};
function pieceSelected() {
  return $('#chessboard td.selected');
};
function makeMove($piece, $droppedOn) {
  pieceDeselect($piece);
  var piece = {
      id: $piece.data('piece_id'),
      x: $droppedOn.data('x'),
      y: $droppedOn.data('y')
  }
};
$(function(){
  $('img').draggable({ containment: "page", revert: 'invalid' });
});
$(function(){
  $('td').droppable({
    drop: function(ev, ui) {
      var dropped = ui.draggable;
      var droppedOn = $(this);
      if (droppedOn.find("img").data('color') == true){
        droppedOn.find("img").css({top: 0, left: 0}).appendTo("#bgrave td");
      } else {
        droppedOn.find("img").css({top: 0, left: 0}).appendTo("#wgrave td");
      };
      // if (droppedOnPiece.length > 0) {
      //   $("<td>"+droppedOnPiece[0]+"<td>");
      // };
      $(droppedOn).droppable("disable");
      $(dropped).parent().droppable("enable");
      $(dropped).detach().css({top: 0, left: 0}).appendTo(droppedOn);
      $(droppedOn).droppable("enable");
    }
  });
});
// $('td').not('td:empty').droppable("disable");

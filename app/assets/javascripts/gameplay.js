$('#chessboard td').click(function() {
  $this = $(this)
  var isSelected = $('#chessboard td').hasClass('selected');

  if (isSelected) {

    var $piece = pieceSelected();

    if ($piece.data('piece') === $this.data('piece')) {
      pieceDeselect($this);
    }
    else {
      makeMove($piece)
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
  var piece = {
      id: $piece.data('piece'),
      x: $droppedOn.data('x'),
      y: $droppedOn.data('y')
  }
  pieceDeselect($piece);
  piece.addClass('selected');
  $()
  // var child = document.getElementById("p1");
  // var para = document.getElementById("p2");
  // parent.replaceChild(para,child);
};
$(function(){
  $('img').draggable({ containment: "page", revert: 'invalid' });
});
$(function(){
  $('td').droppable({
    drop: function(ev, ui) {
        var dropped = ui.draggable;
        var droppedOn = $(this);
        var droppedOnPiece = droppedOn.find("img").detach().css({top: 0, left: 0});
        debugger
        $("#wgrave").append("<td>"+droppedOnPiece[0]+"<td>");
        $(droppedOn).droppable("disable");
        $(dropped).parent().droppable("enable");
        // $(droppedOn).child().remove;
        $(dropped).detach().css({top: 0, left: 0}).appendTo(droppedOn);
        $(droppedOn).droppable("enable");
    }
  });
});
// $('td').not('td:empty').droppable("disable");

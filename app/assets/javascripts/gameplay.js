  $('#chessboard td').click(function() {
    $this = $(this)
    var isSelected = $('#chessboard td').hasClass('selected');
    if (isSelected) {

      var $piece = pieceSelected().find("img");

      if ($piece.data('piece-id') == $this.find("img").data('piece-id')) {
        pieceDeselect($this);
      }
      else {
        if($piece.data('color') != $this.find("img").data('color') && $piece.data('color') != undefined){
          makeMove($piece, $this)
        }else{
          pieceDeselect(pieceSelected())
          pieceSelect($this);
        };
      };
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
  function makeMove($piece, $target) {
    var piece = {
        id: $piece.data('piece-id'),
        x: $target.data('x'),
        y: $target.data('y')
    };
    if($target.find('img').length > 0){
      var deadpiece = {
        id: $target.find('img').data('piece-id'),
        x: 8,
        y: 8,
        state: 'off'
      };
      killPiece(deadpiece)
    };
    updatePiece(piece)
  };
  function pieceImg(piece, fig, color) {
    return "<img data-piece-id='"+piece.id+"' data-color='"+color+"' src='https://s3.amazonaws.com/toy-chess/"+fig+"'/>";
  };

  function updatePiece(piece) {
    $.ajax({
      type: 'PATCH',
      url: '/pieces/' + piece.id,
      dataType: 'json',
      data: {
        piece: piece
      },
      success: function(data) {
        var piece = data.piece;
        var fig = data.fig;
        var color = data.piece.color;
        var pieceimg = pieceImg(piece, fig, color);
        var target = $("td[data-y='" + piece.y +"'][data-x='" + piece.x + "']")
        $("td.selected").find('img').remove();
        $("td.selected").removeClass('selected');
        target.append(pieceimg);
      }
    });
  };
  function killPiece(piece) {
    $.ajax({
      type: 'PATCH',
      url: '/pieces/' + piece.id,
      dataType: 'json',
      data: {
        piece: piece
      },
      success: function(data) {
        var piece = data.piece;
        var fig = data.fig;
        var color = data.piece.color;
        var x = data.piece.x;
        var y = data.piece.y;
        var pieceimg = pieceImg(piece, fig, color);
        $("img[data-piece-id='" + piece.id +"']").remove();
        if (color){
          $(pieceimg).css({top: 0, left: 0}).appendTo("#bgrave td");
        } else {
          $(pieceimg).css({top: 0, left: 0}).appendTo("#wgrave td");
        };
      }
    });
  };
//   $(function(){
//     $('img').draggable({ containment: "page", revert: 'invalid' });
//   });
//
//   $(function(){
//     $('td').droppable({
//       drop: function(ev, ui) {
//         var dropped = ui.draggable;
//         var droppedOn = $(this);
//         if (droppedOn.find("img").data('color') == true){
//           droppedOn.find("img").css({top: 0, left: 0}).appendTo("#bgrave td");
//         } else {
//           droppedOn.find("img").css({top: 0, left: 0}).appendTo("#wgrave td");
//         };
//         // if (droppedOnPiece.length > 0) {
//         //   $("<td>"+droppedOnPiece[0]+"<td>");
//         // };
//         $(droppedOn).droppable("disable");
//         $(dropped).parent().droppable("enable");
//         $(dropped).detach().css({top: 0, left: 0}).appendTo(droppedOn);
//         $(droppedOn).droppable("enable");
//       }
//     });
//   });
//
// // $('td').not('td:empty').droppable("disable");

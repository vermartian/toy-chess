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
        y: $target.data('y'),
        state: 'moved'
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
      }
    });
  };

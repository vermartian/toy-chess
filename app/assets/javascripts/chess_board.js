
function initializeBoard(){
  var imgcount = 0
  for (var r=0; r<8; r++) {
    var ypos = 7-r;
    var col = "";
    var initialPieceRows = [0, 1, 6, 7];
    for (var c=0; c<8; c++) {
      if(initialPieceRows.includes(ypos)) {
        col += "<td data-x='"+c+"' data-y='"+ypos+"'><img data-piece_id='"+gon.board[ypos][c].id+"' id='"+imgcount+"' data-color='"+gon.figs[imgcount][0]+"' src='https://s3.amazonaws.com/toy-chess/"+gon.figs[imgcount][1]+"'/></td>";
        imgcount++;
      }
      else { col += "<td data-piece_id='"+gon.board[ypos][c]+"' data-x='"+c+"' data-y='"+ypos+"'></td>" };
    };
    $("#chessboard").append("<tr>"+col+"</tr>");
  };
};

initializeBoard();

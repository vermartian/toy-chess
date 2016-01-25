gon.board
gon.figs
var imgcount = 31
for (var r=0; r<8; r++) {
  var ypos = 7-r;
  var col = "";
  var initialPieceRows = [0, 1, 6, 7];
  for (var c=0; c<8; c++) {
    if(initialPieceRows.includes(ypos)) {
      col += "<td data-piece='"+gon.board[ypos][c]+"' data-x='"+c+"'><img src='https://s3.amazonaws.com/toy-chess/"+gon.figs[imgcount]+"'/></td>";
      imgcount--;
    }
    else { col += "<td data-piece='"+gon.board[ypos][c]+"' data-x='"+c+"'></td>" };
  };
  $("#chessboard").append("<tr data-y='"+ypos+"'>"+col+"</tr>");
};

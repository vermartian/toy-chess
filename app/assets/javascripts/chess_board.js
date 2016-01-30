
function initializeBoard(){
  for (var r=0; r<8; r++) {
    var ypos = 7-r;
    var col = "";
    for (var c=0; c<8; c++) {
      if(gon.board[ypos][c] != null){
        col += "<td data-x='"+c+"' data-y='"+ypos+"'><img data-piece-id='"+gon.board[ypos][c].id+"' data-color='"+gon.figs[ypos][c][0]+"' src='https://s3.amazonaws.com/toy-chess/"+gon.figs[ypos][c][1]+"'/></td>";
      }else{
        col += "<td data-x='"+c+"' data-y='"+ypos+"'></td>";
      };
    };
    $("#chessboard").append("<tr>"+col+"</tr>");
  };
};
function initializeGraveyards(){

  for (var g=0; g<gon.w_graves.length; g++) {
    var col = "<img data-piece-id='"+gon.w_graves[g].id+"' data-color='"+false+"' src='https://s3.amazonaws.com/toy-chess/"+gon.w_dead_figs[g]+"'/>";
    $("#wgrave td").append(col);
  };
  for (var g=0; g<gon.b_graves.length; g++) {
    var col = "<img data-piece-id='"+gon.b_graves[g].id+"' data-color='"+false+"' src='https://s3.amazonaws.com/toy-chess/"+gon.b_dead_figs[g]+"'/>";
    $("#bgrave td").append(col);
  };
};
initializeBoard();
initializeGraveyards();
// "<img data-piece_id='"+gon.board[ypos][c].id+"' id='"+imgcount+"' data-color='"+gon.figs[imgcount][0]+"' src='https://s3.amazonaws.com/toy-chess/"+gon.figs[imgcount][1]+"'/>";
// "<img data-piece_id='"+gon.board[ypos][c].id+"' id='"+imgcount+"' data-color='"+gon.figs[imgcount][0]+"' src='https://s3.amazonaws.com/toy-chess/"+gon.figs[imgcount][1]+"'/>";


// $("td").data('x')

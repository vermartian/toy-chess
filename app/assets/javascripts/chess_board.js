
function initializeBoard(){
  for (var r=0; r<8; r++) {
    if (gon.player_color){
      var ypos = r;
    }else{
      var ypos = 7-r;
    }
    var col = "";
    for (var c=0; c<8; c++) {
      if (gon.player_color){
        var xpos = 7-c;
      }else{
        var xpos = c;
      }
      if(gon.board[ypos][xpos] !== null){
        col += "<td data-x='"+xpos+"' data-y='"+ypos+"'><img data-piece-id='"+gon.board[ypos][xpos].id+"' data-color='"+gon.figs[ypos][xpos][0]+"' src='https://s3.amazonaws.com/toy-chess/"+gon.figs[ypos][xpos][1]+"'/></td>";
      }else{
        col += "<td data-x='"+xpos+"' data-y='"+ypos+"'></td>";
      }
    };
    $("#chessboard").append("<tr>"+col+"</tr>");
  };
}

function initializeGraveyards(){
  for (var g=0; g<gon.w_graves.length; g++) {
    var col = "<img data-piece-id='"+gon.w_graves[g].id+"' data-color='"+false+"' src='https://s3.amazonaws.com/toy-chess/"+gon.w_dead_figs[g]+"'/>";
    $("#wgrave td").append(col);
  }
  for (var g=0; g<gon.b_graves.length; g++) {
    var col = "<img data-piece-id='"+gon.b_graves[g].id+"' data-color='"+true+"' src='https://s3.amazonaws.com/toy-chess/"+gon.b_dead_figs[g]+"'/>";
    $("#bgrave td").append(col);
  }
};

function initializeGame(){
  if (Object.keys(gon).length) {
    initializeBoard();
    initializeGraveyards();
  }
};
initializeGame();

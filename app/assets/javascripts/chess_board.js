var space = 1;
for (var r=0; r<8; r++) {
  var col = "";
  for (var c=0; c<8; c++) { col += "<td data-pos='"+space+"'></td>"; space++; }
  $("#chessboard").append("<tr>"+col+"</tr>");
}

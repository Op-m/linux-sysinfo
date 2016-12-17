#!/bin/bash
source /$(pwd)/functions
txt_cmds=/$(pwd)/cmds.txt
executable=//$(pwd)/executable
errfile=/dev/null

echo "Generating system stats please wait (can take a few minutes on slow systems)"
echo "File generated at $ofile on `date`"

echo "<HTML><HEAD>
<script language=\"javascript1.2\">
function toggleBullet(elm) {
 var newDisplay = \"none\";
 var e = elm.nextSibling; 
 while (e != null) {
  if (e.tagName == \"UL\" || e.tagName == \"ul\") {
   if (e.style.display == \"none\") newDisplay = \"block\";
   break;
  }
  e = e.nextSibling;
 }
 while (e != null) {
  if (e.tagName == \"UL\" || e.tagName == \"ul\") e.style.display = newDisplay;
  e = e.nextSibling;
 }
}

function collapseAll() {
  var lists = document.getElementsByTagName('UL');
  for (var j = 0; j < lists.length; j++) 
   lists[j].style.display = \"none\";
  lists = document.getElementsByTagName('ul');
  for (var j = 0; j < lists.length; j++) 
   lists[j].style.display = \"none\";
  var e = document.getElementById(\"root\");
  e.style.display = \"block\";
}
</script>
</HEAD>
<BODY onload='collapseAll();'>">$ofile
echo "<H1>System Information</H1>">>$ofile
echo "File generated on `date`">>$ofile 
echo "<div style=\"border: dashed 1px #000; padding: 3px; margin: 3px;\">">>$ofile

echo "<ul id=\"root\">">>$ofile

dd if=$txt_cmds of=$executable && chmod +x $executable
/bin/bash $executable

echo "</ul></DIV></BODY></HTML>">>$ofile

echo "Finished...100%, open up the file in your favourite web browser"
exit 0

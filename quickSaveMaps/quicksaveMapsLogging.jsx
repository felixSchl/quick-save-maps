///////////////////////////////////////////////////////////////////////////////////////
//
//  Author:  Felix Schlitter
//  Contact: felixSchlitter@gmail.com
//  Website: www.felixSchlitter.com
//	License: Creative Commons Attribution-ShareAlike 3.0 Unported
//
///////////////////////////////////////////////////////////////////////////////////////

#include "quickSaveMapsUtilities.jsxinc"
#include "quickSaveMapsLogging.jsxinc"

/*
<javascriptresource>
  <name>QSM - View log</name>
  <category>Quick-Save Maps</category>
</javascriptresource>
*/

/////////////////////////////////////////////////////////////////////
//// ENTRY
/////////////////////////////////////////////////////////////////////

// Function to kick off Quick Save Maps Log Viewer
(function main() {
  var dialog = new CLogDialog();
  dialog.makeDialog();
})()
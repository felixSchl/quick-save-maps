///////////////////////////////////////////////////////////////////////////////////////
//
//  Author:  Felix Schlitter
//  Contact: felixSchlitter@gmail.com
//  Website: www.felixSchlitter.com
//	License: Creative Commons Attribution-ShareAlike 3.0 Unported
//
///////////////////////////////////////////////////////////////////////////////////////

// Helper function for script listener dumps
function cTID(s){return charIDToTypeID(s)}
function sTID(s){return stringIDToTypeID(s)}

/*
<javascriptresource>
  <name>QSM - Reset window positions</name>
  <category>Quick-Save Maps</category>
</javascriptresource>
*/

// Restore Config Win Position
var desc_out = new ActionDescriptor();
desc_out.putDouble(cTID("FLCX"),0);
desc_out.putDouble(cTID("FLCY"),0);
app.putCustomOptions(cTID("qsm "), desc_out, 1);

// Restore Log Win Position
var desc_out = new ActionDescriptor();
desc_out.putDouble(cTID("FLCX"),0);
desc_out.putDouble(cTID("FLCY"),0);
app.putCustomOptions(cTID("qsmL"), desc_out, 1);

alert("QSM window positions have been restored...");
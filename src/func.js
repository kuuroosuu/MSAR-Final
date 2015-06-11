Lynyrd_Skynyrd_Sweet_Home_Alabama_track = ['Arr_Electric_Guitar', 'Backing_Vocals', 'Bass', 'Drum_Kit', 'Electric_Guitar', 'Lead_Electric_Guitar', 'Lead_Vocal', 'Piano'];
dict = {NONE:[], Lynyrd_Skynyrd_Sweet_Home_Alabama:Lynyrd_Skynyrd_Sweet_Home_Alabama_track};


function init(){
	document.location="matlab:init;";
	new Accordian('basic-accordian',10,'header_highlight');
}


function getTrackList() {
	var songName = document.getElementsByName("SelectSong")[0].value;
    console.log(songName);
    var tkf = document.getElementById("trackform");
    tkf.innerHTML = "";
    var tracklist = dict[songName]
    var len = tracklist.length;
    for(var i=1; i<=len; i++){
        tkf.innerHTML += '<text id="track'+ i +'">'+tracklist[i-1]+' </text><br>' + '<select name="track' + i + '_selection">' + '<option value="none">維持原狀</option>' + '<option value="minor">轉小調</option>' + '<option value="">維持原調性+疊音</option>' + '<option value="">轉小調+疊音</option>' + '<option value="disable">關掉這個track</option></select><br>';
    }
}


function generate(){
	var songName = document.getElementsByName("SelectSong")[0].value;
    var tracklist = dict[songName];
    var len = tracklist.length;
    var filename = "{'"+songName+"("+tracklist[0]+"_Custom_Backing_Track).mp3'";
    var scale = "{'"+document.getElementsByName("track1_selection")[0].value + "'";
    for(var i=1; i<len; i++) {
        filename += " '" + songName+"("+tracklist[i]+"_Custom_Backing_Track).mp3'";
        scale += " '"+document.getElementsByName("track"+(i+1)+"_selection")[0].value + "'";
    }
    filename += "}";
    scale += "}";
    console.log(filename);
    console.log(scale);
	document.location="matlab:final("+ filename +","+ scale + ");";
}
function clear(){
	document.location="matlab:clc;clear;";
}

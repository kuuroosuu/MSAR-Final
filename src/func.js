Lynyrd_Skynyrd_Sweet_Home_Alabama_track = ['Arr_Electric_Guitar', 'Backing_Vocals', 'Bass', 'Drum_Kit', 'Electric_Guitar', 'Lead_Electric_Guitar', 'Lead_Vocal', 'Piano'];
Metallica_Nothing_Else_Matters_track = ['Drum_Kit', 'Lead_Electric_Guitar2', 'Electric_Guitar', 'Lead_Vocal', 'Backing_Vocals', 'Electric_Guitar2', 'Percussion', 'Bass', 'Lead_Electric_Guitar', 'String_Section']
dict = {NONE:[], Lynyrd_Skynyrd_Sweet_Home_Alabama:Lynyrd_Skynyrd_Sweet_Home_Alabama_track, 
                 Metallica_Nothing_Else_Matters:Metallica_Nothing_Else_Matters_track};


function init(){
	new Accordian('basic-accordian',10,'header_highlight');
}


function getTrackList() {
	var songName = document.getElementsByName("SelectSong")[0].value;
    var tkf = document.getElementById("trackform");
    tkf.innerHTML = "";
    var tracklist = dict[songName]
    var len = tracklist.length;
    for(var i=1; i<=len; i++){
        tkf.innerHTML += '<text id="track'+ i +'">'+tracklist[i-1]+' </text><br>' + '<select name="track' + i + '_selection">' +
                         '<option value="none">none</option>' + 
                        '<option value="minor">minor</option>' + 
                        '<option value="blue">bule</option>' + 
                        '<option value="major3">none + fix 3 semitones</option>' + 
                        '<option value="major34">none + musical 3,4 semitones</option>' + 
                        '<option value="minor3">minor + fix 3 semitones</option>' + 
                        '<option value="minor34">minor + musical 3,4s semitones</option>' + 
                        '<option value="mute">mute</option></select><br>';
    }
}


function generate(){
	var songName = document.getElementsByName("SelectSong")[0].value;
    var tracklist = dict[songName];
    var len = tracklist.length;
    var filename = "{'" + songName + "/" + tracklist[0]+".mp3'";
    var scale = "{'"+document.getElementsByName("track1_selection")[0].value + "'";
    for(var i=1; i<len; i++) {
        filename += " '" + songName + "/" +tracklist[i]+".mp3'";
        scale += " '"+document.getElementsByName("track"+(i+1)+"_selection")[0].value + "'";
    }
    filename += "}";
    scale += "}";
	document.location="matlab:interface("+ filename +","+ scale + ");";
}
function clear(){
	document.location="matlab:clc;clear;";
}

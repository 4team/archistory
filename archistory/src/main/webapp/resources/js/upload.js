function checkImageType(fileName){

	var pattern = /jpg|gif|png|jpeg/i;

	return fileName.match(pattern);
}

function getFileInfo(fullName){

	var fileName,imgsrc, getLink;

	var fileLink;

	if(checkImageType(fullName)){
		imgsrc = "http://14.32.66.127:4000/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);

		var front = fullName.substr(0,12); // /2015/07/01/ 
		var end = fullName.substr(14);

		getLink = "http://14.32.66.127:4000/displayFile?fileName="+front + end;

	}else{
		imgsrc ="/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "http://14.32.66.127:4000/displayFile?fileName="+fullName;
	}

	var array = fullName.split('s_');
	var front = array[0];
	fileName = "http://14.32.66.127:4000/displayFile?fileName="+front + fileLink.substr(fileLink.indexOf("_")+1);

	return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};

}


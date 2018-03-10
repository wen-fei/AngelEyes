function createDiv(info) {

	var divNode=document.getElementById("popImg");
	if(divNode==null){
		divNode=document.createElement("div");
		divNode.id="popImg";
		divNode.style.position="absolute";
		//divNode.style.width="400px";
		//divNode.style.height="215px";
		//divNode.style.display="none";
		//divNode.style.border = "1px solid #cbdbeb";
		//divNode.style.backgroundColor="white";
		divNode.style.width="130px";
		divNode.style.overflow="hidden";
		divNode.style.height="175px";
		divNode.style.backgroundImage="url(images/baby_sctn01_4_img.gif)";
		divNode.style.display="block";
		divNode.style.color="#666";
		divNode.style.font="normal normal normal 12px/1.5em Trebuchet MS";
		divNode.style.padding="10px 5px";
		document.body.appendChild(divNode);

		var tableNode=document.createElement("table");
		//tableNode.width=400;
		tableNode.width=175;
		tableNode.border=0;
		tableNode.cellspacing=0;
		tableNode.cellpadding=0;
		tableNode.Class="divmsg";
		divNode.appendChild(tableNode);

		var tbodyNode = document.createElement("tbody"); 
		tableNode.appendChild(tbodyNode);

		var trNode=document.createElement("tr");
		tbodyNode.appendChild(trNode);

		var tdNode=document.createElement("td");
		tdNode.width=180;
		trNode.appendChild(tdNode);

		var imgNode=document.createElement("img");
		//imgNode.style.width="170px";
		//imgNode.style.height="210px";
		//imgNode.src=info.imgSrc;
		//tdNode.appendChild(imgNode);

		//tdNode=document.createElement("td");
		//tdNode.style.padding="0 0 0 10px;";
		tdNode.appendChild(getPNode(info.name));
		tdNode.appendChild(getPNode(info.mobile));
		tdNode.appendChild(getPNode(info.birthday));
		tdNode.appendChild(getPNode(info.lostDate));
		tdNode.appendChild(getPNode(info.lostAddress));
		tdNode.appendChild(getPNode(info.str5));
		tdNode.appendChild(getPNode(info.insert_time));
		tdNode.appendChild(getPNode(info.str7));
		trNode.appendChild(tdNode);
	}
	divNode.style.top=info.top;
	divNode.style.left=info.left;

	if(divNode.style.display=="none"){
		divNode.style.display="block";
	}
}

function closePopImg(){
	var node=document.getElementById("popImg");
	if(node!=null){
		node.parentNode.removeChild(node);
	}
}

function getPNode(text){
	var node=document.createElement("p");
	node.innerHTML=text;
	return node;
}

function mouseCoords(ev) {
	if (ev.pageX || ev.pageY) {
		return {
			x :ev.pageX,
			y :ev.pageY
		};
	}
	return {
		x :ev.clientX + document.body.scrollLeft - document.body.clientLeft,
		y :ev.clientY + document.documentElement.scrollTop - document.body.clientTop
	};
}

function popImg(ev){
	ev=ev||window.event;
	var mousePos = mouseCoords(ev);
	var docWidth=document.body.clientWidth;
	var docHeight=document.body.clientHeight;

	var v1=docWidth-mousePos.x;
	var v2=docHeight-mousePos.y;

	var popLeft=mousePos.x;

	//if(v1>400){
	//	popLeft=mousePos.x+5;
	//}else if(v1>mousePos.x){
	//	popLeft=mousePos.x+5;
	//}else{
	//	popLeft=mousePos.x-400-5;
	//}

	//var popTop=mousePos.y;
	//if(v2>190){
	//	popTop=mousePos.y+5;
	//}else if(v2>mousePos.y){
	//	popTop=mousePos.y+5;
	//}else{
	//	popTop=mousePos.y-190-5;
	//}

	popLeft=mousePos.x-10;
	popTop=mousePos.y-200;

	source=ev.srcElement||ev.target;
	var hidValue=document.getElementById(source.id+"-hid").value;
	var values=hidValue.split(",");
	var info={};
	
	info.top=popTop+"px";
	info.left=popLeft+"px";
	info.imgSrc=source.src;

	info.name=    "<span style='height:20px;line-height:20px;'>&nbsp;姓名："+values[0]+"</span>";
	info.mobile=  "<span style='height:20px;line-height:20px;'>&nbsp;编号："+values[3]+"</span>";
	info.birthday="<span style='height:20px;line-height:20px;'>&nbsp;出生日期："+values[1]+"</span>";
	info.lostDate="<span style='height:20px;line-height:20px;'>&nbsp;失踪时间："+values[2]+"</span>";
	info.lostAddress="<span style='height:20px;line-height:20px;'>&nbsp;失踪地点："+values[4]+"</span>";
	info.str5=    "<span style='height:20px;line-height:20px;'>&nbsp;跟进志愿者："+values[5]+"</span>";
	info.insert_time=    "<span style='height:20px;line-height:20px;'>&nbsp;登记时间："+values[6]+"</span>";
	info.str7=    "<span style='height:30px;line-height:30px;color:#5a9624'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击查看详情</span>";
	createDiv(info);	
}
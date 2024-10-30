function getXMLHttpRequest() {
	var xhr = null;
	
	if (window.XMLHttpRequest || window.ActiveXObject) {
		if (window.ActiveXObject) {
			try {
				xhr = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
		} else {
			xhr = new XMLHttpRequest(); 
		}
	} else {
		alert("Votre navigateur ne supporte pas l'objet XMLHTTPRequest...");
		return null;
	}
	
	return xhr;
}

function resizeCanvas() {
	container = document.getElementById("MainCanvasContainer");
	const canvas = document.getElementById("MainCanvas");

	if(container.offsetWidth >= 1200)
	{
		Percentage=100;
	}
	else
	{
		number=(container.offsetWidth / 1200) * 100;
		Percentage=parseFloat(number.toFixed(2));
	}

	const width= (Percentage / 100) * 1200;
	const height= (Percentage / 100) * 800;

  	canvas.width = width;
  	canvas.height = height;
	pictureSelection(Percentage);
}

window.addEventListener("resize", resizeCanvas);

function loadImages(sources, callback) 
{
	const images = {};
	let loadedImages = 0;
	let numImages = 0;
	// get num of sources
	for(let src in sources) 
	{ 
		numImages++;
	}
	for(let src in sources) 
	{
		images[src] = new Image();
		images[src].onload = function() {
			if(++loadedImages >= numImages) {
				callback(images);
			}
		};
		images[src].src = sources[src];
	}
}

function pictureSelection(size = 100)
{
	let xhr = getXMLHttpRequest();
	xhr.onreadystatechange = function() 
	{
		if (this.readyState == 4 && this.status == 200)
		{
			const answer=JSON.parse(xhr.responseText);
			rendering(answer, size);
		}
	};
	const CostumeArray=getCookie("BoCostumes");

	xhr.open("POST", "/functions/displayBoCanvas.php", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
	xhr.send("Costumes="+encodeURIComponent(CostumeArray));
}

function rendering(Array, Percentage)
{
	const MainCTX = document.getElementById("MainCanvas").getContext("2d");
	const HiddenCTX = document.getElementById("HiddenCanvas").getContext("2d");
	HiddenCTX.clearRect(0, 0, 1200, 800);
	loadImages(Array, function(Items)
    {
		for(let i in Items)
		{
			const width= (Percentage / 100) * 1200;
			const height= (Percentage / 100) * 800;
			MainCTX.globalCompositeOperation = "source-over";
			MainCTX.drawImage(Items[i], 0, 0, width, height);

			HiddenCTX.globalCompositeOperation = "source-over";
			HiddenCTX.drawImage(Items[i], 0, 0);
		}
	});
}

function Add_Costume_Piece()
{
    const AddingEvent = document.getElementsByClassName('costume--trigger');
    for(let  i = 0; i < AddingEvent.length ; i++)
    {
        AddingEvent[i].setAttribute('tabindex', '0');
        ["click", "keydown"].forEach(ev=>{
            AddingEvent[i].addEventListener(ev, function (event)
            {
				if(event.type == "click" || event.key === 'Enter')
				{
					const CostumeArray=getCookie("BoCostumes");
					const CostumeID=this.getAttribute("data-costume");
					const CostumeCategory=this.getAttribute("data-category");
					
					let xhr = getXMLHttpRequest();
					xhr.onreadystatechange = function() 
					{
						if (this.readyState == 4 && this.status == 200)
						{
							const VerificationOfNumbers=JSON.parse(xhr.responseText);
							if(VerificationOfNumbers['nbrAccessories'] === "Yes")
							{
								nbrAccessories++;
							}
							if(VerificationOfNumbers['nbrMakeup'] === "Yes")
							{
								nbrMakeup++;
							}
							const d = new Date();
							d.setTime(d.getTime() + (30*24*60*60*1000));
							let expires = "expires="+ d.toUTCString();
							document.cookie = "BoCostumes="+xhr.responseText+";"+ expires +"; SameSite=None; Secure";
							resizeCanvas();
							update_selected_list();
						}
					};
					xhr.open("POST", "/functions/addToArray.php", true);
					xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
					xhr.send("ID="+encodeURIComponent(CostumeID)+"&Costumes="+encodeURIComponent(CostumeArray)+"&nbrAccessories="+encodeURIComponent(nbrAccessories)+"&nbrMakeup="+encodeURIComponent(nbrMakeup));
				}
            });
        });
    }
}

function Interactive_Tabs()
{
    const AddingEvent = document.getElementsByClassName('interactive-tabs--trigger');
    for(let i = 0; i < AddingEvent.length ; i++)
    {
        AddingEvent[i].setAttribute('tabindex', '0');
        ["click", "keydown"].forEach(ev=>{
            AddingEvent[i].addEventListener(ev, function (event)
            {
				if(event.type == "click" || event.key === 'Enter')
				{
					InteractiveTab=this.getAttribute("data-tab");
					
					Previous_InteractiveTab=this.getAttribute("data-tab-previous");
					Container_InteractiveTab=this.getAttribute("data-tab-container");
					
					const TabToActivate=document.querySelector("#"+InteractiveTab);
					const TabToDeactivate=document.querySelector("#"+Previous_InteractiveTab);

					const TriggerToDeactivate=document.querySelector("#"+this.getAttribute("data-list")).querySelector(".tab-list__items--active");

					if(InteractiveTab != Previous_InteractiveTab)
					{
						TabToDeactivate.classList.remove('!static'); 
						TabToDeactivate.classList.remove('!opacity-100');
						setTimeout(() => { TabToDeactivate.classList.remove('interactive-tabs--active'); }, 700);

						TabToActivate.classList.add('!static');
						TabToActivate.classList.add('interactive-tabs--active');
						TabToActivate.classList.add('!opacity-100');

						this.classList.add('tab-list__items--active');
						TriggerToDeactivate.classList.remove('tab-list__items--active');

						AllTrigersInList = document.querySelector("#"+this.getAttribute("data-list")).querySelectorAll('.tab-list__items');
						for(let i2 = 0; i2 < AllTrigersInList.length ; i2++)
						{
							AllTrigersInList[i2].setAttribute("data-tab-previous", InteractiveTab)
						}
					}
				}
            });
        });
    }
}

function update_selected_list()
{
	const CostumeArray=getCookie("BoCostumes");
	let xhr = getXMLHttpRequest();
	xhr.onreadystatechange = function() 
	{
		if (this.readyState == 4 && this.status == 200)
		{
			document.getElementById('selected-elements-list').innerHTML= xhr.responseText;
			TakeOffPiece();
		}
	};
	xhr.open("POST", "/functions/updateSelectedList.php", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
	xhr.send("Costumes="+encodeURIComponent(CostumeArray));
}

function getCookie(cname) 
{
	let name = cname + "=";
	let ca = document.cookie.split(';');
	for(let i = 0; i < ca.length; i++) 
	{
		let c = ca[i];
		while (c.charAt(0) == ' ') 
		{
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) 
		{
			return c.substring(name.length, c.length);
		}
	}
}

function declaration()
{

	var el = document.getElementById('selected-elements-list');
	var sortable = Sortable.create(el, {
		handle: ".draggable-element",
		animation: 150,
		swap: true,
		swapThreshold: 0.65,
		forceFallback: true,
		onChoose   : function(e){ 
			const childrenNodes = sortable.toArray();
			for(let i = 0; i < childrenNodes.length; i++) 
			{
				document.getElementById(childrenNodes[i]).classList.add('cursors-dragging');
				document.getElementById(childrenNodes[i]).classList.remove('cursors-drag');
				document.querySelector('#selected-elements-list').classList.add('cursors-dragging');
			}
		},
		onStart   : function(e){ 
			const childrenNodes = sortable.toArray();
			for(let i = 0; i < childrenNodes.length; i++) 
			{
				document.getElementById(childrenNodes[i]).classList.add('cursors-dragging');
				document.getElementById(childrenNodes[i]).classList.remove('cursors-drag');
				document.querySelector('#selected-elements-list').classList.add('cursors-dragging');
			}
		},
		onUnchoose : function(e){ 
			const childrenNodes = sortable.toArray();
			for(let i = 0; i < childrenNodes.length; i++) 
			{
				document.getElementById(childrenNodes[i]).classList.remove('cursors-dragging');
				document.getElementById(childrenNodes[i]).classList.add('cursors-drag');
				document.querySelector('#selected-elements-list').classList.remove('cursors-dragging');
			}
		},
		onEnd      : function(e){ 
			const childrenNodes = sortable.toArray();
			for(let i = 0; i < childrenNodes.length; i++) 
			{
				document.getElementById(childrenNodes[i]).classList.remove('cursors-dragging');
				document.getElementById(childrenNodes[i]).classList.add('cursors-drag');
				document.querySelector('#selected-elements-list').classList.remove('cursors-dragging');
			}
		},
		group: "selectedItems",
		store: {
			get: function (sortable) {
				var order = localStorage.getItem(sortable.options.group.name);
				return order ? order.split('|') : [];
			},
			set: function (sortable) {
				const order = sortable.toArray();
				let newOrderedList={};
				for(let i = 0; i < order.length; i++) 
				{
					Category= document.getElementById(order[i]).getAttribute("data-category");
					SelectedImage=document.getElementById(order[i]).getAttribute("data-img");
					SelectedID=document.getElementById(order[i]).getAttribute("data-id");
					newOrderedList[Category]= SelectedImage;
					newOrderedList[Category+"_Selected"]= SelectedID;
				}
				localStorage.setItem(sortable.options.group.name, order.join('|'));
				const d = new Date();
				d.setTime(d.getTime() + (30*24*60*60*1000));
				let expires = "expires="+ d.toUTCString();
				document.cookie = "BoCostumes="+JSON.stringify(newOrderedList)+";"+ expires +"; SameSite=None; Secure";
				resizeCanvas();
			}
		}
	});
}

function downloadImage()
{
    AddingEvent = document.querySelectorAll('#downloadBtn');
    for(let i2 = 0; i2 < AddingEvent.length ; i2++)
    {
        ["click", "keydown"].forEach(ev=>{
            AddingEvent[i2].addEventListener(ev, function (event)
            {
				if(event.type == "click" || event.key === 'Enter'){
					let canvas = document.getElementById("HiddenCanvas");
					const dataURL = canvas.toDataURL("image/png");
					const a = document.createElement('a');
					a.href = dataURL
					a.download = 'costume-a-bo.png';
					a.click();
				}
            });
        });
    }
}

function TakeOffPiece()
{
    AddingEvent = document.getElementsByClassName('delete-clothe');
    for(let i2 = 0; i2 < AddingEvent.length ; i2++)
    {
        ["click", "keydown"].forEach(ev=>{
            AddingEvent[i2].addEventListener(ev, function (event)
            {
				if(event.type == "click" || event.key === 'Enter')
				{
					SelectedID=this.parentNode.getAttribute("data-id");
					SelectedImage=this.parentNode.getAttribute("data-img");
					Category= this.parentNode.getAttribute("data-category");
					
					const CostumeArray=JSON.parse(getCookie("BoCostumes"));

					const newArray = Object.keys(CostumeArray)
						.filter((key) => !key.includes(Category))
						.reduce((obj, key) => {
							return Object.assign(obj, {
							[key]: CostumeArray[key]
							});
					}, {});
					const d = new Date();
					d.setTime(d.getTime() + (30*24*60*60*1000));
					let expires = "expires="+ d.toUTCString();

					document.cookie = "BoCostumes="+JSON.stringify(newArray)+";"+ expires +"; SameSite=None; Secure";
					resizeCanvas();
					update_selected_list();
				}
            });
        });
    }
}

function TakeOffAll()
{
	AddingEvent = document.getElementsByClassName('clearAll');
    for(let i2 = 0; i2 < AddingEvent.length ; i2++)
    {
        ["click", "keydown"].forEach(ev=>{
            AddingEvent[i2].addEventListener(ev, function (event)
            {
				if(event.type == "click" || event.key === 'Enter')
				{
					const Items ={};

					const CookiesData=JSON.stringify(Items);
					const d = new Date();
					d.setTime(d.getTime() + (30*24*60*60*1000));
					let expires = "expires="+ d.toUTCString();

					document.cookie = "BoCostumes="+CookiesData+"; "+ expires +"; SameSite=None; Secure";
					
					resizeCanvas();
					update_selected_list();
				}
            });
        });
    }
}

function startsall()
{
	let IsCookieCreated = getCookie("BoCostumes");
	if (IsCookieCreated === "" || IsCookieCreated === undefined) 
	{
		Items ={};
		Items['Tai']= "neck";
		Items['Tai_Selected']= "81";
	} 
	else 
	{
		Items=JSON.parse(getCookie("BoCostumes"));
	}

	const CookiesData=JSON.stringify(Items);

	const d = new Date();
	d.setTime(d.getTime() + (30*24*60*60*1000));
	let expires = "expires="+ d.toUTCString();

	document.cookie = "BoCostumes="+CookiesData+"; "+ expires +"; SameSite=None; Secure";

	resizeCanvas();
	Interactive_Tabs();
	Add_Costume_Piece();
	update_selected_list();
	declaration();
	downloadImage();
	TakeOffAll();
}


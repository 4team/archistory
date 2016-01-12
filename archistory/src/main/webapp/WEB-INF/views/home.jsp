
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style>
        html, body, #cesiumContainer {
            width: 100%; height: 100%; margin: 0; padding: 0; overflow: hidden;
            font-family: sans-serif; color: #edffff;
        }

         html, body {
             height: 100%;
             margin: 0;
             padding: 0;
         }
        #main{
            width:100%;
            border:0px;
            height:100%;
        }
		
		#menu{
			padding:5px;
			z-index:100;
			position: absolute;
			top:5px;
			left:5px;
		}
        
        #upper-login{
        	padding:5px;
       		position:absolute;
        	z-index:100;
        	right: 10px;
        	top:5px;
        }
        
        button{
        	padding:5px;
        }
        
        span.glyphicon-menu-hamburger {
    font-size: 1.8em;
    color:#FFF;
}

    </style>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<div id="menu">
	<span class="glyphicon glyphicon-menu-hamburger"></span>
</div>


<div id="upper-login">
	<button type="button" class="btn btn-primary btn-xs"><font face="verdana" size="2" >Login</font></button>
	<button type="button" class="btn btn-primary btn-xs"><font face="verdana" size="2" >Join</font></button>
</div>

<iframe id="main" src="world.html"></iframe>
</body>
</html>
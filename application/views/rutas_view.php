<!DOCTYPE html>
<html >
<head>
	<title>Migraciones</title>
	<meta charset="utf-8" />
	<link type="text/css" href="<?=base_url();?>/css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
      html { height: 100%; }
      body { height: 100%; margin: 0; padding: 0; }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false"></script>
    <script type="text/javascript" src="<?=base_url();?>/js/jquery.js"></script>
    <script type="text/javascript" src="<?=base_url();?>/js/rutas.js"></script>
</head>
<body>
    <div class="container">
    <h2>Proyecto Migración</h2>
	<hr/>
        <div class="row">
        	<div class="col-md-4">
        		<h4>Usuarios</h4>
        		<input class="form-control" type="text" placeholder="Buscar usuario"/>
                <ul class="list-group">
                    <?php foreach ($usuarios as $user):?>
                        <li class="list-group-item"><?=$user->usuario?></li>
                    <?php endforeach; ?>
                <ul>
        	</div>
        	<div class="col-md-8">
        		<h4>Ruta</h4>
        		<div id="map_canvas" style="height:400px; width: 80%;"></div>
        	</div>
        </div>
    </div>
    <div class="footer">
    	<hr/>
    	<p class="text-center">Desarrollado por:<br/>
    		Daniel García Alvarado - <a href="http://www.twitter.com/houseckleiin" target="_blank">@houseckleiin</a><br/>
    		Joel Humberto Gómez Paredes - <a href="http://www.twitter.com/dezkareid">@dezkareid</a>
    	</p>
    </div>
</body>
</html>

<?php

$ModuleTools = ModuleTools::instance();

$Module=array(
	'name'=>'Gallery',
	'variable_params'=>true
);

$ViewList=array();

$ViewList['album']=array(
	'name'=>'Album',
	'script'=>'album.php',
	'params'=>array('NodeId'),
	'unordered_params'=>array()
);



?>
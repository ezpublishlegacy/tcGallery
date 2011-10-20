<?

$NodeId = $Params['NodeId'];

require_once('kernel/common/template.php');
$tpl = eZTemplate::factory();
$tpl->setVariable('NodeId', $NodeId);
$content = $tpl->fetch("design:tcgallery_album.tpl");
$results = array(
	'content'=>$content,
	'pagelayout'=>"design:tcgallery/pagelayout.tpl"
);

return $results;

?>
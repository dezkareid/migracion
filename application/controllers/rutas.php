<?php
class Rutas extends CI_Controller{

	function __construct(){
		parent::__construct();
	}

	function index(){
		$this->load->view('rutas_view');
	}
}
?>
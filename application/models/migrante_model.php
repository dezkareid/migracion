<?php
class Migrante_Model extends CI_Model{

	function __construct(){
		parent::__construct();
	}

	function insert($migrante){
		$this->db->insert('migrantes', $migrante);
	}

	function getAbusos(){
		$query = $this->db->get('abuso');
		return $query->result();
	}

	function insert_visita($data){
		$id = $this->db->get_where('migrantes',array('usuario' => $data['user'], 'password' => $data['pass']))->result()[0]->id;
		$visita['abuso_id_abuso'] = $data['abuso_id_abuso'];
		$visita['descripcion'] = $data['descripcion'];
		$visita['migrantes_id'] = $id;
		$visita['albergue_id_albergue'] = $this->session->userdata('sesion')['albergue'];
		$this->db->insert('visita',$visita);
	}
}


?>

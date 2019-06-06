<?php
defined('BASEPATH') OR exit('No direct script access allowed');
//se crea el controlador categorias
class Productos extends CI_Controller {
//constructor
	public function __construct(){
		parent::__construct();
		$this->load->model("Productos_model");
    }

    public function index()
	{
		$data = array(
			'productos' => $this->Productos_model->getProductos(),

		);
		
		$this->load->view('layouts/header');
		$this->load->view('layouts/aside');
		$this->load->view('reportes/list_producto',$data);
		$this->load->view('layouts/footer');
		$this->load->view('productos/script_productos');
}
}
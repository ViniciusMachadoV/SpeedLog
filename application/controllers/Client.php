<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Client extends CI_Controller {

	public function index()
	{
		$this->load->helper('url');
		$this->load->model('Model_Client');
		$dados['acompanhar']=$this->Model_Client->get_acompanhamento();
		$dados['historico']=$this->Model_Client->get_entregas();

		$this->load->view('template/header');
		$this->load->view('pages/view_client',$dados);
		$this->load->view('template/footer');
	}
	public function fazer_pedido()
	{
		$this->load->model('Model_Client');

		$largura =$this->input->post('largura');
		$altura =$this->input->post('altura');
		$cepretirada =$this->input->post('cepretirada');
		$cepentrega =$this->input->post('cepentrega');
		$peso =$this->input->post('peso');
		$observacao =$this->input->post('observacao');
		
        $this->Model_Client->inserir($largura, $altura,$cepretirada,$cepentrega,$peso,$observacao);
	}
	public function deletar_pedido($id_deletar)

	{
		$this->load->model('Model_Client');

		$id_pedido=$id_deletar;
		$this->Model_Client->deletar_pedido($id_pedido);

	}
	
	
}
<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Admin extends CI_Controller {
	public function index()
	{
		$this->load->model('model_Admin');
		$dados['entregadores']=$this->model_Admin->listDeliverymen();
		$dados['entregas']=$this->model_Admin->listDeliveries();
		$dados['clientes']=$this->model_Admin->listClients();
		$dados['frete']=$this->model_Admin->deliveryValues();
		$this->load->helper('url');
		$this->load->model('model_Admin');
		$this->load->view('template/header');
		$this->load->view('pages/view_admin',$dados);
		$this->load->view('template/footer');
	}
	public function registerUser()
	{
		header('Location: '.base_url().'speedlog/index.php/connect');
		// $name_signUp = $_POST['name'];
		// $email_SignUp = $_POST['email'];
		// $cpf_signUp = $_POST['cpf'];
		// $nickname_SignUp = $_POST['nick'];
		// $phoneNumber_SignUp = $_POST['phone'];
		// $pass_SignUp = $_POST['pass'];
		// $this->load->model('model_Connect');
        // $this->model_Connect->register($name_signUp,$email_SignUp,$cpf_signUp,$nickname_SignUp,$phoneNumber_SignUp,$pass_SignUp);
	}
}?>

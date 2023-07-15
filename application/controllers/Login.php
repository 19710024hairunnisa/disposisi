<?php
defined ('BASEPATH') OR exit('No direct script access allowed');
class Login extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
    }

    public function index()
    {
        $this->form_validation->set_rules('email','email','required|trim');
        $this->form_validation->set_rules('password','Password','required|trim');

        if ($this->form_validation->run() == false) {
            $this->load->view('login/index');
        } else {
            $this->dologin();
        }
    }

    public function dologin()
    {
        $user = $this->input->post('email');
        $pwsd = $this->input->post('password');

        //cari user berdasarkan email
        $user = $this->db->get_where('tb_user', ['email' => $user])->row_array();

        //jika user terdaftar
        if($user){
            //periksa pass
            if (password_verify($pwsd, $user['password'])) {
                $data = [
                    'id'        => $user['id'],
                    'email'     => $user['email'],
                    'username'  => $user['username'],
                    'role'      => $user['role']
                ];

                $userid = $user['id'];
                $this->session->set_userdata($data);
                
                //periksa role
                if ($user['role'] == 'admin') {
                    $this->_updateLastLogin($userid);
                    redirect('admin/menu');
                } else if ($user['role'] == 'sekretaris') {
                    $this->_updateLastLogin($userid);
                    redirect('surat');
                }
                
            } else {
                //jika pass salah
                $this->session->set_flashdata('message','<div class="alert alert-danger" role="alert">
                    <b>Error :</b> Password Salah. </div>');
                redirect('/');
            }

        }else{
            //jika user tdk terdaftar
            //echo user tdk ada
            $this->session->set_flashdata('message','<div class="alert alert-danger" role="alert">
               <b>Error :</b> User tidak terdaftar </div>');
            redirect('/');
        }
    }

    private function _updateLastLogin($userid){
        $sql = "UPDATE tb_user SET last_login=now() WHERE id=$userid";
        $this->db->query($sql);
    }

    public function logout(){
        //hancurkan semua sesi
        $this->session->sess_destroy();
        redirect(site_url('login'));
    }

    public function block(){
        $data = array(
            'user'  => infoLogin(),
            'title' => 'Access Denied!'
        );
        $this->load->view('login/error404', $data);
    }
}
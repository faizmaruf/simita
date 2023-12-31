<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

    function index() {
        $this->load->view('user/login');
        $this->load->library('session');
    }

    function auth() {  
        $this->form_validation->set_rules('username', 'username', 'required|trim');
        $this->form_validation->set_rules('password', 'password', 'required|trim');
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $url = 'https://api.rshb-lampung.co.id/asik-backend/user/login'; // URL API eksternal yang akan dituju

        // Data yang akan dikirim sebagai payload POST
        $data = array(
            'username' => $username,
            'password' => $password,
        );

        $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);
    $httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $responseArray = json_decode($response, true);

    curl_close($ch);

    $responseData = $responseArray['user'];
   
  
    
    if(($responseArray['message'])=='Login berhasil') {
        $data = array('nama' =>$responseData['nama'] ,
                        'username'=>$responseData['username'] ,
                        'role'=>'Administrator',
                        'status_login'=>'login_diterima',
                        'gid'=>1,
                        // 'last_login'=>$row['last_login'],
                        // 'group'=>$group['nama_group'],
                );
                
        $this->session->set_userdata($data);
        // $v=$this->session->userdata();
        // var_dump($v);
        // die;
        // $this->db->where('username',$username);
        // $this->db->update('tb_user',array('last_login'=>date('Y-m-d H:i:s')));
        
        redirect('dashboard');   
    }else{
        $this->session->set_flashdata('result_login', '<br>Username atau Password yang anda masukkan salah.');
        redirect('login');
     }                
    

    }

    // function auth() {  
    // $this->form_validation->set_rules('username', 'username', 'required|trim');
    // $this->form_validation->set_rules('password', 'password', 'required|trim');
    // if ($this->form_validation->run() == FALSE) {
    //     $this->load->view('user/login');
    // } else {
    //     $username = $this->input->post('username');
    //     $password = $this->input->post('password');
    //     $hasil    = $this->db->get_where('tb_user',array('username'=>$username,'password'=>sha1($password)));
    //     if ($hasil->num_rows()> 0) {
    //         $row= $hasil->row_array();
    //         $group=$this->db->get_where('tb_group',array('gid'=>$row['gid']))->row_array();
    //         $data = array('nama' =>$row['nama_user'] ,
    //                         'username'=>$username ,
    //                         'gid'=>$row['gid'],
    //                         'role'=>$row['role'],
    //                         'last_login'=>$row['last_login'],
    //                         'group'=>$group['nama_group'],
    //                         'status_login'=>'login_diterima',
    //                 );
                    
    //         $this->session->set_userdata($data);
    //         $this->db->where('username',$username);
    //         $this->db->update('tb_user',array('last_login'=>date('Y-m-d H:i:s')));
            
    //         redirect('dashboard');   
    //     }else{
    //         $this->session->set_flashdata('result_login', '<br>Username atau Password yang anda masukkan salah.');
    //         redirect('login');
    //         }                
    //     }
    // }

    function logout() {
        $this->session->sess_destroy();
        redirect('login');
    }
}

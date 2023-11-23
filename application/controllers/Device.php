<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Device extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model(array('m_device','m_laptop','m_kode_inventory'));
        $this->load->helper('date');
        chek_session();
    }
	public function index() {
        //$data['record'] = $this->m_barang->listBarang()->result(); 
        $this->template->display('device/view');       
    }		
   
    function view_data(){        
        //$criteria = $this->db->query("SELECT * FROM tb_kecamatan ORDER BY kota_id ASC");
        if ($this->session->userdata('role')=='Administrator'){
            $ambildata=$this->m_device->semua()->result();
        }else{
            $ambildata=$this->m_device->semuagid()->result();
        }  
        $no=1;
        foreach($ambildata as $r) {
            if ($r->status =="DIGUNAKAN"){
                $status="<span class='label label-success'>" . $r->status. "</span>";
            }elseif($r->status =="SIAP DIGUNAKAN") {
                $status="<span class='label label-info'>" .$r->status."</span>";
            }elseif($r->status =="DIPERBAIKI") {
                $status="<span class='label label-warning'>" .$r->status."</span>";
            }else{
				$status="<span class='label label-warning'>" .$r->status."</span>";
			}      
            $query[] = array(
                'no'=>$no++,
                'kode_device'=>$r->kode_device,
                'lokasi'=>strtoupper($r->lokasi),                         
                'tgl_inv'=>tgl_indo($r->tgl_inv),
                'jenis_device'=>strtoupper($r->jenis_device), 
                'spesifikasi'=>$r->spesifikasi,                  
                'status'=>$status, 
                'edit'=>anchor('device/detail/' . $r->kode_device, '<i class="btn btn-info btn-sm fa fa-eye" data-toggle="tooltip" title="View Detail"></i>'),
                'delete'=>anchor('device/delete/' . $r->id_device, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data Akan di Hapus?')")),                
            );
        }        
        $result=array('data'=>$query);
        echo  json_encode($result);
    }   

    function add() {              
        $this->_set_rules(); 
        //$this->form_validation->set_message('is_unique', '%s Sudah Ada');
        //$this->form_validation->set_rules('no_inv', 'No. Inventaris', 'trim|required|is_unique[tb_inv_device.kode_device]');       
        if ($this->form_validation->run() == true) {
            $gid=$this->session->userdata('gid');           
            $data = array(
                'no_inventaris' => $this->input->post('no_inventaris'),
                'lokasi' => $this->input->post('lokasi'),
                'jenis_device' => $this->input->post('jenis'),
                'spesifikasi' => $this->input->post('spek'),               
                'tgl_inv' =>$this->input->post('tgl_inv'),
                'harga_beli' =>$this->input->post('harga'),
                'createdate' =>mdate('%Y-%m-%d %H:%i:%s', now()),
                'createby'=>$this->session->userdata('username'),
                'gid' => $gid
            );
            $data2=array(
                'no_inventaris' => $this->input->post('no_inventaris'),
                'lokasi' => $this->input->post('lokasi'),
                'tgl_update'=>date('Y-m-d H:i:s'),
                'admin'=>$this->session->userdata('nama'),
                'note'=>'New Inventory',
                ); 
            // var_dump($data);
            // var_dump($data2);
            // die;                        

            $user = $this->session->userdata('username');
            $no_inventaris  = $this->input->post('no_inventaris');
            $this->m_device->simpan($data);
            $this->m_device->simpan_history($data2);
            $this->m_kode_inventory->updateTableInvKode($no_inventaris,'Device',$user);
            $this->session->set_flashdata('result_tambah', '<br><div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>Data device support berhasil ditambah !</div>');


            redirect('archived');
        } else {         
             $user = $this->session->userdata('username');
            $data['no_inventaris'] = $this->m_kode_inventory->createNewCode('Device',mdate('%Y-%m-%d %H:%i:%s', now()),$user);                           
            $this->template->display('device/tambah',$data);
        }
    }	
    
    function edit() {  
        $this->form_validation->set_rules('lokasi', 'Lokasi Penggunaan', 'required');   
        $this->form_validation->set_rules('spek', 'Spesifikasi', 'required');
        $this->form_validation->set_rules('jenis', 'device Device', 'required');   
        $this->form_validation->set_rules('tgl_inv', 'Tgl. Inventaris', 'required');
            if ($this->form_validation->run() == true) {
                $data = array( 
                        'lokasi' => $this->input->post('lokasi'),
                        'jenis_device' => $this->input->post('jenis'),
                        'spesifikasi' => $this->input->post('spek'),
                        'tgl_inv' =>$this->input->post('tgl_inv'),
                        'harga_beli' =>$this->input->post('harga'),
                        'status' =>$this->input->post('status')
                    );
                $kode=$this->input->post('kode');
                $this->m_device->update($kode,$data);
                redirect('device/detail/'.$kode);                
            }else {
                $id = $this->uri->segment(3);                                           
                $data['recordall'] = $this->m_device->get_inv($id)->row_array();
                $data['record'] = $this->m_device->getkode($id)->row_array();                
                $data['history']=$this->m_laptop->get_history($id)->result();
                $this->session->set_flashdata('result_edit', '<br><div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>Data device support berhasil diedit !</div>');
                $this->template->display('device/detail', $data); 
        }            
    }

    function history() {              
        $this->form_validation->set_rules('lokasi', 'Lokasi Penempatan', 'required');
        $this->form_validation->set_rules('tgl_update', 'Tgl Update', 'required');
        $this->form_validation->set_rules('catatan', 'Catatan/ Keterangan', 'required'); 
        if ($this->form_validation->run() == true) {                  
            $data = array(
                'tgl_update' => $this->input->post('tgl_update'),
                'no_inventaris' => $this->input->post('no_inv'),
                'status' => $this->input->post('status'),
                'admin' => $this->session->userdata('nama'),
                'lokasi' => $this->input->post('lokasi'),
                'note' => $this->input->post('catatan')                
            );             
            $kode=$this->input->post('no_inv');         
            $this->m_laptop->history($data);
            $data2=array('lokasi'=>$this->input->post('lokasi'));
            $this->m_device->update($kode,$data2);            
            redirect('device/detail/'.$kode);
        } else { 
            $id = $this->uri->segment(3);              
            $data['recordall'] = $this->m_device->get_inv($id)->row_array();                      
            $this->template->display('device/history',$data);
        }
    }

    function edithistory($id) {              
        $this->form_validation->set_rules('pengguna', 'Nama Pengguna', 'required');
        $this->form_validation->set_rules('tgl_update', 'Tgl Update', 'required');
        $this->form_validation->set_rules('catatan', 'Catatan/ Keterangan', 'required'); 
        if ($this->form_validation->run() == true) {                  
            $data = array(
                'tgl_update' => $this->input->post('tgl_update'),
                'status' => $this->input->post('status'),
                'id_pengguna' => $this->input->post('pengguna'),
                'note' => $this->input->post('catatan')                
            ); 
            $id=$this->input->post('id');          
            $kode=$this->input->post('no_inv'); 
            $this->m_laptop->update_mutasi($id,$data);
            redirect('device/detail/'.$kode);
        } else { 
            $data['record'] = $this->m_device->get_mutasi($id)->row_array(); 
            $this->template->display('device/edithistory',$data);
        }
    }         

    function detail() { 
        $value = $this->uri->segment(3);
        $param1 = $this->uri->segment(4);
        $param2 = $this->uri->segment(5);
        $bulan = $this->uri->segment(6);
        $tahun = $this->uri->segment(7);
        $strings = array($value,$param1,$param2,$bulan,$tahun);
        $id = implode('/', $strings);                                         
        $data['recordall'] = $this->m_device->get_inv($id)->row_array();
        $data['record'] = $this->m_device->getkode($id)->row_array();        
        $data['history']=$this->m_device->get_history($id)->result();
        $this->template->display('device/detail', $data);            
    }

    function delete($kode) {
        if ($this->session->userdata('role')=='Administrator'){
            $this->session->set_flashdata('result_hapus', '<br><div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>Anda berhasil menghapus data device support !</div>');

            $this->m_device->hapus($kode);
            redirect('archived');
        }else{
            $this->session->set_flashdata('result_hapus', '<br><p class="text-red">Maaf Anda tidak di ijinkan menghapus data ini !</p>');
           redirect('archived');
        }       
        
    }

    function _set_rules() {
        $this->form_validation->set_rules('lokasi', 'Lokasi Penggunaan', 'required');   
        $this->form_validation->set_rules('spek', 'Spesifikasi', 'required');
        $this->form_validation->set_rules('jenis', 'device Device', 'required');
        $this->form_validation->set_message('is_unique', '%s Sudah Ada'); 
        $this->form_validation->set_rules('tgl_inv', 'Tgl. Inventaris', 'required');  
        $this->form_validation->set_error_delimiters("<div class='alert alert-danger alert-dismissable'>", "</div>");
    }

}

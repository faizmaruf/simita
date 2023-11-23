<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Archived extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model(array('m_komputer','m_laptop','m_monitor','m_printer','m_network',"m_device"));
        chek_session();
    }
	
    function index() {             
        $this->template->display('archived/inventory');       
    }		
   
    function view_laptop(){        
        $ambildata=$this->m_laptop->getAllLaptops()->result();
        // var_dump($ambildata);
        // die;
            
        $no=1;
        foreach($ambildata as $r) {  
    
            if ($r->status =="RUSAK/NOT FIXABLE"){
                $status="<span class='label label-danger'>" . $r->status. "</span>";
            }elseif($r->status =="HILANG/DICURI") {
                $status="<span class='label label-danger'>" .$r->status."</span>";
            }elseif($r->status =="ARSIP/DISIMPAN") {
                $status="<span class='label label-warning'>" .$r->status."</span>";
            }else{
				$status="<span class='label label-warning'>" .$r->status."</span>";
			}
            $data[] = array(
                'no'=>$no++,
                'no_inventaris'=>$r->no_inventaris,
                'nama_pengguna'=>$r->nama_pengguna,       
                'tgl_inv'=>tgl_indo($r->tgl_inv),
                'tipe_laptop'=>$r->tipe_laptop, 
                'spesifikasi'=>$r->spesifikasi, 
                'status'=>$status, 
                'view'=>anchor('laptop/detail/' . $r->no_inventaris, '<i class="btn btn-info btn-sm fa fa-eye" data-toggle="tooltip" title="View Detail"></i>'),
                'delete'=>anchor('laptop/delete/' . $r->id_laptop, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data Akan di Hapus?')")),
            );
        }
        $result=array('aaData'=>$data);
        echo  json_encode($result);
    }   

    function view_komputer(){        
   
        $ambildata=$this->m_komputer->getAllKomputers()->result();
        // var_dump($ambildata);
        // die;

        $no=1;

        foreach($ambildata as $r) {  
      
            if ($r->status =="RUSAK/NOT FIXABLE"){
                $status="<span class='label label-danger'>" . $r->status. "</span>";
            }elseif($r->status =="HILANG/DICURI") {
                $status="<span class='label label-danger'>" .$r->status."</span>";
            }elseif($r->status =="ARSIP/DISIMPAN") {
                $status="<span class='label label-warning'>" .$r->status."</span>";
            }else{
				$status="<span class='label label-warning'>" .$r->status."</span>";
			}    
            $query[] = array(
                'no'=>$no++,
                'no_inventaris'=>$r->no_inventaris,
                'nama_pengguna'=>$r->nama_pengguna, 
                         
                'tgl_inv'=>tgl_indo($r->tgl_inv),
                'nama_komputer'=>$r->nama_komputer, 
                'spesifikasi'=>$r->spesifikasi, 
                'sn'=>$r->serial_number, 
                'ip'=>$r->network, 
                'status'=>$status, 
                'edit'=>anchor('komputer/detail/' . $r->no_inventaris, '<i class="btn btn-info btn-sm fa fa-eye" data-toggle="tooltip" title="View Detail"></i>'),
                'delete'=>''.anchor('komputer/delete/' . $r->id_komputer, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data Akan di Hapus?')")).'',                
            );
        }        
        $result=array('aaData'=>$query);
        echo  json_encode($result);
    }  

    function view_monitor(){        
        
        // if ($this->session->userdata('role')=='Administrator'){
        //     $ambildata=$this->m_monitor->semua_arsip()->result();
        // }else{
        //     $ambildata=$this->m_monitor->semuagid_arsip()->result();
        // } 
        $ambildata=$this->m_monitor->getAllMonitors()->result(); 
        $no=1;
        foreach($ambildata as $r) {  
            
            if ($r->status =="RUSAK/NOT FIXABLE"){
                $status="<span class='label label-danger'>" . $r->status. "</span>";
            }elseif($r->status =="HILANG/DICURI") {
                $status="<span class='label label-danger'>" .$r->status."</span>";
            }elseif($r->status =="ARSIP/DISIMPAN") {
                $status="<span class='label label-warning'>" .$r->status."</span>";
            }else{
				$status="<span class='label label-warning'>" .$r->status."</span>";
			}      
            $query[] = array(
                'no'=>$no++,
                'no_inventaris'=>$r->no_inventaris,
                'nama_pengguna'=>$r->nama_pengguna, 
                     
                'tgl_inv'=>tgl_indo($r->tgl_inv),
                'jenis_monitor'=>$r->jenis_monitor, 
                'spesifikasi'=>$r->spesifikasi,                  
                'status'=>$status, 
                'edit'=>anchor('monitor/detail/' . $r->no_inventaris, '<i class="btn btn-info btn-sm fa fa-eye" data-toggle="tooltip" title="View Detail"></i>'),
                'delete'=>''.anchor('monitor/delete/' . $r->id_monitor, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data Akan di Hapus?')")).'',                
            );
        }        
        $result=array('data'=>$query);
        echo  json_encode($result);
    }   

    function view_printer(){        
        //$criteria = $this->db->query("SELECT * FROM tb_kecamatan ORDER BY kota_id ASC");
        // if ($this->session->userdata('role')=='Administrator'){
        //     $ambildata=$this->m_printer->semua_arsip()->result();
        // }else{
        //     $ambildata=$this->m_printer->semuagid_arsip()->result();
        // } 
        $ambildata=$this->m_printer->getAllPrinters()->result();  

        $no=1;
        foreach($ambildata as $r) {  
 
            if ($r->status =="RUSAK/NOT FIXABLE"){
                $status="<span class='label label-danger'>" . $r->status. "</span>";
            }elseif($r->status =="HILANG/DICURI") {
                $status="<span class='label label-danger'>" .$r->status."</span>";
            }elseif($r->status =="ARSIP/DISIMPAN") {
                $status="<span class='label label-warning'>" .$r->status."</span>";
            }else{
				$status="<span class='label label-warning'>" .$r->status."</span>";
			}       
            $query[] = array(
                'no'=>$no++,
                'no_inventaris'=>$r->no_inventaris,
                'nama_pengguna'=>$r->nama_pengguna,          
                'tgl_inv'=>tgl_indo($r->tgl_inv),
                'jenis_printer'=>$r->jenis_printer, 
                'spesifikasi'=>$r->spesifikasi,                  
                'status'=>$status, 
                'edit'=>anchor('printer/detail/' . $r->no_inventaris, '<i class="btn btn-info btn-sm fa fa-eye" data-toggle="tooltip" title="View Detail"></i>'),
                'delete'=>anchor('printer/delete/' . $r->id_printer, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data Akan di Hapus?')")),                
            );
        }        
        $result=array('data'=>$query);
        echo  json_encode($result);
    }   

    function view_device(){        
        //$criteria = $this->db->query("SELECT * FROM tb_kecamatan ORDER BY kota_id ASC");
        // if ($this->session->userdata('role')=='Administrator'){
        //     $ambildata=$this->m_network->semua_arsip()->result();
        // }else{
        //     $ambildata=$this->m_network->semuagid_arsip()->result();
        // }  
        $ambildata=$this->m_device->getAllDevices()->result();  
        // var_dump($ambildata);
        // die;
        $no=1;
        foreach($ambildata as $r) {
            if ($r->status =="RUSAK/NOT FIXABLE"){
                $status="<span class='label label-danger'>" . $r->status. "</span>";
            }elseif($r->status =="HILANG/DICURI") {
                $status="<span class='label label-danger'>" .$r->status."</span>";
            }elseif($r->status =="ARSIP/DISIMPAN") {
                $status="<span class='label label-warning'>" .$r->status."</span>";
            }else{
				$status="<span class='label label-warning'>" .$r->status."</span>";
			}   
            $query[] = array(
                'no'=>$no++,
                'no_inventaris'=>$r->no_inventaris,
                'lokasi'=>strtoupper($r->lokasi),                         
                'tgl_inv'=>tgl_indo($r->tgl_inv),
                'jenis_device'=>strtoupper($r->jenis_device), 
                'spesifikasi'=>$r->spesifikasi,                  
                'status'=>$status, 
                'edit'=>anchor('device/detail/' . $r->no_inventaris, '<i class="btn btn-info btn-sm fa fa-eye" data-toggle="tooltip" title="View Detail"></i>'),
                'delete'=>anchor('device/delete/' . $r->id_device, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data Akan di Hapus?')")),                
            );
        }        
        $result=array('data'=>$query);
        echo  json_encode($result);
    }   

    
}

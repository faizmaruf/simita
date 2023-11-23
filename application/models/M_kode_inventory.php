<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_kode_inventory extends CI_Model {    

    function _convertToRomanMonth($datetime) {
    $date = new DateTime($datetime);
    $month = intval($date->format('m'));
    
    
    $romawi = array(
        1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI',
        7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X', 11 => 'XI', 12 => 'XII'
    );
 

    return $romawi[$month];
    } 
    
    function createNewCode($nama_barang,$waktu,$user)
    {   

        $kode = $this->db->query("SELECT * FROM tbl_inv_kode where tbl_inv_kode.nama_barang = '$nama_barang'")->result()[0];
        $month = $this->_convertToRomanMonth($waktu) ;
        $value = $kode->value+1;
        $no_inventaris = str_pad($value , 5, '0', STR_PAD_LEFT).'/'  . $kode->param1.'/'  .$kode->param2 .'/'  .$month.'/'  .date("Y", strtotime($kode->created_at));
        // var_dump($no_inventaris);
        // die;
       

        return $no_inventaris;
    }
    function updateTableInvKode($no_inventaris,$nama_barang,$user){
        $now = now();
        $datetimeNow = date('Y-m-d H:i:s', $now);
        $kode = $this->db->query("SELECT * FROM tbl_inv_kode where tbl_inv_kode.nama_barang = '$nama_barang'")->result()[0];
        $value = $kode->value+1;
        // var_dump($no_inventaris);
        // die;
          // update di tabel "tbl_inv_kode" value, used_by, last_used, update_at
        $this->db->query("UPDATE tbl_inv_kode SET last_used = '$no_inventaris', value = '$value',updated_at ='$datetimeNow', used_by = '$user' WHERE tbl_inv_kode.nama_barang = '$nama_barang'");
    }
    


}

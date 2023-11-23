<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class M_device extends CI_Model {    

    function getAllDevices(){
        return $this->db->query("SELECT * FROM tb_inv_device ");
    }

    function semua1() {
        $this->db->order_by('id_device','DESC');
        return $this->db->get('tb_inv_device');
    }

    function semua() {
        $gid=$this->session->userdata('gid');
        $query= $this->db->query("SELECT tb_inv_device.id_device,tb_inv_device.kode_device,tb_inv_device.lokasi,tb_inv_device.jenis_device,tb_inv_device.spesifikasi,tb_inv_device.tgl_inv,tb_inv_device.harga_beli,tb_inv_device.status,tb_inv_device.gid FROM tb_inv_device WHERE tb_inv_device.status='DIGUNAKAN' OR tb_inv_device.status='DIPERBAIKI' OR tb_inv_device.status='SIAP DIGUNAKAN' ORDER BY tb_inv_device.id_device DESC");
        return $query;
    }

    function semuagid() {
        $gid=$this->session->userdata('gid');
        $query= $this->db->query("SELECT tb_inv_device.id_device,tb_inv_device.kode_device,tb_inv_device.lokasi,tb_inv_device.jenis_device,tb_inv_device.spesifikasi,tb_inv_device.tgl_inv,tb_inv_device.harga_beli,tb_inv_device.status,tb_inv_device.gid FROM tb_inv_device 
		WHERE tb_inv_device.gid ='$gid' AND tb_inv_device.status='DIGUNAKAN' 
		OR tb_inv_device.gid ='$gid' AND tb_inv_device.status='DIPERBAIKI' 
		OR tb_inv_device.gid ='$gid' AND tb_inv_device.status='SIAP DIGUNAKAN' 
		OR tb_inv_device.gid ='$gid' AND tb_inv_device.status='DIPINJAMKAN' 
		ORDER BY tb_inv_device.id_device DESC");
        return $query;
    }

    function semua_arsip() {
        $gid=$this->session->userdata('gid');
        $query= $this->db->query("SELECT tb_inv_device.id_device,tb_inv_device.kode_device,tb_inv_device.lokasi,tb_inv_device.jenis_device,tb_inv_device.spesifikasi,tb_inv_device.tgl_inv,tb_inv_device.harga_beli,tb_inv_device.status,tb_inv_device.gid FROM tb_inv_device WHERE tb_inv_device.status='ARSIP/DISIMPAN' OR tb_inv_device.status='RUSAK/NOT FIXABLE' OR tb_inv_device.status='HILANG/DICURI' ORDER BY tb_inv_device.id_device DESC");
        return $query;
    }

    function semuagid_arsip() {
        $gid=$this->session->userdata('gid');
        $query= $this->db->query("SELECT tb_inv_device.id_device,tb_inv_device.kode_device,tb_inv_device.lokasi,tb_inv_device.jenis_device,tb_inv_device.spesifikasi,tb_inv_device.tgl_inv,tb_inv_device.harga_beli,tb_inv_device.status,tb_inv_device.gid FROM tb_inv_device 
		WHERE tb_inv_device.gid ='$gid' AND tb_inv_device.status='ARSIP/DISIMPAN' 
		OR tb_inv_device.gid ='$gid' AND tb_inv_device.status='RUSAK/NOT FIXABLE' 
		OR tb_inv_device.gid ='$gid' AND tb_inv_device.status='HILANG/DICURI' 
		ORDER BY tb_inv_device.id_device DESC");
        return $query;
    }

    function get_inv($id) {
        $kode = array('no_inventaris' => $id);
        return $this->db->get_where('tb_inv_device', $kode);
    }

    function getkode($id) {
        $kode = array('no_inventaris' => $id);
        return $this->db->get_where('tb_inv_device', $kode);
    }
   
    function kdotomatis() {
    	$group=$this->db->get_where('tb_group',array('gid'=>$this->session->userdata('gid')))->row_array();
    	$kode=$group['nama_alias'];
        $jenis = "NET-".$kode."-".date('y');
        $query = $this->db->query("SELECT max(kode_device) as maxID FROM tb_inv_device WHERE kode_device LIKE '$jenis%'");
        $data = $query->row_array();
        $idMax = $data['maxID'];
        $noUrut = (int) substr($idMax, 10, 3);
        $noUrut++;
        $newID = $jenis . sprintf("%03s", $noUrut);
        return $newID;       
    }

    function getpengguna() {
        $gid=$this->session->userdata('gid');
        $query=$this->db->query("SELECT tb_pengguna.id_pengguna,tb_pengguna.nama_pengguna 
            FROM tb_pengguna INNER JOIN tb_departemen ON tb_departemen.id_dept = tb_pengguna.id_dept INNER JOIN tb_group ON tb_group.gid = tb_departemen.gid 
            WHERE tb_departemen.gid ='$gid' ORDER BY tb_pengguna.nama_pengguna ASC");
        return $query;
    }

    function get_history($id){
        return $this->db->get_where('tb_inv_history',array('no_inventaris'=>$id));        
    }

    function get_mutasi($id){
        $query=$this->db->query("SELECT tb_inv_history.id_history,tb_inv_history.no_inventaris,tb_inv_history.tgl_update,tb_inv_history.status,tb_inv_history.admin,tb_inv_history.id_pengguna,tb_inv_history.lokasi,tb_inv_history.note,tb_inv_device.jenis_device,tb_inv_device.spesifikasi FROM tb_inv_history INNER JOIN tb_inv_device ON tb_inv_device.kode_device = tb_inv_history.no_inventaris WHERE tb_inv_history.id_history ='$id'");
        return $query;
    }
        
    function simpan($data) {
        $this->db->insert('tb_inv_device', $data);
        return $this->db->insert_id();
    }

    function simpan_history($data2) {
        $this->db->insert('tb_inv_history', $data2);
        return $this->db->insert_id();
    }

    function update($kode,$data) {        
        $this->db->where('no_inventaris', $kode);
        $this->db->update('tb_inv_device', $data);
    }

    function hapus($kode) {
        $this->db->where('id_device', $kode);
        $this->db->delete('tb_inv_device');
    }
}

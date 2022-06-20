<?php
class database{
	var $host="localhost";
	var $name="root";
	var $pass="";
	var $db="db_toko";
	var $koneksi="";
	
	function __construct(){
	$this->koneksi=mysqli_connect($this->host, $this->name, 
	$this->pass, $this->db);
	//echo "berhasil";
	}
	function tampil_data(){
	$query="select * from user";
	$data=mysqli_query($this->koneksi, $query);
	while($row=mysqli_fetch_array($data)){
		$hasil[]=$row;
	}
	return $hasil;
	}
	function input($nama,$alamat,$usia){
	mysqli_query($this->koneksi,"insert into
		user values('','$nama','$alamat','$usia')");
	}
	function hapus($id){
	mysqli_query($this->koneksi,"delete from user
	where id_user='$id'");
	}
	function edit($id){
	$data=mysqli_query($this->koneksi,"select * from 
	user where id_user='$id'");
	while ($id=mysqli_fetch_array($data)){
		$hasil[]=$id;
		}
		return $hasil;
	} 
	function update($id, $nama,$alamat,$usia){
	mysqli_query($this->koneksi, "update user set
	nama='$nama', alamat='$alamat',usia='$usia' 
	where id_user='$id'");
	}
	function detail($id){
	$data=mysqli_query($this->koneksi,"select * from 
	user where id_user='$id'");
	while ($id=mysqli_fetch_array($data)){
		$d[]=$id;
		}
		return $d;
	} 
	
	
	
	}
		
	?>
	

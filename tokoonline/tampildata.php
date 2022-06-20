<?php
//memanggil file database.php
include 'database.php';
//instansiasi objek dari class database
$db=new database();
$datauser=$db->tampil_data();
?>
<h1>TOKO ONLINE MAJU BARU</h1>
<h3>Data User</h3>
<a href="input_user.php">Tambah Data</a>
<table border="1">
	<tr>
		<th width="30">NO</th>
		<th width="130">Nama</th>
		<th width="300">Alamat</th>
		<th width="50">Usia</th>
		<th width="150">Opsi</th>
	</tr>
	<?php
	$no=0;
	foreach($datauser as $row){
		$no++;
	?>
	<tr>
		<td ><?php echo $no;?></td>
		<td ><a href="detail_data.php?id=<?php echo $row['id_user'];?>"><?php echo $row['nama'];?></a></td>
		<td ><?php echo $row['alamat'];?></td>
		<td ><?php echo $row['usia'];?></td>
		<td align="center"><a href="form_edit.php?aksi=edit&
		id=<?php echo $row['id_user'];?>">
		EDIT</a> | <a href="proses.php?aksi=hapus&
		id=<?php echo $row['id_user'];?>">
		HAPUS</a></td>
	</tr>
	<?php } ?>
</table>
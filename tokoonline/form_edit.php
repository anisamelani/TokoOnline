<?php
include "database.php";
$db=new database();
// nama file form_edit.php
?>
<h3> Edit Data User</h3>
<form action="proses.php?aksi=update" method="post">
<?php
foreach($db->edit($_GET['id']) as $d){
?>
<table width="400" border="0">

<tr>
	<td>Nama </td>
	<td>: </td>
	<td>

	<input type="hidden" name="id" 
	value="<?php echo $d['id_user'];?>">
	<input type="text" name="nama" size="35" 
	value="<?php echo $d['nama'];?>"> </td>
</tr>
<tr>
	<td>Alamat </td>
	<td>: </td>
	<td><input type="text" name="alamat" size="75"
	value="<?php echo $d['alamat'];?>"> </td>
</tr>
<tr>
	<td>Usia </td>
	<td>: </td>
	<td><input type="text" name="usia" size="25"
	value="<?php echo $d['usia'];?>"> </td>
</tr>
<tr>
	<td>&nbsp; </td>
	<td>&nbsp;</td>
	<td><input type="submit" name="edit" value="edit"> </td>
</tr>
<?php }?>
</table>
</form>
